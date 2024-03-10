<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Mail\ContactMail;
use App\Models\About;
use App\Models\Blog;
use App\Models\BlogCategory;
use App\Models\BlogSectionSetting;
use App\Models\Category;
use App\Models\ContactSectionSetting;
use App\Models\Experience;
use App\Models\Feedback;
use App\Models\FeedbackSectionSetting;
use App\Models\Hero;
use App\Models\PortfolioItem;
use App\Models\PortfolioSectionSetting;
use App\Models\Qualification;
use App\Models\Service;
use App\Models\SkillItem;
use App\Models\SkillSectionSetting;
use App\Models\TyperTitle;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

use function Ramsey\Uuid\v1;

class HomeController extends Controller
{
    public function index()
    {
        $hero = Hero::first();
        $typerTitles = TyperTitle::all();
        $services = Service::all();
        $about = About::first();
        $portfolioTitle = PortfolioSectionSetting::first();
        $portfolioCategories = Category::all();
        $portfolioItems = PortfolioItem::all();
        $skill = SkillSectionSetting::first();
        $skillItems = SkillItem::all();
        $experience = Experience::first();
        $feedbacks = Feedback::all();
        $feedbackTitle = FeedbackSectionSetting::first();
        $blogs = Blog::latest()->take(5)->get();
        $blogTitle = BlogSectionSetting::first();
        $contactTitle = ContactSectionSetting::first();
        $qualifications = Qualification::all();

        $qualificationEducation = $qualifications->where('type', 'education')->sortByDesc('start_date');
        $qualificationExperience = $qualifications->where('type', 'experience')->sortByDesc('start_date');

        return view(
            'frontend.home',
            compact(
                'hero',
                'typerTitles',
                'services',
                'about',
                'portfolioTitle',
                'portfolioCategories',
                'portfolioItems',
                'skill',
                'skillItems',
                'experience',
                'feedbacks',
                'feedbackTitle',
                'blogs',
                'blogTitle',
                'contactTitle',
                'qualificationEducation',
                'qualificationExperience'
            )
        );
    }

    /**Portfolio-details */
    public function showPortfolio($id)
    {
        $portfolio = PortfolioItem::findOrFail($id);
        return view('frontend.portfolio-details', compact('portfolio'));
    }

    public function showBlog($id)
    {
        $blog = Blog::with([
            'comments' => function ($query) {
                $query->with('childrens')->latest()->whereNull('parent_id');
            },
        ])->findOrFail($id);

        $previousPost = Blog::where('id', '<', $blog->id)->orderBy('id', 'desc')->first();
        $nextPost = Blog::where('id', '>', $blog->id)->orderBy('id', 'asc')->first();

        $latestPosts = Blog::latest()->take(5)->get();
        $categories = BlogCategory::all();

        $archivesDate = Blog::selectRaw('YEAR(created_at) as year, MONTHNAME(created_at) as month, COUNT(*) as published')
            ->groupBy('year', 'month')
            ->orderByRaw('MIN(created_at) DESC')
            ->get()
            ->map(function ($item) {
                $year = $item->year;
                $month = $item->month;
                $date = Carbon::parse($year . '-' . $month)->format('m-Y');
                $item->date = $date;
                return $item;
            })
            ->groupBy('year');


        return view('frontend.blog-details', compact('blog', 'previousPost', 'nextPost', 'latestPosts', 'categories', 'archivesDate'));
    }

    public function blog(Request $request)
    {
        $blogs = Blog::latest()
            ->when($request->filled('category'), function ($query) use ($request) {
                $query->whereHas('getCategory', function ($query) use ($request) {
                    $query->where('slug', $request->category);
                });
            })
            ->when($request->filled('archive'), function ($query) use ($request) {
                $query->whereMonth('created_at', $request->archive);
            })
            ->paginate(6);
        return view('frontend.blog', compact('blogs'));
    }

    public function contact(Request $request)
    {
        $request->validate([
            'name' => ['required', 'max:200'],
            'subject' => ['required', 'max:300'],
            'email' => ['required', 'email'],
            'message' => ['required', 'max:2000'],
        ]);

        Mail::send(new ContactMail($request->all()));

        return response(['status' => 'success', 'message' => 'Mail Sended Successfully !']);
    }

    public function comment(Request $request)
    {
        $payloadComment = [];

        foreach ($request->comment_text as $key => $comment_text) {
            if ($comment_text) {
                $payloadComment = [
                    'name' => $request->name[$key],
                    'email' => $request->email[$key],
                    'comment_text' => $comment_text,
                    'blog_id' => $request->blog_id,
                    'parent_id' => $request->parent_id[$key] ?? null,
                ];
            }

            if (auth()->check()) {
                $payloadComment['user_id'] = auth()->id();
            }
        }

        Blog::findOrFail($request->blog_id)->comments()->create($payloadComment);

        return back();
    }
}
