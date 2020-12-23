<ul class="navbar-nav ml-auto">
    <!-- Authentication Links -->
    @if (Auth::guard('delegate')->guest())
        <li class="nav-item">
            <a class="nav-link" href="{{ route('delegate.login') }}">{{ __('Login') }}</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="{{ route('delegate.register') }}">{{ __('Register') }}</a>
        </li>
    @else
        <li class="nav-item dropdown">
            <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                {{ $name }} <span class="caret"></span>
            </a>

            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="{{ route('delegate.profile.en') }}">{{ __('header-nav.profile') }}
                </a>
                <a class="dropdown-item" href="{{ route('papers.index') }}">{{ __('header-nav.paper') }}
                </a>
                <a class="dropdown-item" href="{{ route('delegate.logout') }}"
                   onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                    {{ __('header-nav.logout') }}
                </a>

                <form id="logout-form" action="{{ route('delegate.logout') }}" method="POST"
                      style="display: none;">
                    @csrf
                </form>
            </div>
        </li>
    @endguest
</ul>
