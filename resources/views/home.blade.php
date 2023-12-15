@extends('layouts.panel')

@section('content')

<style>
    .custom-img {
        width: 200%;
        height: auto;
    }
</style>

<div class="row mt-5 justify-content-center">
    <div class="col-xl-8">
        <div class="card shadow">
            <div class="card-header border-">
                
                    <div class="row">
                        <div class="col-md-4">
                            <img src="{{ asset('img/brand/ga1.jpg') }}" alt="/" class="custom-img mb-3">
                        </div>
                        <div class="col-md-4">
                            <img src="{{ asset('img/brand/ga2.jpg') }}" alt="/" class="custom-img mb-3">
                        </div>
                        <div class="col-md-4">
                            <img src="{{ asset('img/brand/ga3.jpg') }}" alt="/" class="custom-img mb-3">
                        </div>
                        <div class="col-md-4">
                            <img src="{{ asset('img/brand/ga4.jpg') }}" alt="/" class="custom-img mb-3">
                        </div>
                        <div class="col-md-4">
                            <img src="{{ asset('img/brand/ga5.jpg') }}" alt="/" class="custom-img mb-3">
                        </div>
                        <div class="col-md-4">
                            <img src="{{ asset('img/brand/g6.jpg') }}" alt="/" class="custom-img mb-3">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
