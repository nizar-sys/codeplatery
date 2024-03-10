@extends('admin.layouts.layout')

@section('content')
    <section class="section">
        <div class="section-header">
            <div class="section-header-back">
                <a href="{{ route('admin.qualifications.index') }}" class="btn btn-icon"><i class="fas fa-arrow-left"></i></a>
            </div>
            <h1>Qualifications</h1>

        </div>

        <div class="section-body">

            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>Create Qualifications</h4>
                        </div>
                        <div class="card-body">
                            <form action="{{ route('admin.qualifications.update', $qualification->id) }}" method="POST"
                                enctype="multipart/form-data">
                                @csrf
                                @method('PUT')

                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Type</label>
                                    <div class="col-sm-12 col-md-7">
                                        <select class="form-control selectric" name="type">
                                            @php
                                                $types = ['education', 'experience'];
                                            @endphp
                                            @foreach ($types as $type)
                                                <option value="{{ $type }}"
                                                    @if (old('type', $qualification->type) == $type) selected @endif>{{ ucfirst($type) }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">
                                        Organization / Institute
                                    </label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="text" name="organization_name" class="form-control"
                                            value="{{ old('organization_name', $qualification->organization_name) }}">
                                    </div>
                                </div>

                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">
                                        Address
                                    </label>
                                    <div class="col-sm-12 col-md-7">
                                        <textarea rows="15" cols="30" name="address" class="form-control">{{ old('address', $qualification->address) }}</textarea>
                                    </div>
                                </div>

                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">
                                        Start Date
                                    </label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="date" name="start_date" class="form-control"
                                            value="{{ old('start_date', $qualification->start_date) }}">
                                    </div>
                                </div>

                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">
                                        End Date
                                    </label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="date" name="end_date" class="form-control"
                                            value="{{ old('end_date', $qualification->end_date) }}">
                                    </div>
                                </div>

                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Description</label>
                                    <div class="col-sm-12 col-md-7">
                                        <textarea name="description" class="summernote">{{ old('description', $qualification->description) }}</textarea>
                                    </div>
                                </div>

                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3"></label>
                                    <div class="col-sm-12 col-md-7">
                                        <button class="btn btn-warning">Update</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
