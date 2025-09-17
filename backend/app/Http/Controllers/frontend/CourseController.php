<?php

namespace App\Http\Controllers\frontend;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Course;
use App\Models\Language;
use App\Models\Level;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;
use Intervention\Image\ImageManager;
use Intervention\Image\Drivers\Gd\Driver;

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

        $course=Course::with('chapters')->find($id);
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

    public function saveCourseImage(Request $request,$id){

        $validator=Validator::make($request->all(),[
            'image'=>'required|mimes:jpg,jpeg,png'
        ]);
        
        if($validator->fails()){
            return response()->json([
                'status'=>400,
                'errors'=>$validator->errors()
            ],400);
        }

        $course=Course::find($id);
        if(!$course){
            return response()->json([
                'status'=>404,
                'message'=>'Course Not Found'
            ],404);
        }

        $oldImage=$course->image;
        if($oldImage){

            if(File::exists(public_path('uploads/courses/'.$oldImage))){
                File::delete(public_path('uploads/courses/'.$oldImage));
            }

            if(File::exists(public_path('uploads/courses/small/'.$oldImage))){
                File::delete(public_path('uploads/courses/small/'.$oldImage));
            }
        }

        $ext=$request->image->getClientOriginalExtension();
        $imageName=strtotime('now').'-'.$course->id.'.'.$ext;
        $courseImage=$request->image->move(public_path('uploads/courses'),$imageName);


        $manager = new ImageManager(Driver::class);
        $image = $manager->read($courseImage);
        $smallImage = $image->cover(750, 450);
        $smallImage->save(public_path('uploads/courses/small/'.$imageName));

        $course->image=$imageName;
        $course->save();

        return response()->json([
            'status'=>200,
            'data'=>$course,
            'message'=>'Course Image Uploaded Successfully',
        ],200);
    }
}
