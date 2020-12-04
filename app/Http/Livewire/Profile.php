<?php

namespace App\Http\Livewire;

use Livewire\Component;

class Profile extends Component
{
    public $first_name = '';
    public $last_name = '';
    public $company = '';
    public $success = false;
    public $showHelp = false;

    protected $rules = [
        'first_name' => 'required|min:3',
        'last_name' => 'required|min:3',
        'company' => 'required|min:3',
    ];

    public function updateProfile()
    {
        $this->validate();

        auth('delegate')->user()->update([
            'first_name' => $this->first_name,
            'last_name' => $this->last_name,
            'company' => $this->company,
        ]);

        $this->emit('profileUpdated');
        $this->success = true;
    }

    public function checkName()
    {
        $this->validate([
            'first_name' => 'min:3'
        ]);
    }

    public function render()
    {
        return view('livewire.profile');
    }

    public function mount()
    {
//        dd(auth('delegate')->user()->last_name);
        $this->first_name = auth('delegate')->user()->first_name;
        $this->last_name = auth('delegate')->user()->last_name;
        $this->company = auth('delegate')->user()->company;
    }
}
