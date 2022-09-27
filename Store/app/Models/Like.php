<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Like extends Model
{
    use HasFactory;
    protected $table = "likes";
    protected $primaryKey = "id";
    public $timestamps = true;
    protected $fillable = [
        'product_id',
        'user_id'   ];
}
