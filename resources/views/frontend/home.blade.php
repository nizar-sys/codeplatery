@extends('frontend.layouts.layout')

@push('styles')
    <style>
        /* CSS untuk tombol WhatsApp */
        .whatsapp-button {
            position: fixed;
            bottom: 30px;
            left: 20px;
            background-color: #25d366;
            color: #fff;
            padding: 10px 20px;
            border-radius: 50px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            display: flex;
            align-items: center;
            z-index: 3;
        }

        .whatsapp-button a {
            text-decoration: none;
            color: #fff;
            display: flex;
            align-items: center;
        }

        .whatsapp-button img {
            margin-right: 10px;
            width: 20px;
        }

        /* Hover effect */
        .whatsapp-button:hover {
            background-color: #128c7e;
        }
        .section-padding-service{
        padding-top: 30px !important;
        }

        .section-padding-blog{
            padding-top: 100px !important;
        }



        
    </style>
@endpush

@section('content')
    <!-- Header-Area-Start -->
    @include('frontend.sections.hero')
    <!-- Header-Area-End -->

    <!-- Service-Area-Start -->
    @include('frontend.sections.service')
    <!-- Service-Area-End -->

    <!-- About-Area-Start -->
    @include('frontend.sections.about')
    <!-- About-Area-End -->

    <!-- Qualification-Area-Start -->
    @include('frontend.sections.qualification')
    <!-- Qualification-Area-End -->

    <!-- Portfolio-Area-Start -->
    @include('frontend.sections.portfolio')
    <!-- Portfolio-Area-End -->

    <!-- Skills-Area-Start -->
    @include('frontend.sections.skill')
    <!-- Skills-Area-End -->

    <!-- Experience-Area-Start -->
    {{-- @include('frontend.sections.experience') --}}
    <!-- Experience-Area-End -->

    <!-- Testimonial-Area-Start -->
    {{-- @include('frontend.sections.testimonial') --}}
    <!-- Testimonial-Area-End -->

    <!-- Blog-Area-Start -->
    @include('frontend.sections.blog')
    <!-- Blog-Area-End -->

    <!-- Contact-Area-Start -->
    @include('frontend.sections.contact')
    <!-- Contact-Area-End -->

    <div class="whatsapp-button">
        <a href="https://api.whatsapp.com/send/?phone=6281299887253&text=Assalamu%27alaikum%2C+perkenalkan+nama+saya..&type=phone_number&app_absent=0" target="_blank">
            Chat via WhatsApp
        </a>
    </div>
@endsection
