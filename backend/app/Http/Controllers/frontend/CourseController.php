<?php

namespace App\Http\Controllers\frontend;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Course;
use App\Models\Language;
use App\Models\Level;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CourseController extends Controller
{
    public function index(){

    }

    public function store(Request $request){

        $validate=Validator::make($request->all(),[
            'title'=>'required|min:5'
        ]);

        if($validate->fails()){
            return response()->json([
                'status'=>400,
                'errors'=>$validate->errors()
            ],400);
        }

        $course=new Course();
        $course->title=$request->title;
        $course->user_id=$request->user()->id;
        $course->status=0;
        $course->save();

        return response()->json([
            'status'=>200,
            'data'=>$course,
            'message'=>'Course Created Successfully'
        ],200);
    }

    //category,level,language data
    public function metaData(){

        $categories=Category::all();
        $levels=Level::all();
        $languages=Language::all();

        return response()->json([
            'status'=>200,
            'categories'=>$categories,
            'levels'=>$levels,
            'languages'=>$languages
        ],200);

    }

    public function edit($id){

        $course=Course::find($id);
        if(!$course){
            return response()->json([
                'status'=>404,
                'message'=>'Course Not Found'
            ],404);
        }


        return response()->json([
            'status'=>200,
            'data'=>$course
        ],200);
    }


    public function update(Request $request,$id){

        $validate=Validator::make($request->all(),[
            'title'=>'required|min:5',
            'category'=>'required',
            'level'=>'required',
            'language'=>'required',
            'sell_price'=>'required',
            'cross_price'=>'required'

        ]);

        if($validate->fails()){
            return response()->json([
                'status'=>400,
                'errors'=>$validate->errors()
            ],400);
        }

        $course=Course::find($id);
        $course->title=$request->title;
        $course->category_id=$request->category;
        $course->level_id=$request->level;
        $course->language_id=$request->language;
        $course->description=$request->description;
        $course->price=$request->sell_price;
        $course->cross_price=$request->cross_price;
        $course->save();

        return response()->json([
            'status'=>200,
            'data'=>$course,
            'message'=>'Course Updated Successfully'
        ],200);
    }
}
