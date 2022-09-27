<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class View extends Model
{
    use HasFactory;
    protected $table = "views";
    protected $primaryKey = "id";
    public $timestamps = true;
    protected $fillable = [
        'product_id',
         'user_id'   ];
}
