<?php

namespace App\Http\Controllers\frontend;

use App\Http\Controllers\Controller;
use App\Models\Course;
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
            'message'=>'Course Created Successfully'
        ],200);
    }
}
