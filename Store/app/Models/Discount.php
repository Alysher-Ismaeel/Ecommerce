<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Discount extends Model
{
    use HasFactory;
    protected $table = "discounts";
    protected $primaryKey = "id";
    public $timestamps = true;
    protected $fillable=[
        'date',
        'discount_percentage'
    ];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}
