<?php

namespace App\Http\Controllers;

use App\Models\Like;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LikeController extends Controller
{
    public function getLikes(Request $request){
        $user_id = Auth::user()->id;
        $id = $request->id;
        $likes = Like::query()->where('product_id',$id)->get();
        foreach ($likes as $like){
            if($like->user_id == $user_id){
                return response()->json([
                    'likes' => count($likes)
                ]);
            }
        }
        $like = new Like() ;
        $like->user_id = $user_id;
        $like->product_id = $id;
        $like->save();
        return response()->json([
            'likes' => count($likes)+1
        ]);
    }
}
