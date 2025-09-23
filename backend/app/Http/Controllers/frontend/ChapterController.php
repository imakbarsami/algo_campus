<?php

namespace App\Http\Controllers\frontend;

use App\Http\Controllers\Controller;
use App\Models\Chapter;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ChapterController extends Controller
{
    public function index(Request $request){
 
        $chapters=Chapter::where('course_id',$request->course_id)
                            ->orderBy('sort_order','asc')
                            ->get();
        //dd($chapter);
        return response()->json([
            'status'=>200,
            'data'=>$chapters,
        ],200);
    }


    public function store(Request $request){

        $validate=Validator::make($request->all(),[
            'course_id'=>'required',
            'chapter'=>'required|min:5',
        ]);

        if($validate->fails()){
            return response()->json([
                'status'=>400,
                'errors'=>$validate->errors()
            ],400);
        }

        $chapter=new Chapter();
        $chapter->course_id=$request->course_id;
        $chapter->title=$request->chapter;
        $chapter->sort_order=1000;
        $chapter->save();

        return response()->json([
            'status'=>200,
            'data'=>$chapter,
            'message'=>'Chapter added successfully',
        ],200);
    }


    public function update(Request $request,$id){

        $chapter=Chapter::find($id);

        if(!$chapter){
            return response()->json([
                'status'=>404,
                'message'=>'Chapter not found',
            ],404);
        }


        $validate=Validator::make($request->all(),[
            'chapter'=>'required|min:5',
        ]);

        if($validate->fails()){
            return response()->json([
                'status'=>400,
                'errors'=>$validate->errors()
            ],400);
        }


        $chapter->title=$request->chapter;
        $chapter->save();
        $chapter->load('lessons');

        return response()->json([
            'status'=>200,
            'data'=>$chapter,
            'message'=>'Chapter updated successfully',
        ],200);
    }

    public function destroy($id){

        $chapter=Chapter::find($id);

       if(!$chapter){
        return response()->json([
            'status'=>404,
            'message'=>'Chapter not found',
        ],404);
       }

       $chapter->delete();

        return response()->json([
            'status'=>200,
            'message'=>'Chapter deleted successfully',
        ],200);
    }

    public function sortChapter(Request $request){

        $course_id='';
        if($request->chapters){
            foreach($request->chapters as $key=>$chapter){
                $course_id=$chapter['course_id'];
                Chapter::where('id',$chapter['id'])->update(['sort_order'=>$key]);
            }
        }

        $chapters=Chapter::where('course_id',$course_id)->with('lessons')->orderBy('sort_order','asc')->get();

        return response()->json([
            'status'=>200,
            'chapters'=>$chapters,
            'message'=>'Chapter sorted successfully',
        ]);
    }
}
