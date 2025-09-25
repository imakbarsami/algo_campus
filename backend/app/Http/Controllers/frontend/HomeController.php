<?php

namespace App\Http\Controllers\frontend;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Course;
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

}
