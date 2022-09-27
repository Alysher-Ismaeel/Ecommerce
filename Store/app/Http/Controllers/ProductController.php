<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use App\Models\Discount;
use Illuminate\Http\JsonResponse;

class ProductController extends Controller
{
//______________________________________________________________________________________________________________________
    public function index() //Show all products
    {
        $products = Product::query()->select("id",
            "name",
            "image_url",
            "exp_date",
            "category_id",
            "user_id",
            "quantity",
            "current_price",
            "price")->get();
        foreach ($products as $product){
            if (Carbon::parse($product['exp_date']) <= now()) {
            $product->delete();
                }
            $product['current_percent'] = $this->dis($product->id) ;
        }
        if ($products == null) {
            return response()->json([
            'message' => "There is no products to show"
                    ] , 404);
        }
        return response()->json([
            'products' => $products,
        ]);
    }
//______________________________________________________________________________________________________________________
public function dis($id){
     $discounts = Discount::query()->where('product_id' , $id)->get();
    $maxDiscount = 0;
    foreach ($discounts as $discount) {
        if (Carbon::parse($discount['date']) <= now()) {
            $maxDiscount = $discount['discount_percentage'];
        }
    }
    return $maxDiscount ;
}
//______________________________________________________________________________________________________________________
    public function show($id){
        $product = Product::query()->find($id);
        if(is_null($product)){
            return response()->json([
                'message' => "can't find this product"
            ],404);
        }
            $product['current_percent'] = $this->dis($id) ;
            return response()->json([
            'product' => $product
        ]);
    }
//______________________________________________________________________________________________________________________

    public function store(Request $request) //Add a product
    {
        $input=$request->all();
        if($request->hasFile('image_url'))
        {
            $uploadFolder='images';
            $image=$request->file('image_url');
            $image_uploaded_path= $image->store($uploadFolder,'public');
            $input['image_url']=Storage::disk('public')->url($image_uploaded_path);
        }
        $validator = Validator::make($input, [
            'name' => 'required',
            'image_url' => 'required',
            'quantity' => 'required',
            'price' => 'required',
            'exp_date' => 'required',
            'category_id' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json([
                'message' =>"validator error"
            ],400);
        }
        $product = Product::query()->create($input);
        $product->user_id = auth::user()->id;
        foreach ($request->discounts as $discount) {
            $product->discounts()->create([
                'date' => $discount['date'],
                'discount_percentage' => $discount['discount_percentage'],
            ]);
            $maxDiscount = null;
            if (Carbon::parse($discount['date']) <= now()) {
                $maxDiscount = $discount['discount_percentage'];
            }
            if (!is_null($maxDiscount)) {
                $discount_value = ($product->price * $maxDiscount) / 100;
                $product['current_price'] = $product->price - $discount_value;
                if (is_null($product)) {
                    return response()->json([
                        'message' => "Can't find this product"
                    ],404);
                }
            }
        }
        $product->save();
        return response()->json([
            'message' => "added product"
        ]);

    }
//______________________________________________________________________________________________________________________
    public function ShowUserProducts()
    {
        $products=Product::query()->where('user_id',Auth::id())->select("id",
            "name",
            "image_url",
            "exp_date",
            "category_id",
            "user_id",
            "quantity",
            "current_price",
            "price")->get()->all();
        foreach ($products as $product){
        if ($product->user_id != Auth::id()) {
            return response()->json([
                "Unauthenticated"
            ]);
        }
        }
            return response()->json([
                'products' => $products,
                'message' => 'Products retrieved Successfully!'
            ]);
    }
//______________________________________________________________________________________________________________________
    public function update(Request $request,$id)// Update a product
    {
        $product=Product::where('id',$id)->where('user_id',Auth::id())->first();
        $input=$request->only( 'name',
            'image_url',
            'quantity',
            'price',
            'category_id');
        if($product->user_id != Auth::id()){
            return response()->json([
                'message' => "you can't update this product"
            ],401);
        }
        $product->update($input);
        $product->save();
        return response()->json([
            'message' => "updated product"
        ]);
    }
//______________________________________________________________________________________________________________________
    public function destroy($id) // Delete a product by its id
    {
        $product=Product::query()->where('id',$id)->where('user_id',Auth::id())->first(); //Auth
        if($product->user_id != Auth::id()) {
            return response()->json([
                'message' => "you can't delete this product"
            ],403);
        }
        $product->forceDelete();
        return response()->json([
            'message' => 'product deleted successfully']);
    }
//______________________________________________________________________________________________________________________
    public function searchProduct($name)
    {
        $product = Product::query()->where('name', $name)->select("id",
            "name",
            "image_url",
            "exp_date",
            "category_id",
            "user_id",
            "quantity",
            "current_price",
            "price")->get()->all();
        if(count($product)==null){
            return response()->json([
                'message' => "Can't find this Product"
            ],404);
        }
        return response()->json([
            'products' => $product,
        ]);
    }
//______________________________________________________________________________________________________________________
    public function searchCategory($id): JsonResponse
    {
        $product = Product::query()->where('category_id', $id)->select("id",
            "name",
            "image_url",
            "exp_date",
            "category_id",
            "user_id",
            "quantity",
            "current_price",
            "price")->get()->fresh();
        $category = Category::query()->where('id' , $id)->get();
        if($category->isEmpty()){
            return response()->json([
                'message' => "Can't find this Category"
            ],404);
        }
        if($product->isEmpty()){
            return response()->json([
                'message' => "There is no products in this Category"
            ],404);
        }
        return response()->json([
            'products' => $product
        ]);
    }
//______________________________________________________________________________________________________________________
public function sort($input){
    $product = Product::query()->select("id",
        "name",
        "image_url",
        "exp_date",
        "category_id",
        "user_id",
        "quantity",
        "current_price",
        "price")->get()->sortBy($input);

    return response()->json([
        'products' => $product,
        'Sort Method' => $input
    ]);
}
//______________________________________________________________________________________________________________________
}
