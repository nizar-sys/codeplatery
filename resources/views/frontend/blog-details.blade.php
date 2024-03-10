@extends('frontend.layouts.layout')

@push('styles')
    <style>
        .comment {
            margin-top: 40px;
        }

        .comment h2 {
            font-size: 18px;
            font-weight: 700;
            color: #ee6348;
            margin-bottom: 20px;
        }

        .comment .comment-section {
            margin-bottom: 20px;
        }

        .comment .comment-box {
            background: #eeeeee;
            padding: 15px;
        }

        .comment .comment-box .left img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            border: 1px solid #b6b6b6;
            margin-right: 10px;
        }

        .comment .comment-box .right .name {
            font-size: 16px;
            font-weight: 600;
        }

        .comment .comment-box .right .date {
            font-size: 12px;
            color: #515151;
            margin-bottom: 15px;
        }

        .comment .comment-box .right .text {
            font-size: 13px;
        }

        .comment .comment-box .right .reply {
            margin-top: 10px;
        }

        .comment .comment-box .right .reply a {
            color: #ee6348;
            font-size: 14px;
        }

        .comment .reply-box {
            padding-left: 50px;
        }

        .comment input,
        .comment textarea,
        .comment button {
            font-size: 14px;
        }

        .comment textarea {
            height: 200px;
        }

        .comment button {
            background: #ee6348;
            border: 0;
        }

        .comment button:hover {
            background: #000 !important;
        }

        @media only screen and (max-width: 767px) {
            .comment button {
                margin-bottom: 50px;
            }
        }

        @media only screen and (max-width: 450px) {
            .comment .reply-box {
                padding-left: 40px;
            }
        }

        /* CSS */
        .accordion {
            background-color: #fff;
            color: #444;
            cursor: pointer;
            padding: 18px;
            width: 100%;
            text-align: left;
            border: none;
            outline: none;
            transition: 0.4s;
        }

        .panel {
            display: none;
            padding: 0 18px;
            background-color: white;
            overflow: hidden;
        }
    </style>
@endpush

