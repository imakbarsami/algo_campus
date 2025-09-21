<?php

namespace App\Http\Controllers\frontend;

use App\Http\Controllers\Controller;
use App\Models\Lesson;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;

class LessonController extends Controller
{
    public function store(Request $request) {

        $validator=Validator::make($request->all(),[
            'chapter'=>'required',
            'lesson'=>'required',
        ]);

        if($validator->fails()){
            return response()->json([
                'status'=>400,
                'errors'=>$validator->errors()
            ],400);
        }

        $lesson=new Lesson();
        $lesson->chapter_id=$request->chapter;
        $lesson->title=$request->lesson;
        $lesson->sort_order=1000;
        $lesson->status=$request->status;
        $lesson->save();

        return response()->json([
            'status'=>200,
            'data'=>$lesson,
            'message'=>'Lesson added successfully'
        ],200);
    }

    public function edit($id){

        $lesson=Lesson::find($id);
        
        if(!$lesson){
            return response()->json([
                'status'=>404,
                'message'=>'Lesson not found',
            ],404);
        }
        return response()->json([
            'status'=>200,
            'data'=>$lesson,
        ],200);
    }

    public function update(Request $request,$id){

        $lesson=Lesson::find($id);
        if(!$lesson){
            return response()->json([
                'status'=>404,
                'message'=>'Lesson not found',
            ],404);
        }

        $validator=Validator::make($request->all(),[
            'chapter'=>'required',
            //'lesson'=>'required',
        ]);

        if($validator->fails()){
            return response()->json([
                'status'=>400,
                'errors'=>$validator->errors()
            ],400);
        }

        $lesson->chapter_id=$request->chapter;
        $lesson->title=$request->title;
        $lesson->is_free_premium=$request->free_preview?'yes':'no';
        $lesson->duration=$request->duration;
        $lesson->description=$request->description;
        $lesson->status=$request->status;
        $lesson->save();

        return response()->json([
            'status'=>200,
            'data'=>$lesson,
            'message'=>'Lesson updated successfully'
        ],200);
    }

    public function destroy($id){

        $lesson=Lesson::find($id);
        if(!$lesson){
            return response()->json([
                'status'=>404,
                'message'=>'Lesson not found',
            ],404);
        }
        $lesson->delete();
        return response()->json([
            'status'=>200,
            'message'=>'Lesson deleted successfully'
        ],200);
    }

    public function saveVideo(Request $request,$id){

        $lesson=Lesson::find($id);
        if(!$lesson){
            return response()->json([
                'status'=>404,
                'message'=>'Lesson not found',
            ],404);
        }

        $validator=Validator::make($request->all(),[
            'video'=>'required|mimes:mp4',
        ]);

        if($validator->fails()){
            return response()->json([
                'status'=>400,
                'errors'=>$validator->errors()
            ],400);
        }

        $oldVideo=$lesson->video;

        if($oldVideo){
            if(File::exists(public_path('uploads/courses/videos/'.$oldVideo))){
                File::delete(public_path('uploads/courses/videos/'.$oldVideo));
            }
        }

        $ext=$request->video->getClientOriginalExtension();
        $newVideo=strtotime('now').'-'.$lesson->id.'.'.$ext;
        $request->video->move(public_path('uploads/courses/videos/'),$newVideo);

        $lesson->video=$newVideo;
        $lesson->save();

        return response()->json([
            'status'=>200,
            'data'=>$lesson,
            'message'=>'Video uploaded successfully'
        ],200);
    }
}
