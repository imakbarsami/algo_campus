<?php

namespace App\Http\Controllers\frontend;

use App\Http\Controllers\Controller;
use App\Models\Requirment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class RequirementController extends Controller
{
    public function index(Request $request){

        $requirments=Requirment::where('course_id',$request->course_id)->orderBy('sort_order')->get();

        return response()->json([
            'status'=>200,
            'data'=>$requirments
        ],200);
    }

    public function store(Request $request){

        $validate=Validator::make($request->all(),[
            'course_id'=>'required',
            'requirement'=>'required',
        ]);

        if($validate->fails()){
            return response()->json([
                'status'=>400,
                'errors'=>$validate->errors()
            ],400);
        }

        //dd($request->all());

        $requirment=new Requirment();
        $requirment->course_id=$request->course_id;
        $requirment->text=$request->requirement;
        $requirment->sort_order=1000;
        $requirment->save();

        return response()->json([
            'status'=>200,
            'data'=>$requirment,
            'message'=>'Requirment Added Successfully'
        ],200);
    }

    public function update(Request $request,$id){

        $requirment=Requirment::find($id);
        if(!$requirment){
            return response()->json([
                'status'=>404,
                'message'=>'Requirment Not Found',
            ],404);
        }

        $validate=Validator::make($request->all(),[
            'requirement'=>'required',
        ]);

        if($validate->fails()){
            return response()->json([
                'status'=>400,
                'errors'=>$validate->errors()
            ],400);
        }

        $requirment->text=$request->requirement;
        $requirment->save();

        return response()->json([
            'status'=>200,
            'data'=>$requirment,
            'message'=>'Requirment Updated Successfully'
        ],200);
    }

    public function destroy($id){

        $requirment=Requirment::find($id);
        if(!$requirment){
            return response()->json([
                'status'=>404,
                'message'=>'Requirment Not Found',
            ],404);
        }

        $requirment->delete();

        return response()->json([
            'status'=>200,
            'message'=>'Requirment Deleted Successfully'
        ],200);
    }

    public function sortRequirement(Request $request){

        if($request->requirements){
            foreach($request->requirements as $key=>$requirement){
                Requirment::where('id',$requirement['id'])->update(['sort_order'=>$key]);
            }
        }

        return response()->json([
            'status'=>200,
            'message'=>'Requirment Sorted Successfully'
        ],200);
    }
}
