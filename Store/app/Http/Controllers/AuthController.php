<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Laravel\Passport\RefreshToken;
use Laravel\Passport\Token;
class AuthController extends Controller
{
//______________________________________________________________________________________________________________________
    public function register(Request $request)
    {
        $input = $request->all();
        if($request->hasFile('profile_img_url'))
        {
            $uploadFolder='images';
            $image=$request->file('profile_img_url');
            $image_uploaded_path= $image->store($uploadFolder,'public');
            $input['profile_img_url']=Storage::disk('public')->url($image_uploaded_path);
        }
        $validator = Validator::make($request->all(),[
            'name'=>'required',
            'email'=>'required|email',
            'password'=>'required',
            'c_password'=>'required|same:password',
            'profile_img_url' => 'required',
            'phone' => 'required'
        ]);
        if ($validator->fails()) {
            return $this->sendError('Validate Error',$validator->errors(),400);
        }
        $input['password'] = Hash::make($input['password']);
        $user = User::create($input);
        $success['user']=$user;
        $success['token_type']='Bearer';
        $token = $user->createToken('LeaveMeAlone')->accessToken;
        $success['name'] = $user->name;
        return response()->json([
            'success' => $success,
            'token' => $token,
            'message' => 'User sign up Successfully!']);
    }
//______________________________________________________________________________________________________________________
    public function login(Request $request)
    {
        if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
            $user = Auth::user();
            $success['user']=$user;
            $success['token_type']='Bearer';
            $token = $user->createToken('LeaveMeAlone')->accessToken;
            $success['name'] = $user->name;
            return response()->json([
                'success' => $success,
                'token' => $token ,
                'message' => 'User sign in Successfully!']);
        }
        else{
            return $this->sendError('Unauthorised',['error','Unauthorised'] );
        }
    }
//______________________________________________________________________________________________________________________
    public function show($id)
    {
        $user=User::find($id);
        if(is_null($user)){
            return response()->json([
                'message' => "Can't find this user"
            ],404);
        }
        return response()->json([
            'user' => $user
        ])->getData();
    }
//______________________________________________________________________________________________________________________
    public function index()
    {
        $users=User::query()->get()->all();
        if($users==null){
            return response()->json([
                'message' => "Can't find any user"
            ],404);
        }
        return response()->json([
            'users' => $users
        ])->getData();
    }
//______________________________________________________________________________________________________________________
    public function account()
    {
        $user=Auth::user();
        return response()->json([
            'user info' => $user
        ])->getData();
    }
//______________________________________________________________________________________________________________________
    public function logout(Request $request)
    {
        $token = $request->user()->token();
        $token->revoke();
        return response()->json(["message" => "you have logout successfully"]);
    }
//______________________________________________________________________________________________________________________
}
