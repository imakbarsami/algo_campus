<?php

namespace App\Http\Controllers\frontend;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Course;
use App\Models\Enrollment;
use App\Models\Language;
use App\Models\Level;
use Illuminate\Http\Request;

use function PHPSTORM_META\map;

class HomeController extends Controller
{
    public function fetchCategories(){

        $categories=Category::orderBy('name','asc')->where('status',1)->get();

        return response()->json([
            'status'=>200,
            'data'=>$categories
        ],200);
    }

    public function fetchCourses(){

        $courses=Course::orderBy('created_at','asc')
                        ->where('is_featured','no')
                        ->withCount('enrollments')
                        ->withCount('reviews')
                        ->withSum('reviews','rating')
                        ->where('status',1)
                        ->with('level')
                        ->get();

        $courses->map(function($course){
            $course->avg_rating=$course->reviews_count>0?
                    number_format(($course->reviews_sum_rating/$course->reviews_count),1):"0.0";
        });

        return response()->json([
            'status'=>200,
            'data'=>$courses
        ],200);
    }

    public function courses(Request $request){

        $courses=Course::where('status',1);

        //filter by keyword
        if(!empty($request->keyword)){
            $courses->where('title','like','%'.$request->keyword.'%');
        }

        //filter by category
        if(!empty($request->category)){
            $catgoryArr=explode(',', $request->category);

            if($catgoryArr){
                $courses->whereIn('category_id', $catgoryArr);
            }
        }

        //filter by level
        if(!empty($request->level)){
            $levelArr=explode(',', $request->level);

            if($levelArr){
                $courses->whereIn('level_id', $levelArr);
            }
        }

        //filter by language
        if(!empty($request->language)){
            $languageArr=explode(',', $request->language);

            if($languageArr){
                $courses->whereIn('language_id', $languageArr);
            }        
        }

        //filter by sort
        if(!empty($request->sort)){
            $sortArr=['asc','desc'];

            if(in_array($request->sort, $sortArr)){
                $courses->orderBy('created_at', $request->sort);
            }else{
                $courses->orderBy('created_at', 'desc');
            }
        }

        $courses=$courses->with('level')
                        ->withCount('enrollments')
                        ->withSum('reviews','rating')
                        ->withCount('reviews')->get();

        $courses->map(function($course){
            $course->avg_rating=$course->reviews_count>0?
                    number_format(($course->reviews_sum_rating/$course->reviews_count),1):"0.0";
        });

        return response()->json([
            'status'=>200,
            'data'=>$courses
        ],200);
    }

    public function fetchLevels(){

        $levels=Level::orderBy('created_at','asc')->where('status',1)->get();

        return response()->json([
            'status'=>200,
            'data'=>$levels
        ],200);
    }

    public function fetchLanguages(){

        $languages=Language::orderBy('name','asc')->where('status',1)->get();

        return response()->json([
            'status'=>200,
            'data'=>$languages
        ],200);
    }

    public function course_detail($id){

        $course=Course::where(['id'=>$id,'status'=>1])
                      ->withCount('enrollments')
                      ->withCount('reviews')
                      ->withSum('reviews','rating')
                      ->withCount('chapters')
                      ->with([
                        'reviews',
                        'reviews.user',
                        'level',
                        'category',
                        'language',
                        'outcomes',
                        'requirements',
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

        $totalDuration=$course->chapters->sum('lessons_sum_duration');
        $totalLessons=$course->chapters->sum('lessons_count');
        $course->total_duration=$totalDuration;
        $course->total_lessons=$totalLessons;
                        

        //count reviews
        $course->avg_rating=$course->reviews_count>0?
                    number_format(($course->reviews_sum_rating/$course->reviews_count),1):"0.0";


        if(!$course){
            return response()->json([
                'status'=>404,
                'message'=>'Course not found'
            ],404);
        }

        return response()->json([
            'status'=>200,
            'data'=>$course
        ],200);
    }

    public function enrollCourse(Request $request){

        $course=Course::where(['id'=>$request->course_id])->first();
        if(!$course){
            return response()->json([
                'status'=>404,
                'message'=>'Course not found'
            ],404);
        }

        $alreadyEnroll=Enrollment::where(['user_id'=>$request->user()->id,'course_id'=>$request->course_id])->count();
        if($alreadyEnroll>0){
            return response()->json([
                'status'=>409,
                'message'=>'You are already enrolled in this course'
            ],409);
        }

        $enrollment=new Enrollment;
        $enrollment->user_id=$request->user()->id;
        $enrollment->course_id=$request->course_id;
        $enrollment->save();

        return response()->json([
            'status'=>200,
            'message'=>'You have successfully enrolled in this course'
        ],200); 
    }


    //popular categories
    public function popularCategories(){
        $categories=Category::withCount('courses')->having('courses_count','>=',2)->get();
        return response()->json([
            'status'=>200,
            'data'=>$categories
        ],200);
    }
}
