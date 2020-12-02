@extends('delegate.layouts.app')

@section('title', 'Profile')
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Profile</div>

                    <div class="card-body">
                       @livewire('profile')
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
