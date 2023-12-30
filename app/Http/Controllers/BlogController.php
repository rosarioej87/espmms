<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use TCG\Voyager\Models\Post;

class BlogController extends Controller
{
    public function index(){
        $posts = Post::orderBy('created_at', 'desc')->get();
        return view('blog', compact('posts'));
    }

    public function post($slug){
        $post = Post::where('slug', '=', $slug)->firstOrFail();

        return view('post', compact('post'));
    }
}
