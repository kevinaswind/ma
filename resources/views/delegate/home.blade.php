@extends('delegate.layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            {{ App::getLocale() }}
            @if(App::getLocale() == 'en')
                <x-foreign-dashboard />
            @else
                <x-local-dashboard />
            @endif

        </div>
    </div>
</div>
@endsection
