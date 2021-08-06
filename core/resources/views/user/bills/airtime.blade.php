@extends('userlayout')

@section('content')
<div class="container-fluid mt--6">
  <div class="content-wrapper">
    <div class="row">
      <div class="col-lg-12">
        <div class="card bg-white">
          <div class="card-body">
            <div class="">
              <h3 class="">Buy Aitime</h3>
              <p class="mt-0 mb-5">Buy Airtime At The Cheapest And Most Affordable Rate</p>
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
            <h3 class="mb-0">Buy Airtime</h3>
                <div class="header-elements">
                  <div class="list-icons">
                </div>
              </div>
          </div>
          <div class="card-body">
             <form role="form" action="{{route('user.loadairtime')}}" method="post">
			@csrf
                <div class="form-group row">
                  <label class="col-form-label col-lg-2">Select Network</label>
                  <div class="col-lg-10">
                    <div class="input-group">
                      <span class="input-group-prepend">
                        <span class="input-group-text fa fa-phone"><img class="light-image" src="{{url('/')}}/asset/images/search-4.svg" width=20 alt="" /></span>
                      </span>
                      <select name="network" class="form-control">
                       <option selected disabled>Select Mobile Network</option>
                      @foreach($network as $k=>$data)
                      <option value="{{$data['symbol']}}">{{$data->name}}</option>
                      @endforeach
                      </select>
                    </div>
                  </div>
                </div>

                <div class="form-group row">
                  <label class="col-form-label col-lg-2">Phone number</label>
                  <div class="col-lg-10">
                    <div class="input-group">
                      <span class="input-group-prepend">
                        <span class="input-group-text">#</span>
                      </span>
                      <input type="number" name="number" required maxlength="12" class="form-control" required>
                    </div>
                  </div>
                </div>
                <div class="form-group row">
                  <label class="col-form-label col-lg-2">Amount</label>
                  <div class="col-lg-10">
                    <div class="input-group">
                      <span class="input-group-prepend">
                        <span class="input-group-text">{{$currency->symbol}}</span>
                      </span>
                      <input type="number" class="form-control" name="amount" id="amount" required>
                      <span class="input-group-append">
                        <span class="input-group-text">.00</span>
                      </span>
                    </div>
                  </div>
                </div>
                <div class="text-right">
                  <a href="#" data-toggle="modal" data-target="#modal-form" class="btn btn-primary">Proceed<i class="icon-paperplane ml-2"></i></a>
                </div>
                <div class="modal fade" id="modal-form" tabindex="-1" role="dialog" aria-labelledby="modal-form" aria-hidden="true">
                  <div class="modal-dialog modal- modal-dialog-centered modal-sm" role="document">
                    <div class="modal-content">
                      <div class="modal-body p-0">
                        <div class="card bg-white border-0 mb-0">
                          <div class="card-header bg-transparent pb-2ß">
                            <div class="text-dark text-center mt-2 mb-3">Enter account pin to complete transaction</div>
                            <div class="text-center text-dark"><i class="ni ni-key-25 icon-2x"></i></div>
                          </div>
                          <div class="card-body px-lg-5 py-lg-5">
                            <div class="form-group">
                              <div class="input-group input-group-merge input-group-alternative">
                                <div class="input-group-prepend">
                                  <span class="input-group-text"><i class="ni ni-lock-circle-open text-dark"></i></span>
                                </div>
                                <input class="form-control" placeholder="Pin" type="password" name="pin">
                              </div>
                            </div>
                          <div class="text-right">
                            <button type="submit" class="btn btn-primary">Buy</button>
                          </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
            </form>
          </div>
        </div>
        <!-- /basic layout -->
      </div>
    </div>

  <!--Banking Dashboard V1-->
                            <div class="banking-dashboard banking-dashboard-v1">

                                <div class="columns is-multiline">


                                 <br>


<div class="column is-12 car">

								<div class="datatable-toolbar">



                        </div>

                        <div class="page-content-inner card">

                            <!-- Datatable -->
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
                                                <td>{!!$val->phone!!}</td>
                                                <td>{{$set->cur_sym}}{{number_format($val->amount,2)}}</td>
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

                            <div id="paging-first-datatable" class="pagination datatable-pagination">
                                <div class="datatable-info">
                                   {{$bills->links()}}
                                </div>
                            </div>

                        </div>

                    </div>
                </div>

                            </div>

                        </div>

                    </div>
                </div>

            </div>
            <!-- Concatenated plugins -->
@stop
