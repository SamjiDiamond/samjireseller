
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
              <h3 class="">Utility Bills</h3>
              <p class="mt-0 mb-5">Pay Utility Bills At The Cheapest And Most Affordable Rate</p>
            </div>
          </div>
        </div>
      </div>
    </div>

  <div class="row">
      <div class="col-md-12">
        <!-- Basic layout-->
        <div class="card">
          <div class="card-header header-elements-inline">
            <h3 class="mb-0">Pay Utility Bill</h3>
                <div class="header-elements">
                  <div class="list-icons">
                </div>
              </div>
          </div>
          <div class="card-body">
            <form role="form" action="{{route('user.validateutilitybill')}}" method="post">
			 @csrf
                <div class="form-group row">
                  <label class="col-form-label col-lg-2">Select Company</label>
                  <div class="col-lg-10">
                    <div class="input-group">
                      <span class="input-group-prepend">
                        <span class="input-group-text fa fa-phone"><img class="light-image" src="{{url('/')}}/asset/images/search-4.svg" width=20 alt="" /></span>
                      </span>
                      <select name="meter" class="form-control">
                       <option selected disabled>Select Company</option>
                      @foreach($network as $k=>$data)
                      <option value="{{$data['code']}}">{{$data->name}}</option>
                      @endforeach
                      </select>
                    </div>
                  </div>
                </div>

                 <div class="form-group row">
                  <label class="col-form-label col-lg-2">Select Type</label>
                  <div class="col-lg-10">
                    <div class="input-group">
                      <span class="input-group-prepend">
                        <span class="input-group-text fa fa-phone"><img class="light-image" src="{{url('/')}}/asset/images/search-4.svg" width=20 alt="" /></span>
                      </span>
                      <select  name="type" class="form-control">
                       <option selected disabled>Select Meter Type</option>

                      <option value="01">Prepaid</option>
                      <option value="02">Postpaid</option>

                      </select>
                    </div>
                  </div>
                </div>

                <div class="form-group row">
                  <label class="col-form-label col-lg-2">Meter number</label>
                  <div class="col-lg-10">
                    <div class="input-group">
                      <span class="input-group-prepend">
                        <span class="input-group-text">#</span>
                      </span>
                      <input type="number"  placeholder="Enter Meter Number" name="number" required class="form-control" required>
                    </div>
                  </div>
                </div>



                <div class="text-right">
                  <button type="submit" class="btn btn-primary">Validate</button>
                </div>

            </form>
          </div>
        </div>
        <!-- /basic layout -->
      </div>
    </div>
    <div class="card" id="other">
      <div class="card-header header-elements-inline">
        <h3 class="mb-0">Payment logs</h3>
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
                                            <th>Meter Number</th>
                                            <th>Amount</th>
                                            <th>Token</th>
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
                                                <td>{!!$val->phone!!}</td>
                                                <td>{{$set->cur_sym}}{{number_format($val->amount,2)}}</td>
                                                <td>{!!$val->pin!!}</td>
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
