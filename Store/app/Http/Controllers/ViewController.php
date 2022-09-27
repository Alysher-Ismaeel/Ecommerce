<?php

namespace App\Http\Controllers;

use App\Models\View;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ViewController extends Controller
{
    public function getViews($id){
        $user_id = Auth::user()->id;
        $views = View::query()->where('product_id',$id)->get();
        foreach ($views as $view){
            if($view->user_id == $user_id){
                return response()->json([
                    'views' => count($views)
                ]);
            }
        }
        $view = new View() ;
        $view->user_id = $user_id;
        $view->product_id = $id;
        $view->save();
        return response()->json([
            'views' => count($views)+1
        ]);
    }
}
