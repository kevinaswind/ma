<?php

namespace App\Http\Controllers\Delegate\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

//    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */

    protected $redirectTo = "/delegate";

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('delegate.guest:delegate', ['except' => 'logout']);
    }

    /**
     * Get the guard to be used during authentication.
     *
     * @return \Illuminate\Contracts\Auth\StatefulGuard
     */
    protected function guard()
    {
        return Auth::guard('delegate');
    }

    /**
     * Show the application's login form.
     *
     * @return \Illuminate\Http\Response
     */
    public function showLoginForm()
    {
        return view('delegate.auth.login');
    }

    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');

//        dd($credentials);
        if ($this->guard()->attempt($credentials)) {
            // Authentication passed...
//            dd(auth('delegate')->user()->channel);
            if(auth('delegate')->user()->channel == 'foreign'){
                App::setLocale('en');
                session([
                    'locale' => 'en'
                ]);
            }else{
                App::setLocale('zh');
                session([
                    'locale' => 'zh'
                ]);
            }
            return redirect('/delegate');
        }
    }

    /**
     * Log the user out of the application.
     *
     * @param \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function logout(Request $request)
    {
        $lang = session()->get('locale');
        $this->guard()->logout();

        $request->session()->flush();

        $request->session()->regenerate();

        session()->put('locale', $lang);

        return redirect($this->redirectTo);
    }

}
