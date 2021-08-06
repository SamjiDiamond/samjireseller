@extends('userlayout')

@section('content')
  <!--Banking Dashboard V1-->
                            <div class="banking-dashboard banking-dashboard-v1">

                                <div class="columns is-multiline">


                                 <br>
                                 <div class="column is-12 car">
                                                <div class="dashboard-card is-contacts">
                                                    <div class="title-wrap">
                                                        <h3 class="dark-inverted">Buy Airtime</h3>
                                                    </div>

                                                    <div class="people-wrap">
                                                        <div class="people">

                                                            <div class="h-avatar is-smal ">

                                                            </div>

                                                        </div>


                                                    </div>
													 <form role="form" action="{{route('user.loadairtime')}}" method="post">
													 @csrf
                                                    <div class="transfer-form">
                                                        <div class="field">
                                                            <div class="control is-combo">
                                                                <div class="image-combo-box">
                                                                    <div class="box-inner">
                                                                        <div class="combo-item">
                                                                            <img src="https://via.placeholder.com/150x150"
                                                                                data-demo-src="{{url('/')}}/assets/img/pic.png"
                                                                                alt="">
                                                                            <span class="selected-item">Select Network</span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="box-chevron">
                                                                        <i data-feather="chevron-down"></i>
                                                                    </div>

                                                                    <div class="box-dropdown">
                                                                        <div class="dropdown-inner has-slimscroll">
                                                                            <ul>
																			<script type="text/javascript">

																			function goDoSomething3(identifier){

																			 document.getElementById("network").value = $(identifier).data('network');
																			 };

																			 </script>
																			  <input type="hidden" name="bankname" id="bankname">
																			  <input type="hidden" name="bank" id="bank">
																			@foreach($network as $k=>$data)
                                                                                <li onclick="goDoSomething3(this);"  data-network="{{$data['symbol']}}" >
                                                                                    <span class="item-icon">
                                                                                        <img src="{{url('/')}}/assets/img/{{$data->image}}"
                                                                                            data-demo-src="{{url('/')}}/assets/img/{{$data->image}}"
                                                                                            alt="">
                                                                                    </span>
                                                                                    <span class="item-name">{{$data['name']}}</span>
                                                                                    <span class="checkmark">
                                                                                        <i data-feather="check"></i>
                                                                                    </span>
                                                                                </li>

																		   @endforeach
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="field">
                                                            <label>Phone Number</label>
                                                            <div class="field has-addons">

                                                            <input id="network" name="network" hidden >
                                                                <div class="control is-expanded">
                                                                    <input class="input" name="number" required type="number" >
                                                                </div>
                                                            </div>
                                                        </div>
                                                        </form>


                                                        <p class="context-text">Click on the button below to proceed</p>

                                                        <div class="submit-wrap">
                                                            <button type="submit"
                                                                class="button h-button is-fullwidth is-primary is-big is-raised is-bold">Buy Airtime</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

<div class="column is-12 car">

								<div class="datatable-toolbar">


                            <div class="buttons">
                                <button class="button h-button is-primary is-elevated">
                                    <span class="icon">
                                        <i class="lnil lnil-bank"></i>
                                    </span>
                                    <span>Successful Transactions</span>
                                </button>
                            </div>
                        </div>

                        <div class="page-content-inner">

                            <!-- Datatable -->
                            <div class="table-wrapper" table-responsive   data-simplebar>
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
                                <div class="section-placeholder">
                                    <div class="placeholder-content">
                                        <img class="light-image" src="{{url('/')}}/assets/img/illustrations/placeholders/search-4.svg" alt="" />
                                        <img class="dark-image" src="{{url('/')}}/assets/img/illustrations/placeholders/search-4-dark.svg" alt="" />
                                        <h3 class="dark-inverted">No data to show</h3>
                                        <p>There is currently no data to show in this list.</p>
                                    </div>
                                </div>
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
