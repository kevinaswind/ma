<?php

namespace App\Http\Livewire;

use App\Paper;
use Livewire\Component;
use Livewire\WithPagination;

class Papers extends Component
{
    use WithPagination;

    protected $paginationTheme = 'bootstrap';

    public function render()
    {
        return view('livewire.papers', [
            'papers' => Paper::paginate(10),
        ]);
    }
}
