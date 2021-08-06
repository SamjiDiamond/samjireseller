
@extends('userlayout')

@section('content')
<!-- Page content -->
<div class="container-fluid mt--6">
  <div class="content-wrapper">
  <div class="container-fluid mt--6">
  <div class="content-wrapper">
    <div class="row">
      <div class="col-lg-12">
        <div class="card bg-white">
          <div class="card-body">
            <div class="">
              <h3 class="">Buy Internet Data</h3>
              <p class="mt-0 mb-5">Buy Internet Data At The Cheapest And Most Affordable Rate</p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="row">

      @foreach($network as $val)
       <div class="col-md-3 col-6">
          <div class="card">
            <!-- Card body -->
            <div class="card-body">
              <div class="row align-items-center">
                <div class="col-auto">
                  <!-- Avatar -->
                  <a href="#" data-toggle="modal" data-target="#modal-form{{$val->id}}" class="avatar avatar-xl">
                    <img alt="Image placeholder" src="{{url('/')}}/asset/images/{{$val->image}}">
                  </a>
                </div>
                <div class="col ml--2">
                  <h4 class="mb-0 text-primary">
                    <a href="#" data-toggle="modal" data-target="#modal-form{{$val->id}}"><a href="{{route('user.select.internet',$val->symbol)}}" class="button h-action is-hoverable">Select</a>
                  </h4>
                 </div>
              </div>
            </div>
          </div>
      </div>

      @endforeach
    </div>
    <div class="card" id="other">
      <div class="card-header header-elements-inline">
        <h3 class="mb-0">Payment Log</h3>
      </div>
      <div class="table-responsive py-4">
        <table id="empty-datatable" class="table is-datatable is-hoverable table-is-bordered">
                                    <thead>
                                        <tr>
                                            <th>
                                                <div class="control">
                                                    <label class="checkbox is-primary is-outlined is-circle">
                                                        <input type="checkbox">
                                                        <span></span>
                                                    </label>
                                                </div>
                                            </th>
                                            <th>Network</th>
                                            <th>Plan</th>
                                            <th>Number</th>
                                            <th>Amount</th>
                                            <th class="has-text-centered">TRX</th>
                                            <th class="has-text-centered">Status</th>
                                            <th>Date</th>
                                        </tr>
                                    </thead>
                                    <tbody>
									 @foreach($bills as $k=>$val)
									 <tr>
                                                <td>{{++$k}}</td>
                                                <td>{!!$val->network!!}</td>
                                                <td>{!!$val->plan!!}</td>
                                                <td>{!!$val->phone!!}</td>
                                                <td>₦{{number_format($val->amount,2)}}</td>
                                                <td>TR-{{$val->trx}}</td>
                                                <td>
												@if($val->status==1)
												  <span class="tag is-green is-rounded">Successful</span>
												@elseif($val->status==0)
												  <span class="tag is-orange is-rounded">Pending</span>
												@elseif($val->status==2)
												   <span class="tag is-red is-rounded">Declined</span>
												@endif
												</td>
                                                <td>{{date("M d, Y h:i:A", strtotime($val->created_at))}}</td>

                                            </tr>
									@endforeach
									</tbody>
                                </table>

                                <!--Empty Placeholder-->
								@if(count($bills) < 1)
                                <center><div class="section-placeholder">
                                    <div class="placeholder-content">
                                        <img class="light-image" src="{{url('/')}}/asset/images/search-4.svg" width=150 alt="" />

                                        <h3 class="dark-inverted">No data to show</h3>
                                        <p>There is currently no data to show in this list.</p>
                                    </div>
                                </div> </center>
								@endif
      </div>
    </div>


@stop
