<?php

namespace App\Http\Controllers;

use App\Models\About;
use App\Models\Hero;
use App\Models\TyperTitle;
use Illuminate\Http\Request;

class FrontendController extends Controller
{
    public function index()
    {
        try {
            $typerTitles = TyperTitle::all('id', 'title');
            $hero = Hero::first();
            $footerInfo = \App\Models\FooterInfo::first(['info', 'copy_right', 'powered_by']); 
            $footerIcons = \App\Models\FooterSocialLink::all('icon', 'url');
            $footerUsefulLinks = \App\Models\FooterUsefulLink::all('name', 'url');
            $footerContact = \App\Models\FooterContactInfo::first(['address', 'phone', 'email']);
            $footerHelpLinks = \App\Models\FooterHelpLink::all('name', 'url');
            $about = About::first();

            return response()->json([
                'status' => 'success',
                'data' => [
                    'typer_title' => $typerTitles,
                    'hero' => $hero,
                    'footer_info' => $footerInfo,
                    'footer_icons' => $footerIcons,
                    'footer_useful_links' => $footerUsefulLinks,
                    'footer_contact' => $footerContact,
                    'footer_help_links' => $footerHelpLinks,
                    'about_me' => $about,
                ]
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'error',
                'message' => $e->getMessage()
            ], 500);
        }
    }

    public function heroSection()
    {
        try {
            $typerTitles = TyperTitle::all('id', 'title');
            $hero = Hero::first();

            return response()->json([
                'status' => 'success',
                'data' => [
                    'typer_title' => $typerTitles,
                    'hero' => $hero
                ]
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'error',
                'message' => $e->getMessage()
            ], 500);
        }
    }

    public function footerSection()
    {
        try {
            $footerInfo = \App\Models\FooterInfo::first(['info', 'copy_right', 'powered_by']); 
            $footerIcons = \App\Models\FooterSocialLink::all('icon', 'url');
            $footerUsefulLinks = \App\Models\FooterUsefulLink::all('name', 'url');
            $footerContact = \App\Models\FooterContactInfo::first(['address', 'phone', 'email']);
            $footerHelpLinks = \App\Models\FooterHelpLink::all('name', 'url');

            return response()->json([
                'status' => 'success',
                'data' => [
                    'footer_info' => $footerInfo,
                    'footer_icons' => $footerIcons,
                    'footer_useful_links' => $footerUsefulLinks,
                    'footer_contact' => $footerContact,
                    'footer_help_links' => $footerHelpLinks
                ]
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'error',
                'message' => $e->getMessage()
            ], 500);
        }
    }
}
