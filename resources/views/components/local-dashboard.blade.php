<div class="card">
    <div class="card-header">代表 :: 仪表板</div>

    <div class="card-body">
        @if (session('status'))
            <div class="alert alert-success" role="alert">
                {{ session('status') }}
            </div>
        @endif

        您已经成功登录！
    </div>
</div>
