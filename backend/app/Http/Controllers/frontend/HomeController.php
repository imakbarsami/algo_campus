<?php

namespace App\Http\Controllers\frontend;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Course;
use App\Models\Language;
use App\Models\Level;
use Illuminate\Http\Request;

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

        $courses=Course::orderBy('created_at','asc')->where('is_featured','no')->where('status',1)->with('level')->get();

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

        $courses=$courses->with('level')->get();

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
                      ->with([
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

}
