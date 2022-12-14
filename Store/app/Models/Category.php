<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Category extends Model
{
    use HasFactory;

    protected $table = "categories";
    protected $fillable = ['name'];
    protected $primaryKey = "id";
    use SoftDeletes;
    protected $dates = ['deleted_at'];
    public $timestamps = true;

    public function products()
    {
        return $this->hasMany(Product::class, 'category_id');
    }

}
