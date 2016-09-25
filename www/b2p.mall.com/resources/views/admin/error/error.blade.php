@extends('admin.layouts.master')

@section('content')
<div class="row">
    <div class="col-xs-12">
        <div class="error-container">
            <div class="well">
                <h1 class="grey lighter smaller">
                    <span class="blue bigger-125">
                        <i class="ace-icon fa fa-sitemap"></i>
                        {{ array_get($error, 'err_code') }}
                    </span>
                    {{ array_get($error, 'err_msg', array_get($error, 'msg')) }}
                </h1>

                <hr />
            @if(!empty($error['data']))
            @php
                $err_data = is_array($error['data']) ? $error['data'] : $error['data']->messages();
            @endphp
                @foreach($err_data as $msg)
                <h3 class="lighter smaller">{{ $msg[0] }}</h3>
                @endforeach()
            @else
                <h3 class="lighter smaller">我们到处找，但我们无法找到它！</h3>
            @endif

                <div>
                    <div class="space"></div>
                    <h4 class="smaller">请尝试以下之一：</h4>

                    <ul class="list-unstyled spaced inline bigger-110 margin-15">
                        <li>
                            <i class="ace-icon fa fa-hand-o-right blue"></i>
                            重新检查网址是否错误
                        </li>

                        <li>
                            <i class="ace-icon fa fa-hand-o-right blue"></i>
                            联系工作人员
                        </li>
                    </ul>
                </div>

                <hr />
                <div class="space"></div>

                <div class="center">
                    <a href="javascript:history.back()" class="btn btn-grey">
                        <i class="ace-icon fa fa-arrow-left"></i>
                        返回上一页
                    </a>

                    <a href="/admin/" class="btn btn-primary">
                        <i class="ace-icon fa fa-tachometer"></i>
                        首页
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
@stop

@section('footer-script')

@stop
