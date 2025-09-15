<?php

namespace App\Http\Controllers\frontend;

use App\Http\Controllers\Controller;
use App\Models\Outcome;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class OutcomeController extends Controller
{
    public function index(Request $request){
 
        $outcomes=Outcome::where('course_id',$request->course_id)
                            ->orderBy('sort_order')
                            ->get();
        //dd($outcome);
        return response()->json([
            'status'=>200,
            'data'=>$outcomes,
        ],200);
    }


    public function store(Request $request){

        $validate=Validator::make($request->all(),[
            'course_id'=>'required',
            'outcome'=>'required',
        ]);

        if($validate->fails()){
            return response()->json([
                'status'=>400,
                'errors'=>$validate->errors()
            ],400);
        }

        $outcome=new Outcome();
        $outcome->course_id=$request->course_id;
        $outcome->text=$request->outcome;
        $outcome->sort_order=1000;
        $outcome->save();

        return response()->json([
            'status'=>200,
            'data'=>$outcome,
            'message'=>'outcome added successfully',
        ],200);
    }


    public function update(Request $request,$id){

        $outcome=Outcome::find($id);

        if(!$outcome){
            return response()->json([
                'status'=>404,
                'message'=>'outcome not found',
            ],404);
        }


        $validate=Validator::make($request->all(),[
            'outcome'=>'required',
        ]);

        if($validate->fails()){
            return response()->json([
                'status'=>400,
                'errors'=>$validate->errors()
            ],400);
        }


        $outcome->text=$request->outcome;
        $outcome->save();

        return response()->json([
            'status'=>200,
            'data'=>$outcome,
            'message'=>'outcome updated successfully',
        ],200);
    }

    public function destroy($id){

        $outcome=Outcome::find($id);

       if(!$outcome){
        return response()->json([
            'status'=>404,
            'message'=>'outcome not found',
        ],404);
       }

       $outcome->delete();

        return response()->json([
            'status'=>200,
            'message'=>'outcome deleted successfully',
        ],200);
    }

    public function sortOutcome(Request $request){

        if($request->outcomes){
            foreach($request->outcomes as $key=>$outcome){
                Outcome::where('id',$outcome['id'])->update(['sort_order'=>$key]);
            }
        }

        return response()->json([
            'status'=>200,
            'message'=>'outcome sorted successfully',
        ]);
    }
}
