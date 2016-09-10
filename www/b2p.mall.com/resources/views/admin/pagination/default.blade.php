
<div class="dataTables_paginate paging_simple_numbers" id="dynamic-table_paginate">
    <ul class="pagination">
        <li class="paginate_button previous" aria-controls="dynamic-table" tabindex="0" id="dynamic-table_previous" {{ ($paginator->currentPage() == 1) ? ' disabled' : '' }}>
            <a href="{{ $paginator->url(1) }}">上一页</a>
        </li>

        @for ($i = $paginator->currentPage(); $i <= $paginator->lastPage(); $i++)

	        <li class="paginate_button {{ $i== $paginator->currentPage() ? 'active' : '' }}" aria-controls="dynamic-table" tabindex="0" >
	            <a href="{{ $paginator->url($i) }}">{{ $i }}</a>
	        </li>

        @endfor

        <li class="paginate_button next" aria-controls="dynamic-table" tabindex="0" id="dynamic-table_next"  {{ ($paginator->currentPage() == $paginator->lastPage()) ? ' disabled' : '' }}>
            <a href="{{ $paginator->url(1 + $paginator->currentPage()) }}">下一页</a>
        </li>
    </ul>
</div>