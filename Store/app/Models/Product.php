<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use  App\Models\User;
use  App\Models\Category;
use Illuminate\Database\Eloquent\SoftDeletes;

class Product extends Model
{
    use HasFactory;

    protected $table = "products";
    protected $primaryKey = "id";
    public $timestamps = true;
    use SoftDeletes;
    protected $dates = ['deleted_at'];
    protected $fillable=[
    'name','image_url','quantity','price'
        ,'category_id','exp_date','current_price'
];
public function user ()
{
   return $this->belongsTo(User::class,'user_id');
}
public function category()
{
    return $this->belongsTo(Category::class,'category_id');
}
public function discounts()
{
    return $this->hasMany(Discount::class,'product_id')->orderBy('date');
}
}
