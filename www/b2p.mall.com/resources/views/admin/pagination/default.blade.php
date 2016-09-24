@if(!$paginator->isEmpty())
<div class="row">
    <div class="col-xs-6">
        <div class="dataTables_info" role="status" aria-live="polite">
            显示 {{ $paginator->firstItem() }} - {{ $paginator->lastItem() }} 共 {{ $paginator->total() }} 条数据
        </div>
    </div>

    <div class="col-xs-6">
        <div class="dataTables_paginate paging_simple_numbers" id="dynamic-table_paginate">
            <ul class="pagination">
                @if($paginator->currentPage() <= 1)
                <li class="paginate_button disabled" aria-controls="dynamic-table" tabindex="0" id="dynamic-table_previous">
                    <a href="javascript:void();">上一页</a>
                </li>
                @else
                <li class="paginate_button previous" aria-controls="dynamic-table" tabindex="0" id="dynamic-table_previous">
                    <a href="{{ $paginator->url($paginator->currentPage() - 1) }}">上一页</a>
                </li>
                @endif

                @php
                    $start_page = $paginator->currentPage() - 5 > 0 ? $paginator->currentPage() - 5 : 1;
                    $end_page = $paginator->currentPage() + 5 <= $paginator->lastPage() ? $paginator->currentPage() + 5 : $paginator->lastPage();
                @endphp
                @for ($i = $start_page; $i <= $end_page; $i++)

                    <li class="paginate_button {{ $i== $paginator->currentPage() ? 'active' : '' }}" aria-controls="dynamic-table" tabindex="0" >
                        <a href="{{ $paginator->url($i) }}">{{ $i }}</a>
                    </li>

                @endfor

                @if($paginator->currentPage() >= $paginator->lastPage())
                <li class="paginate_button disabled" aria-controls="dynamic-table" tabindex="0" id="dynamic-table_next" disabled>
                    <a href="javascript:void();">下一页</a>
                </li>
                @else
                <li class="paginate_button next" aria-controls="dynamic-table" tabindex="0" id="dynamic-table_next" disabled>
                    <a href="{{ $paginator->url(1 + $paginator->currentPage()) }}">下一页</a>
                </li>
                @endif
            </ul>
        </div>
    </div>
</div>
@endif
