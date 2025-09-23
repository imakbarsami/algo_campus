<?php

namespace App\Http\Controllers\frontend;

use App\Http\Controllers\Controller;
use App\Models\Course;
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

        $courses=Course::where('user_id',$request->user()->id)->with('level')->get();

        return response()->json([
            'status'=>200,
            'courses'=>$courses,
        ],200);
    }
}
