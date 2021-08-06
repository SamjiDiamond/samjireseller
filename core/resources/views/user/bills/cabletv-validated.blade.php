@extends('userlayout')

@section('content')
  <div class="container-fluid mt--6">
  <div class="content-wrapper">
    <div class="row">
      <div class="col-lg-12">
        <div class="card bg-white">
          <div class="card-body">
            <div class="">
              <h3 class="">Pay {{$network->name}} Subscription Fee</h3>
              <p class="mt-0 mb-5">Buy {{$network->name}} Bouquet Plan At The Cheapest And Most Affordable Rate</p>
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
            <h3 class="mb-0">Pay {{$network->name}} Subscription Fee</h3>
                <div class="header-elements">
                  <div class="list-icons">
                </div>
              </div>
          </div>
          <div class="card-body">
              <form role="form" action="{{route('user.buytv',$decoder)}}" method="post">
			  @csrf
                <div class="form-group row">
                  <label class="col-form-label col-lg-2">Select Plan</label>
                  <div class="col-lg-10">
                    <div class="input-group">
                      <span class="input-group-prepend">
                        <span class="input-group-text"><img class="light-image" src="{{url('/')}}/asset/images/{{$network->image}}" width=20 alt="" /></span>
                      </span>

<script>
function myFunction() {
  var amount = $("#mytv option:selected").attr('data-amount');
  var amount2 = $("#mytv option:selected").attr('data-amount2');

  document.getElementById("amount2").value = "₦"+amount;
  document.getElementById("amount").value = amount2;

 };
</script>
                      <select id="mytv" onchange="myFunction()"  name="plan" class="form-control">
                       <option selected disabled>Select Bouquet Plan</option>
                     @foreach($plans[$deco][0]['PRODUCT'] as $k=>$data)
                      <option data-amount="{{number_format($data['PACKAGE_AMOUNT'])}}"  data-amount2="{{$data['PACKAGE_AMOUNT']}}" value="{{$data['PACKAGE_ID']}}">{{$data['PACKAGE_ID']}} &nbsp;(₦{{number_format($data['PACKAGE_AMOUNT'])}})</option>
                      @endforeach
                      </select>
                    </div>
                  </div>
                </div>

                <div class="form-group row">
                  <label class="col-form-label col-lg-2">Decoder Number</label>
                  <div class="col-lg-10">
                    <div class="input-group">
                      <span class="input-group-prepend">
                        <span class="input-group-text"><i class="fa fa-fax"></i></span>
                      </span>
                      <input type="number" name="number" readonly required value="{{$number}}" class="form-control" required>
                    </div>
                  </div>
                </div>
                 <div class="form-group row">
                  <label class="col-form-label col-lg-2">Amount</label>
                  <div class="col-lg-10">
                    <div class="input-group">
                      <span class="input-group-prepend">
                        <span class="input-group-text">₦</span>
                      </span>
                      <input type="numbser" hidden name="amount" placeholder="0.00"  id="amount" class="form-control" required>
                      <input type="numbser"  placeholder="0.00" disabled  id="amount2" class="form-control" required>
                    </div>
                  </div>
                </div>
                <div class="form-group row">
                  <label class="col-form-label col-lg-2">Customer Name</label>
                  <div class="col-lg-10">
                    <div class="input-group">
                      <span class="input-group-prepend">
                        <span class="input-group-text"><i class="fa fa-user"></i></span>
                      </span>
                      <input name="name" readonly value="{{$name}}" class="form-control" required>
                    </div>
                     <p class="context-text"><a class="text-danger"><b>Please note you will be charged a service fee of ₦100 for this transaction.</b></a></p>
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
                            <button type="submit" class="btn btn-primary">Pay</button>
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

@stop
