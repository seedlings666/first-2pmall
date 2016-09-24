<?php

namespace App;

use Illuminate\Contracts\Pagination\Paginator as PaginatorContract;
use Illuminate\Contracts\Pagination\Presenter;

class PaginateRender implements Presenter
{
    /**
     * The paginator implementation.
     *
     * @var \Illuminate\Contracts\Pagination\Paginator
     */
    protected $paginator;

    /**
     * 視圖模板
     * @var [type]
     */
    protected $view;

    public function __construct(PaginatorContract $paginator, $view = '')
    {
        $this->paginator = $paginator;
        $this->view      = $view;
    }

    public function hasPages()
    {
        return !($this->paginator->currentPage() == 1 && !$this->paginator->hasMorePages());
    }

    public function render()
    {
        if (!$this->view) {
            return view('admin.pagination.default', ['paginator' => $this->paginator]);
        }
        return view($this->view, ['paginator' => $this->paginator]);
    }
}
