<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ViewController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CommentController;
use App\Http\Controllers\LikeController;
//______________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
//______________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________

Route::prefix('products')->group(function (){
    Route::get('/', [ProductController::class, 'index']);
    Route::post('/', [ProductController::class, 'store'])->middleware('auth:api');
    Route::get('/show/{id}', [ProductController::class, 'show']);
    Route::post('/update/{id}', [ProductController::class, 'update'])->middleware('auth:api');
    Route::delete('/delete/{id}', [ProductController::class, 'destroy'])->middleware('auth:api');
    Route::get('show/{id}',[ProductController::class,'show']);
    Route::get('search/name/{name}',[ProductController::class,'searchProduct']);
    Route::get('search/category/{id}',[ProductController::class,'searchCategory']);
    Route::put('sort/{input}' , [ProductController::class,'sort']);
});
//______________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________
Route::prefix('categories')->group(function (){
    Route::get('/',[CategoryController::class,'index']);
    Route::post('/',[CategoryController::class,'store'])->middleware('auth:api');
    Route::delete('/{id}',[CategoryController::class,'delete'])->middleware('auth:api');
});
//______________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________
Route::prefix('user')->group(function (){
    Route::post('/register',[AuthController::class,'register']);
    Route::post('/login',[AuthController::class,'login']);
    Route::get('/show/{id}',[AuthController::class,'show']);
    Route::get('/',[AuthController::class , 'index']);
    Route::get('/account',[AuthController::class,'account'])->middleware('auth:api');
    Route::get('/products' , [ProductController::class , 'ShowUserProducts'])->middleware('auth:api');
    Route::post('/logout' , [AuthController::class,'logout'])->middleware('auth:api');
});
//______________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________
Route::post('view/{id}' , [ViewController::class , 'getViews'])->middleware('auth:api');
//______________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________
Route::post('like/{id}' , [LikeController::class , 'getLikes'])->middleware('auth:api');
//______________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________
Route::prefix('comments')->group(function (){
    Route::get('/{id}' , [CommentController::class , 'getComments']);
    Route::post('/{id}' , [CommentController::class , 'postComments'])->middleware('auth:api');

});
//______________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________

