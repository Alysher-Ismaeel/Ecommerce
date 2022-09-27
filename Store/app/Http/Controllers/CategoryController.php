<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;

class CategoryController extends Controller
{
//______________________________________________________________________________________________________________________
    public function index()
    {
        $category=Category::query()->select( "id",
            "name","user_id")->get()->all();
        if ($category == null) {
            return response()->json([
                'message' => "There is no products to show"
            ] , 404);
        }
        return response()->json([
            'categories' => $category]);
    }
//______________________________________________________________________________________________________________________
    public function store(Request $request)
    {
        $input=$request->all();
        $validator =Validator::make($input,[
            'name'=>'required'
        ]);
        if($validator->fails())
        {
            return response()->json([
                'message' => "validator error"],
                400);}
        $category = Category::query()->create($input);
        $category->user_id = auth::user()->id;
        $category->save();
        return response()->json([
            'message' => "added category",
            $category]);
    }
//______________________________________________________________________________________________________________________
    public function delete($id){
        $category=Category::where('id',$id)->where('user_id',Auth::id())->first();
        if($category->user_id != Auth::id()) {
            return response()->json([
                'message' => "you can't delete this category"
            ],403);
        }
        $category->forceDelete();
        return response()->json([
            'message' => 'category deleted successfully']);
    }
}
