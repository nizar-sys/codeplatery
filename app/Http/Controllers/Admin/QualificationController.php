<?php

namespace App\Http\Controllers\Admin;

use App\DataTables\QualificationDataTable;
use App\Http\Controllers\Controller;
use App\Http\Requests\RequestStoreQualification;
use App\Models\Qualification;
use Illuminate\Http\Request;

class QualificationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(QualificationDataTable $dataTables)
    {
        return $dataTables->render('admin.qualifications.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.qualifications.create'); 
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(RequestStoreQualification $request)
    {
        $qualification = Qualification::create($request->validated());

        toastr('Created Successfully', 'success');
        return redirect(route('admin.qualifications.index'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $qualification = Qualification::findOrFail($id);
        return view('admin.qualifications.edit', compact('qualification'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(RequestStoreQualification $request, $id)
    {
        $qualification = Qualification::findOrFail($id);
        $qualification->update($request->validated());

        toastr('Updated Successfully', 'success');
        return redirect(route('admin.qualifications.index'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $skill = Qualification ::findOrFail($id);
        $skill->delete();
    }
}
