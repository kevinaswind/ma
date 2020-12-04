<div class="p-4">
    <table class="table table-hover">
        <thead>
        <tr>
            <th>Title</th>
            <th>Description</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        @foreach($papers as $paper)
            <tr>
                <td>{{$paper->title}}</td>
                <td>{{ $paper->description }}</td>
                <td>
                    <button type="button" class="btn btn-sm btn-info text-white">Edit</button>
                    <button type="button" class="btn btn-sm btn-danger">Delete</button>
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
    {{ $papers->links() }}
</div>
