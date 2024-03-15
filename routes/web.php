<?php

use App\Http\Controllers\Admin\AboutController;
use App\Http\Controllers\Admin\BlogCategoryController;
use App\Http\Controllers\Admin\BlogController;
use App\Http\Controllers\Admin\BlogSectionSettingController;
use App\Http\Controllers\Admin\ContactSectionSettingController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\FooterSocialLinkController;
use App\Http\Controllers\Admin\HeroController;
use App\Http\Controllers\Admin\ProfileController;
use App\Http\Controllers\Admin\ServiceController;
use App\Http\Controllers\Admin\SettingController;
use App\Http\Controllers\Admin\TyperTitleController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\ExperienceController;
use App\Http\Controllers\Admin\FeedbackController;
use App\Http\Controllers\Admin\FeedbackSectionSettingController;
use App\Http\Controllers\Admin\FooterContactInfoController;
use App\Http\Controllers\Admin\FooterHelpLinkController;
use App\Http\Controllers\Admin\FooterInfoController;
use App\Http\Controllers\Admin\FooterUsefulLinkController;
use App\Http\Controllers\Admin\GeneralSettingController;
use App\Http\Controllers\Admin\PortfolioItemController;
use App\Http\Controllers\Admin\PortfolioSectionSettingController;
use App\Http\Controllers\Admin\QualificationController;
use App\Http\Controllers\Admin\SeoSettingController;
use App\Http\Controllers\Admin\SkillItemController;
use App\Http\Controllers\Admin\SkillSectionSettingController;
use App\Http\Controllers\Frontend\HomeController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/',[HomeController::class, 'index'])->name('home');
Route::get('portfolio-details/{id}', [HomeController::class, 'showPortfolio'])->name('show.portfolio');
Route::get('blog-details/{id}', [HomeController::class, 'showBlog'])->name('show.blog');
Route::get('blogs', [HomeController::class, 'blog'])->name('blog'); 
Route::post('contact', [HomeController::class, 'contact'])->name('contact');
Route::post('post-comment', [HomeController::class, 'comment'])->name('blog.comment');
Route::get('qualification', [QualificationController::class, 'index'])->name('qualification'); 

/** Admin Routes */

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php'; 

Route::get('dashboard',[DashboardController::class, 'index'])->middleware('auth')->name('dashboard');


/** Admin Route**/
Route::group(['middleware' => ['auth'], 'prefix' => 'admin', 'as' => 'admin.'], function(){
    Route::resource('hero', HeroController::class);
    Route::resource('typer-title', TyperTitleController::class);

    /** Service **/
    Route::resource('service', ServiceController::class);

    /** About **/
    Route::get('resume/download',[AboutController::class, 'resumeDownload'])->name('resume.download');
    Route::resource('about', AboutController::class);

    /** Portfolio Category **/
    Route::resource('category', CategoryController::class);

    /** Portfolio Item Route **/
    Route::resource('portfolio-item', PortfolioItemController::class);

     /** Portfolio Section Setting Route **/
     Route::resource('portfolio-section-setting', PortfolioSectionSettingController::class);

     /** Skill Section Setting Route **/
     Route::resource('skill-section-setting', SkillSectionSettingController::class);

     /** Skill Item Route **/
     Route::resource('skill-item', SkillItemController::class);

     /** Qualifications Route **/
     Route::resource('qualifications', QualificationController::class);

     /** Experience Route **/
     Route::resource('experience', ExperienceController::class);

     /** Feedback Route **/
     Route::resource('feedback', FeedbackController::class);
     /** Feedback Section Setting Route **/
     Route::resource('feedback-section-setting', FeedbackSectionSettingController::class);

     /** Blog Section Setting Route **/
     Route::resource('blog-category', BlogCategoryController::class);
     /** Blog Route **/
     Route::resource('blog', BlogController::class);
     /** Blog Section Setting Route **/
     Route::resource('blog-section-setting', BlogSectionSettingController::class);

    /** Contact Section Setting Route **/
    Route::resource('contact-section-setting', ContactSectionSettingController::class);
 
    /**Footer Social Link Route **/
    Route::resource('footer-social', FooterSocialLinkController::class);
    /**Footer Information Route **/
    Route::resource('footer-info', FooterInfoController::class);
    /**Footer Contact Info Route **/
    Route::resource('footer-contact-info', FooterContactInfoController::class);
    /**Footer Useful Links **/
    Route::resource('footer-useful-links', FooterUsefulLinkController::class);
    /**Footer Help Links **/
    Route::resource('footer-help-links', FooterHelpLinkController::class);


    /**Setting Route**/
    Route::get('settings', SettingController::class)->name('setting.index');

    /**General Setting Route **/
    Route::resource('general-setting', GeneralSettingController::class);


    /**Seo Setting Route **/
    Route::resource('seo-setting', SeoSettingController::class);
});
//admin/hero