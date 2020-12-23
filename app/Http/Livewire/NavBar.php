<?php

namespace App\Http\Livewire;

use Livewire\Component;

class NavBar extends Component
{
    public $name = '';

    public function getFullName()
    {
        if(auth('delegate')->user()){
            return $this->name = auth('delegate')->user()->full_name;
        }

    }

    public function mount()
    {
        $this->getFullName();
    }

    protected $listeners = [
        'profileUpdated' => 'changeName'
    ];

    public function changeName()
    {
        $this->getFullName();
    }

    public function render()
    {
        return view('livewire.nav-bar');
    }
}