@section('content')
    <header class="site-header parallax-bg">
        <div class="container">
            <div class="row d-flex align-items-center">
                <div class="col-sm-8">
                    <h2 class="title">Blog Details</h2>
                </div>
                <div class="col-sm-4">
                    <div class="breadcrumbs">
                        <ul>
                            <li><a href="#">Home</a></li>
                            <li>Portfolio</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Portfolio-Area-Start -->
    <section class="blog-details section-padding">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-9">
                    <h2 class="head-title">{{ $blog->title }}</h2>
                    <div class="blog-meta">
                        <div class="single-meta">
                            <div class="meta-title">Published</div>
                            <h4 class="meta-value"><a
                                    href="javascript:void(0)">{{ date('d M, Y', strtotime($blog->created_at)) }}</a></h4>
                        </div>
                        <div class="single-meta">
                            <div class="meta-title">Category</div>
                            <h4 class="meta-value"><a href="javascript:void(0)">{{ $blog->getCategory->name }}</a></h4>
                        </div>
                        <div class="single-meta">
                            <div class="meta-title">Create By</div>
                            <h4 class="meta-value"><a href="javascript:void(0)">{{ $blog->getCreatedBy?->name ?? '' }}</a>
                            </h4>
                        </div>
                    </div>
                    <figure class="image-block">
                        <img class="img-fix" src="{{ asset($blog->image) }}" alt="">
                    </figure>
                    <div class="description">
                        {!! $blog->description !!}
                    </div>
                    <div class="share mt-3 mb-2">
                        <script type="text/javascript"
                            src="https://platform-api.sharethis.com/js/sharethis.js#property=633263d3bfbc4500128cca2f&product=inline-share-buttons"
                            async="async"></script>
                        <div class="sharethis-inline-share-buttons"></div>
                    </div>

                    <form action="{{ route('blog.comment') }}" method="post">
                        @csrf
                        <input type="hidden" name="blog_id" value="{{ $blog->id }}">
                        <div class="comment mt-4">
                            <h2>{{ $blog->comments()->count() }} Comments</h2>
                            @foreach ($blog->comments as $comment)
                                <div class="comment-section">
                                    @include('components._comment', ['comment' => $comment])
                                </div>
                            @endforeach

                            <div class="mt_40"></div>

                            <h2>Leave Your Comment</h2>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <input type="text" name="name[]" class="form-control" placeholder="Name" @if (auth()->check())
                                            value="{{ auth()->user()->name }}"
                                            readonly
                                            @else
                                            value=""
                                            @endif>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <input type="email" name="email[]" class="form-control"
                                            placeholder="Email Address" @if (auth()->check())
                                            value="{{ auth()->user()->email ?? '' }}"
                                            readonly
                                            @endif>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <textarea class="form-control" name="comment_text[]" rows="3" placeholder="Comment"></textarea>
                            </div>
                            <div class="mb-3">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </div>
                    </form>

                    <div class="single-navigation">
                        @if ($previousPost)
                            <a href="{{ route('show.blog', $previousPost->id) }}" class="nav-link"><span class="icon"><i
                                        class="fal fa-angle-left"></i></span><span
                                    class="text">{{ $previousPost->title }}</span></a>
                        @endif

                        @if ($nextPost)
                            <a href="{{ route('show.blog', $nextPost->id) }}" class="nav-link"><span
                                    class="text">{{ $nextPost->title }}</span><span class="icon"><i
                                        class="fal fa-angle-right"></i></span></a>
                        @endif


                    </div>
                </div>
                <div class="col-sm-12 col-md-3">
                    <div class="sidebar">
                        <div class="widget">
                            <h2>Latest Post</h2>
                            <ul>
                                @foreach ($latestPosts as $post)
                                    <li><a style="color: {{ $post->id == $blog->id ? '#ee6348' : '#000' }}"
                                            href="{{ route('show.blog', $post->id) }}">{{ $post->title }}</a></li>
                                @endforeach
                            </ul>
                        </div>
                        <div class="widget">
                            <h2>Categories</h2>
                            <ul>
                                @foreach ($categories as $category)
                                    <li><a style="color: {{ $category->id == $blog->getCategory->id ? '#ee6348' : '#000' }}"
                                            href="{{ route('blog', ['category' => $category->slug]) }}">{{ $category->name }}</a>
                                    </li>
                                @endforeach
                            </ul>
                        </div>
                        <div class="widget">
                            <h2>Archives</h2>
                            <ul id="archivesAccordion">
                                @foreach ($archivesDate as $year => $archives)
                                    <li>
                                        <button class="accordion" style="color: {{ $year == $blog->created_at->format('Y') ? '#ee6348' : '#000' }}">{{ $year }}</button>
                                        <div class="panel">
                                            <ul>
                                                @foreach ($archives as $archive)
                                                    <li><a style="color: {{$blog->created_at->format('m-Y') == $archive->date ? '#ee6348' : '#000' }}"
                                                            href="{{ route('blog', ['archive' => $archive->date]) }}">{{ $archive->month }}
                                                            ({{ $archive->published }})
                                                        </a></li>
                                                @endforeach
                                            </ul>
                                        </div>
                                    </li>
                                @endforeach
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Portfolio-Area-End -->
@endsection

@push('scripts')
    <script>
        // Tambahkan event listener untuk setiap tombol "Reply"
        $(document).ready(function() {
            $('.reply-button').click(function(e) {
                e.preventDefault();
                $(this).closest('.comment-box').find('.reply-form').slideToggle();
            });

            var acc = document.getElementsByClassName("accordion");
            var i;

            for (i = 0; i < acc.length; i++) {
                acc[i].addEventListener("click", function() {
                    this.classList.toggle("active");
                    var panel = this.nextElementSibling;
                    if (panel.style.display === "block") {
                        panel.style.display = "none";
                    } else {
                        panel.style.display = "block";
                    }
                });
            }
        });
    </script>
@endpush
