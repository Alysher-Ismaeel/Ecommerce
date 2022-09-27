<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use function PHPUnit\Framework\isEmpty;

class CommentController extends Controller
{
    public function getComments($id){
        $comments = Comment::query()->where('product_id',$id)->get();
        if($comments->isEmpty())
            return response()->json([
                'message' => 'there is no comments'
            ]);
        return response()->json([
            'comments' => $comments
        ]);
    }
//______________________________________________________________________________________________________________________
    public function postComments(Request $request , $id){
        $user_id = Auth::user()->id;
        $content = $request->comment;
        $comment = new Comment();
        $comment->product_id = $id;
        $comment->user_id = $user_id;
        if(!$content){
            return response()->json([
                'message' => 'can not add an empty comment!'
            ],400);
        }
        $comment->content = $content;
        $comment->save();
        return response()->json([
            'comment added successfully'
        ]);
    }
}
