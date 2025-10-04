<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Course extends Model
{
    protected $appends=['course_small_image'];

    function getCourseSmallImageAttribute(){
        if(!$this->image){
            return '';
        }

        return asset('uploads/courses/small/'.$this->image);
    }

    public function chapters(){
        return $this->hasMany(Chapter::class)->orderBy('sort_order','asc');
    }

    public function level(){
        return $this->belongsTo(Level::class);
    }

    public function category(){
        return $this->belongsTo(Category::class);
    }

    public function language(){
        return $this->belongsTo(Language::class);
    }

    public function outcomes(){
        return $this->hasMany(Outcome::class)->orderBy('sort_order','asc');
    }

    public function requirements(){
        return $this->hasMany(Requirment::class)->orderBy('sort_order','asc');
    }

    public function reviews(){
        return $this->hasMany(Review::class);
    }

    public function enrollments(){
        return $this->hasMany(Enrollment::class);
    }

}
