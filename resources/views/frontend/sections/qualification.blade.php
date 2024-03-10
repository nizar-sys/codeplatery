@push('styles')
<style>
    .home-qualification {
        background: #fff;
        padding-top: 70px;
        padding-bottom: 70px;
    }

    .home-qualification .heading h2 {
        color: #ee6348;
        font-size: 16px;
        text-align: center;
    }

    .home-qualification .heading h3 {
        font-weight: 700;
        font-size: 34px;
        text-align: center;
        margin-bottom: 40px;
    }

    .home-qualification h2.title {
        margin-bottom: 30px;
        font-size: 20px;
        font-weight: 700;
        color: #ee6348;
    }

    .home-qualification .item {
        margin-bottom: 30px;
        position: relative;
        display: block;
    }

    .home-qualification .item:before {
        content: '\25CF';
        font-size: 2rem;
        position: absolute;
        top: -8px;
        left: 0;
        z-index: 100;
        color: #ee6348;
        background-color: inherit;
    }

    .home-qualification .item .v-line {
        content: '';
        position: absolute;
        top: 0;
        left: 9px;
        width: 2px;
        height: 100%;
        background-color: #ee6348;
        z-index: 1;
    }

    .home-qualification .item h3 {
        font-size: 18px;
        font-weight: 700;
    }

    .home-qualification .item h4 {
        font-size: 14px;
        font-weight: 500;
    }

    .home-qualification .item .time {
        font-size: 14px;
        font-weight: 500;
        color: #fff;
    }

    /* responsive item */
    @media (max-width: 767px) {
        .home-qualification .item {
            display: inline;
        }

        .home-qualification .item h3 {
            font-size: 18px;
            font-weight: 700;
            margin-left: 1rem;
        }

        .home-qualification .item h4 {
            font-size: 14px;
            font-weight: 500;
            margin-left: 1rem;
        }

        .home-qualification .item .time {
            font-size: 14px;
            font-weight: 500;
            color: #fff;
            margin-left: 1rem;
        }

        .home-qualification .item:before {
            font-size: 1.5rem; /* Adjust circle size for smaller screens */
        }

        .home-qualification .item .v-line {
            left: 6px; /* Adjust position for smaller screens */
        }
    }
</style>

@endpush
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitle"></h5>
            </div>
            <div class="modal-body" id="modalContent">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn text-white" style="background-color: #ee6348"
                    data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<section class="home-qualification mt-4" id="page-qualification">
    <div class="container">
        <div class="row">
            <div class="col-md-12 heading mb-2 col-sm-12">
                <h2>My Qualification</h2>
                <h3>Education and Experience</h3>
            </div>
            <div class="col-md-6 col-sm-12 mb-4">
                <h2 class="title text-right"><i class="fas fa-graduation-cap"></i> Education</h2>
                <div class="inner text-right">
                    @foreach ($qualificationEducation as $edu)
                        <div style="cursor: pointer" class="item wow fadeInUp open-modal"
                            data-content="{!! nl2br($edu->description) !!}" data-type="Education"
                            data-title="{{ $edu->organization_name }}">
                            <h3>{{ $edu->organization_name }}</h3>
                            <h4>{!! nl2br($edu->address) !!}</h4>
                            <div class="time" style="color: #808080"><i class="far fa-clock"></i> {{ $edu->date }}
                            </div>
                            <div class="{{ $edu->latest || $qualificationEducation->count() != 1 ? 'v-line' : '' }}">
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
            <div class="col-md-6 col-sm-12 mb-4">
                <h2 class="title text-right"><i class="fas fa-award"></i> Experience</h2>
                <div class="inner text-left">
                    @foreach ($qualificationExperience as $exp)
                        <div style="cursor: pointer" class="item wow fadeInUp open-modal"
                            data-content="{!! $exp->description !!}" data-type="Experience"
                            data-title="{{ $exp->organization_name }}">
                            <h3>{{ $exp->organization_name }}</h3>
                            <h4>{{ $exp->address }}</h4>
                            <div class="time" style="color: #808080"><i class="far fa-clock"></i> {{ $exp->date }}
                            </div>
                            <div class="{{ $exp->latest || $qualificationExperience->count() != 1 ? 'v-line' : '' }}">
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</section>

@push('scripts')
    <script>
        $(document).ready(function() {
            $(".open-modal").click(function() {
                var content = $(this).data("content");
                var title = $(this).data("title");
                var type = $(this).data("type");
                $("#modalContent").html(content);
                $("#modalTitle").html(${type} ${title});
                $("#exampleModal").modal("show");
            });
        });
    </script>
@endpush