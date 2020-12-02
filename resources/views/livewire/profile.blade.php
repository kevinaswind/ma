<div>
    @if($success)
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        The profile has been updated successfully!
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    @endif
    <form wire:submit.prevent="updateProfile">
        @csrf

        <div class="form-group row">
            <label for="first_name" class="col-md-4 col-form-label text-md-right">{{ __('First Name') }}</label>

            <div class="col-md-6">
                <input id="first_name" type="text"
                       class="form-control{{ $errors->has('first_name') ? ' is-invalid' : '' }}" name="first_name"
                       wire:model.defer="first_name" required autofocus>

                @if ($errors->has('first_name'))
                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('first_name') }}</strong>
                                    </span>
                @endif
            </div>
        </div>

        <div class="form-group row">
            <label for="last_name" class="col-md-4 col-form-label text-md-right">{{ __('Last Name') }}</label>

            <div class="col-md-6">
                <input id="last_name" type="text"
                       class="form-control{{ $errors->has('last_name') ? ' is-invalid' : '' }}" name="last_name"
                       wire:model.defer="last_name" required autofocus>

                @if ($errors->has('last_name'))
                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('last_name') }}</strong>
                                    </span>
                @endif
            </div>
        </div>

        <div class="form-group row">
            <label for="company" class="col-md-4 col-form-label text-md-right">{{ __('Company') }}</label>

            <div class="col-md-6">
                <input id="company" type="text" class="form-control{{ $errors->has('company') ? ' is-invalid' : '' }}"
                       name="company" wire:model="company" required autofocus>

                @if ($errors->has('company'))
                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('company') }}</strong>
                                    </span>
                @endif
            </div>
        </div>

        <div class="form-group row mb-0">
            <div class="col-md-6 offset-md-4">
                <button type="submit" class="btn btn-primary">
                    {{ __('Update') }}
                </button>
            </div>
        </div>
    </form>
</div>
