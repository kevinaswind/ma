<?php

namespace App\View\Components;

use Illuminate\View\Component;

class ForeignNavBar extends Component
{
    public $name = '';

    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->name = $this->getFullName();
    }

    public function getFullName()
    {
        if(auth('delegate')->user()){
            return $this->name = auth('delegate')->user()->full_name;
        }

    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\View\View|string
     */
    public function render()
    {
        return view('components.foreign-nav-bar');
    }
}
