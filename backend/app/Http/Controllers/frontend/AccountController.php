<?php

namespace App\Http\Controllers\frontend;

use App\Http\Controllers\Controller;
use App\Models\Activity;
use App\Models\Chapter;
use App\Models\Course;
use App\Models\Enrollment;
use App\Models\Lesson;
use App\Models\Review;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AccountController extends Controller
{
    public function register(Request $request){

        $validate=Validator::make($request->all(),[
            'name'=>'required|min:4',
            'email'=>'required|email|unique:users',
            'password'=>'required|min:8',
        ]);

        if($validate->fails()){
            return response()->json([
                'status'=>400,
                'errors'=>$validate->errors()
            ],400);
        }

        $user=new User();
        $user->name=$request->name;
        $user->email=$request->email;
        $user->password=Hash::make($request->password);
        $user->save();

        return response()->json([
            'status'=>200,
            'message'=>'User Register Successfully',
        ],200);
    }

    public function authenticate(Request $request){

        $validate=Validator::make($request->all(),[
            'email'=>'required|email|exists:users',
            'password'=>'required',
        ]);

        if($validate->fails()){
            return response()->json([
                'status'=>404,
                'errors'=>$validate->errors()
            ],400);
        }

        if(Auth::attempt(['email'=>$request->email,'password'=>$request->password])){

            $user=User::find(Auth::user()->id);
            $token=$user->createToken('token')->plainTextToken;

            return response()->json([
                'status'=>200,
                'token'=>$token,
                'name'=>$user->name,
                'id'=>$user->id
            ],200);

        }else{
            return response()->json([
                'status'=>401,
                'message'=>'invalid email or password',
            ],401);
        }
    }

    public function courses(Request $request){

        $courses=Course::where('user_id',$request->user()->id)
                        ->withCount('enrollments')
                        ->withCount('reviews')
                        ->withSum('reviews','rating')
                        ->with('level')
                        ->get();

        $courses->map(function($course){
            $course->avg_rating=$course->reviews_count>0?
                number_format(($course->reviews_sum_rating/$course->reviews_count),1):"0.0";
        });
        return response()->json([
            'status'=>200,
            'courses'=>$courses,
        ],200);
    }

    public function enrollments(Request $request){

        $enrollments=Enrollment::where('user_id',$request->user()->id)
                                ->with([
                                    'course'=>function($q){
                                        $q->withCount('reviews');
                                        $q->withSum('reviews','rating');
                                        $q->withCount('enrollments');
                                    },
                                    'course.level'
                                ])->get();

        $enrollments->map(function($enrollment){
            $enrollment->avg_rating=$enrollment->course->reviews_count>0?
                number_format(($enrollment->course->reviews_sum_rating/$enrollment->course->reviews_count),1):"0.0";
        });

        return response()->json([
            'status'=>200,
            'data'=>$enrollments,
        ],200);
    }

    public function watchCourse($id,Request $request){

        $count=Enrollment::where('user_id',$request->user()->id)->where('course_id',$id)->count();
      
        if($count==0){
            return response()->json([
                'status'=>404,
                'message'=>'You are not enrolled in this course',
            ],404);
        }

        $course=Course::where('id',$id)->withCount('chapters')
                      ->with([
                        'level',
                        'category',
                        'language',
                        'chapters'=>function($q){
                            $q->withCount(['lessons'=>function($q){
                                $q->where('status',1);
                                $q->whereNotNull('video');
                            }]);
                            $q->withSum(['lessons'=>function($q){
                                $q->where('status',1);
                                $q->whereNotNull('video');
                            }],'duration');  
                        },
                        'chapters.lessons'=>function($q){
                            $q->where('status',1);
                            $q->whereNotNull('video');
                        }
                      ])->first();
        
        $activeLesson=collect();
        $activityCount=Activity::where([
            'user_id'=>$request->user()->id,
            'course_id'=>$id
        ])->count();

        //dd($activityCount);

        if($activityCount==0){

            $chapter=Chapter::where('course_id',$id)->orderBy('sort_order','asc')->first();
            $lesson=Lesson::where('chapter_id',$chapter->id)
                            ->where('status',1)
                            ->whereNotNull('video')
                            ->orderBy('sort_order','asc')
                            ->first();
            
            $activity=new Activity();
            $activity->course_id=$id;
            $activity->user_id=$request->user()->id;
            $activity->chapter_id=$chapter->id;
            $activity->lesson_id=$lesson->id;
            $activity->is_last_watched='yes';
            $activity->save();
            $activeLesson=$lesson;
        }else{
            $activity=Activity::where([
                'user_id'=>$request->user()->id,
                'course_id'=>$id,
                'is_last_watched'=>'yes'
            ])->first();

            //last lesson watched
            $lesson=Lesson::where('id',$activity->lesson_id)
                            ->where('status',1)
                            ->whereNotNull('video')
                            ->first();

            $activeLesson=$lesson;
        }

        //fetch completed lesson
        $completedLessons=Activity::where([
            'user_id'=>$request->user()->id,
            'course_id'=>$id,
            'is_completed'=>'yes'
        ])->pluck('lesson_id')
        ->toArray ();


        //completed lesson count
        $completedLessonsCount=Activity::where([
            'user_id'=>$request->user()->id,
            'course_id'=>$id,
            'is_completed'=>'yes'
        ])->count();

        //total lesson count
        $totalLessons=$course->chapters->sum('lessons_count');

        $progress=round(($completedLessonsCount/$totalLessons)*100);

    
        return response()->json([
            'status'=>200,
            'data'=>$course,
            'activeLesson'=>$activeLesson,
            'completedLessons'=>$completedLessons,
            'progress'=>$progress
        ],200);
    }

    public function saveUserActivity(Request $request){

        Activity::where([
            'user_id'=>$request->user()->id,
            'course_id'=>$request->course_id
        ])->update(['is_last_watched'=>'no']);

        Activity::updateOrInsert([
            'user_id'=>$request->user()->id,
            'course_id'=>$request->course_id,
            'chapter_id'=>$request->chapter_id,
            'lesson_id'=>$request->lesson_id,
        ],[
            'is_last_watched'=>'yes',
        ]);

        return response()->json([
            'status'=>200,
            'message'=>'Activity saved successfully',
        ],200);
    }

    public function markAsComplete(Request $request){

        Activity::where([
            'user_id'=>$request->user()->id,
            'course_id'=>$request->course_id,
            'chapter_id'=>$request->chapter_id,
            'lesson_id'=>$request->lesson_id,
        ])->update([
            'is_completed'=>'yes'
        ]);


        //fetch course for count lesson sum
        $course=Course::where('id',$request->course_id)->withCount('chapters')
                      ->with([
                        'chapters'=>function($q){
                            $q->withCount(['lessons'=>function($q){
                                $q->where('status',1);
                                $q->whereNotNull('video');
                            }]);
                            $q->withSum(['lessons'=>function($q){
                                $q->where('status',1);
                                $q->whereNotNull('video');
                            }],'duration');  
                        },
                        'chapters.lessons'=>function($q){
                            $q->where('status',1);
                            $q->whereNotNull('video');
                        }
                      ])->first();

        
        $totalLessons=$course->chapters->sum('lessons_count');

        //total completed lessons
        $completedLessonsCount=Activity::where([
            'user_id'=>$request->user()->id,
            'course_id'=>$request->course_id,
            'is_completed'=>'yes'
        ])->count();

        $progress=round(($completedLessonsCount/$totalLessons)*100);

        $completedLessons=Activity::where([
            'user_id'=>$request->user()->id,
            'course_id'=>$request->course_id,
            'is_completed'=>'yes'
        ])->pluck('lesson_id')
        ->toArray();

        return response()->json([
            'status'=>200,
            'message'=>'Mark as complete successfully',
            'completedLessons'=>$completedLessons,
            'progress'=>$progress
        ],200);
    }

    public function saveRating(Request $request){

        $ratingCount=Review::where([
            'user_id'=>$request->user()->id,
            'course_id'=>$request->course_id
        ])->count();

        if($ratingCount>0){
            return response()->json([
                'status'=>409,
                'message'=>'You have already rated this course'
            ],409);
        }

        $review=new Review();
        $review->user_id=$request->user()->id;
        $review->course_id=$request->course_id;
        $review->rating=$request->rating;
        $review->comment=$request->comment;
        $review->status=1;
        $review->save();

        return response()->json([
            'status'=>200,
            'message'=>'Review saved successfully'
        ],200);
    }


    public function fetchUser(Request $request){

        $user=User::find($request->user()->id);

        if(empty($user)){
            return response()->json([
                'status'=>404,
                'message'=>'User not found'
            ],404);
        }

        return response()->json([
            'status'=>200,
            'user'=>$user
        ],200);
    }


    public function updateUser(Request $request){

        $user=User::find($request->user()->id);

        if(empty($user)){
            return response()->json([
                'status'=>404,
                'message'=>'User not found'
            ],404);
        }

        $validator=Validator::make($request->all(),[
            'name'=>'required',
            'email'=>'required|email|unique:users,email,'.$user->id,
        ]);

        if($validator->fails()){
            return response()->json([
                'status'=>400,
                'errors'=>$validator->errors()
            ],400);
        }

        $user->name=$request->name;
        $user->email=$request->email;
        $user->save();

        return response()->json([
            'status'=>200,
            'user'=>$user,
            'message'=>'User updated successfully'
        ],200);
    }
}
