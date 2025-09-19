<?php

use App\Http\Controllers\frontend\AccountController;
use App\Http\Controllers\frontend\ChapterController;
use App\Http\Controllers\frontend\CourseController;
use App\Http\Controllers\frontend\LessonController;
use App\Http\Controllers\frontend\OutcomeController;
use App\Http\Controllers\frontend\RequirementController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::post('/register', [AccountController::class, 'register']);
Route::post('/login',[AccountController::class, 'authenticate']);

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::group(['middleware'=>['auth:sanctum']],function(){
    Route::post('/courses', [CourseController::class, 'store']);
    Route::get('/courses/edit/{id}',[CourseController::class, 'edit']);
    Route::put('/courses/{id}',[CourseController::class, 'update']);
    Route::get('/courses/meta-data', [CourseController::class, 'metaData']);
    Route::post('/save-course-image/{id}',[CourseController::class, 'saveCourseImage']);


    //outcome routes
    Route::get('/outcomes',[OutcomeController::class,'index']);
    Route::post('/outcomes',[OutcomeController::class,'store']);
    Route::put('/outcomes/{id}',[OutcomeController::class,'update']);
    Route::delete('/outcomes/{id}',[OutcomeController::class,'destroy']);
    Route::post('/sort-outcomes',[OutcomeController::class,'sortOutcome']);

    //requirement routes
    Route::get('/requirements',[RequirementController::class,'index']);
    Route::post('/requirements',[RequirementController::class,'store']);
    Route::put('/requirements/{id}',[RequirementController::class,'update']);
    Route::delete('/requirements/{id}',[RequirementController::class,'destroy']);
    Route::post('/sort-requirements',[RequirementController::class,'sortRequirement']);


    //chapters routes
    Route::get('/chapters',[ChapterController::class,'index']);
    Route::post('/chapters',[ChapterController::class,'store']);
    Route::put('/chapters/{id}',[ChapterController::class,'update']);
    Route::delete('/chapters/{id}',[ChapterController::class,'destroy']);
    Route::post('/sort-chapters',[ChapterController::class,'sortChapter']);

    //lesson routes
    Route::post('/lessons',[LessonController::class,'store']);
    Route::get('/lesson/edit/{id}',[LessonController::class, 'edit']);
    Route::put('/lessons/{id}',[LessonController::class,'update']);
    Route::delete('/lessons/{id}',[LessonController::class,'destroy']);
});
