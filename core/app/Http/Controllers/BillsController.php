<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;
use Mail;
use App\Models\User;
use App\Models\Inbox;
use App\Models\Etemplate;
use App\Models\Settings;
use App\Models\Power;
use App\Models\Internet;
use App\Models\Bill;
use App\Models\Network;
use Carbon\Carbon;
use Session;
use Image;
use Redirect;




class BillsController extends Controller
{


    public function __construct()
    {
        $this->middleware('auth');
    }


    public function airtime()
    {
        $data['title']='Airtime';
        $data['network']= Network::whereAirtime(1)->whereStatus(1)->get();
        $data['bills']= Bill::whereUser_id(Auth::user()->id)->whereType(1)->whereStatus(1)->paginate(6);
        return view('user.bills.airtime', $data);
    }


     public function loadairtime(Request $request)
    {
       $user = Auth::user();
	   $request->validate([
            'network' => 'required',
            'number' => 'required',
            'amount' => 'required|integer|min:100',

        ], [
            'number.required' => 'Please enter your mobile phone number',
            'network.required' => 'Please select a mobile network',
            'amount.required' => 'Please enter an amount to buy',
        ]);



		   if ($request->amount > $user->balance) {
		   return back()->with("alert", "Insufficient wallet balance. Please deposit more fund and try again");
        }

         if($user->pin != $request->pin){

        return back()->with('alert', 'Transaction Pin Is Incorrect');
         }



		$trx = strtoupper(str_random(20));
		$basic = Settings::first();
        if(strtolower($request->network)=="mtn"){
            $net=01;
        }elseif(strtolower($request->network)=="glo"){
            $net=02;
        }elseif(strtolower($request->network)=="9mobile"){
            $net=03;
        }elseif(strtolower($request->network)=="airtel"){
            $net=04;
        }else{
            $net=0;
        }

        $baseUrl = "https://www.nellobytesystems.com";
        $endpoint = "/APIAirtimeV1.asp?UserID=".$basic->clubid."&APIKey=".$basic->clubkey."&MobileNetwork=".$net."&MobileNumber=".$request->number."&Amount=".$request->amount."&RequestID=".$trx."&CallBackURL=http://www.your-website.com";

        $url=$baseUrl.$endpoint;
        // Perform initialize to validate name on server
        $result = file_get_contents($url);
        $rep=json_decode($result, true);
        //return response()->json(['status' => 0, 'message' => $rep]);


         if(!isset($rep['status'])){
         return back()->with('alert', $rep['status'].'API Gateway Error');
        }

        if($rep['status'] != "ORDER_RECEIVED")
        {
        return back()->with('alert', 'We cant service your request at the moment, please try again later');
        }
        if($rep['status'] == "ORDER_RECEIVED")
        {
        $product['user_id'] = Auth::id();
        $product['network'] = $request->network;
        $product['phone'] = $request->number;
        $product['type'] = 1;
        $product['remark'] = "Recharge was successful";
        $product['trx'] = $trx;
        $product['status'] = 1;
        $product['amount'] = $request->amount;
        Bill::create($product);


        $user = Auth::user();
        $user->balance = $user->balance - $request->amount;
        $user->save();
        return back()->with('success', 'Airtime recharge was successful');

        }
        else{

         return back()->with('alert', 'Error loading airtime');
        }

    }




	public function internet()
    {
        $user = Auth::user();



         $data['network'] = Network::whereInternet(1)->whereStatus(1)->get();

        $data['title'] = "Internet Data";

		 $data['bills'] = Bill::whereStatus(1)->where('user_id', Auth::id())->latest()->whereType(2)->paginate(7);


        return view('user.bills.internet', $data);
    }


     public function selectinternet($id)
    {

        $basic = Settings::first();
        $network= Network::whereInternet(1)->whereCode($id)->whereStatus(1)->first();
		 $curl = curl_init();

		  curl_setopt_array($curl, array(
		  CURLOPT_URL => "https://www.nellobytesystems.com/APIDatabundlePlansV1.asp",
		  CURLOPT_RETURNTRANSFER => true,
		  CURLOPT_ENCODING => "",
		  CURLOPT_MAXREDIRS => 10,
		  CURLOPT_TIMEOUT => 0,
		  CURLOPT_FOLLOWLOCATION => true,
		  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		  CURLOPT_CUSTOMREQUEST => "GET",

		));

		$response = curl_exec($curl);

		curl_close($curl);
		$rep=json_decode($response, true);


        $plans = $rep['MOBILE_NETWORK'][$network->code][0]['PRODUCT'];
		foreach($plans as $data) {
		$exist = Internet::where('code', $data['PRODUCT_CODE'])->count();
		if($exist == 0)
		{
		$product['name'] = $data['PRODUCT_NAME'];
		$product['amount'] = $data['PRODUCT_AMOUNT'];
        $product['code'] = $data['PRODUCT_CODE'];
        $product['amount'] = $data['PRODUCT_AMOUNT'];
        $product['network'] = $network->code;
        $product['status'] = 1;
        Internet::create($product);

		}}


        $data['plan']= Internet::whereNetwork($id)->whereStatus(1)->get();
        $data['network']= Network::whereInternet(1)->whereCode($id)->whereStatus(1)->first();
         $data['title']= $data['network']->name. ' Data Bundle';
        $data['bills']= Bill::whereUser_id(Auth::user()->id)->whereStatus(1)->whereType(2)->paginate(6);
        return view('user.bills.select-data', $data);
    }

      public function buydata(Request $request,$id)
    {
        $user = Auth::user();
	    $request->validate([
            'plan' => 'required',
            'number' => 'required',

        ], [
            'number.required' => 'Please enter your mobile phone number',
            'plan.required' => 'Please select an internet plan',
        ]);

        $plan = Internet::whereCode($request->plan)->whereStatus(1)->first();



         if($user->pin != $request->pin){

        return back()->with('alert', 'Transaction Pin Is Incorrect');
         }

        if ($plan->price > $user->balance) {
		   return back()->with("alert", "Insufficient wallet balance. Please deposit more fund and try again");
        }





		$trx = strtoupper(str_random(20));
		$basic = Settings::first();
        if(strtolower($id)=="mtn"){
            $net=01;
        }elseif(strtolower($id)=="glo"){
            $net=02;
        }elseif(strtolower($id)=="9mobile"){
            $net=03;
        }elseif(strtolower($id)=="airtel"){
            $net=04;
        }else{
            $net=0;
        }

        $baseUrl = "https://www.nellobytesystems.com";
        $endpoint = "/APIDatabundleV1.asp?UserID=".$basic->clubid."&APIKey=".$basic->clubkey."&MobileNetwork=".$net."&MobileNumber=".$request->number."&DataPlan=".$request->plan."&RequestID=".$trx."&CallBackURL=http://www.your-website.com";
        $url=$baseUrl.$endpoint;
        $result = file_get_contents($url);
        $rep=json_decode($result, true);
        //return $rep;


         if(!isset($rep['status'])){
         return back()->with('alert', $rep['status'].'API Gateway Error');
        }

        if($rep['status'] != "ORDER_RECEIVED")
        {
        return back()->with('alert', 'We cant service your request at the moment, please try again later');
        }
        if($rep['status'] == "ORDER_RECEIVED")
        {
        $product['user_id'] = Auth::id();
        $product['network'] = $id;
        $product['phone'] = $request->number;
        $product['plan'] = $plan->name;
        $product['type'] = 2;
        $product['remark'] = "Internet data subscription was successful";
        $product['trx'] = $trx;
        $product['status'] = 1;
        $product['amount'] = $plan->price;
        Bill::create($product);


        $user = Auth::user();
        $user->balance = $user->balance - $plan->price;
        $user->save();
        return redirect()->route('user.internet')->with("success", "Internet data subscription was successful");

        }
        else{

         return back()->with('alert', 'Error loading airtime');
        }

    }


      public function cabletv()
    {
        $data['title']='Cable TV Subscription';
        $data['network']= Network::whereTv(1)->whereStatus(1)->get();
        $data['bills']= Bill::whereUser_id(Auth::user()->id)->whereType(3)->whereStatus(1)->paginate(6);
        return view('user.bills.cabletv', $data);
    }

     public function validatecable(Request $request)
    {
         $user = Auth::user();
	     $request->validate([
            'number' => 'required',
            'decoder' => 'required',
//
        ], [
            'decoder.required' => 'Please select a decoder type',
            'number.required' => 'Please enter a decoder number',
        ]);

		$basic = Settings::first();
		$curl = curl_init();

		  curl_setopt_array($curl, array(
		  CURLOPT_URL => "https://www.nellobytesystems.com/APIVerifyCableTVV1.0.asp?UserID=".$basic->clubid."&APIKey=".$basic->clubkey."&cabletv=".$request->decoder."&smartcardno=".$request->number,
		  CURLOPT_RETURNTRANSFER => true,
		  CURLOPT_ENCODING => "",
		  CURLOPT_MAXREDIRS => 10,
		  CURLOPT_TIMEOUT => 0,
		  CURLOPT_FOLLOWLOCATION => true,
		  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		  CURLOPT_CUSTOMREQUEST => "GET",

		));

		$response = curl_exec($curl);

		curl_close($curl);
		$rep=json_decode($response, true);
        //return $response;

			  if(!isset($rep['customer_name'])){
              return back()->with('alert', 'API Gateway Error');
              }



             if ($rep['customer_name'] == "INVALID_SMARTCARDNO"){
		      return back()->with('alert', 'You have entered an invalid decoder/smart card number. Please Try Again');
             }

        	 if ($rep['customer_name']  == ""){
			       return back()->with('alert', 'We are unable to process your request at the moment. Please Try Again');

        	 }


			Session::put('number', $request->number);
			Session::put('decoder', $request->decoder);
			Session::put('name', $rep['customer_name']);
			return redirect()->route('user.validated.cable');


		}


		public function validateddecoder(Request $request)
		{

		$data['page_title'] = "Select Bouquet";
		$data['decoder'] = Session::get('decoder');
		$data['number'] = Session::get('number');
		$data['name'] = Session::get('name');

		 if(strtolower($data['decoder'])=="dstv"){
		 $data['network']= Network::whereTv(1)->whereCode($data['decoder'])->whereStatus(1)->first();
         $data['deco'] = "DStv";
        }
        if(strtolower($data['decoder'])=="gotv")
        {
           $data['deco'] = "GOtv";
           $data['network']= Network::whereTv(1)->whereCode($data['decoder'])->whereStatus(1)->first();
        }
        if(strtolower($data['decoder'])=="startimes"){
            $data['name'] = "Startimes";
            $data['network']= Network::whereTv(1)->whereCode($data['decoder'])->whereStatus(1)->first();
        }

         $data['title'] = $data['decoder']." Subscription";



		$baseUrl = "https://www.nellobytesystems.com";
        $endpoint = "/APICableTVPackagesV2.asp";

        $httpVerb = "GET";
        $contentType = "application/json"; //e.g charset=utf-8
        $headers = array (
            "Content-Type: $contentType",

        );

            $ch = curl_init();
            curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
            curl_setopt($ch, CURLOPT_URL, $baseUrl.$endpoint);
            curl_setopt($ch, CURLOPT_HTTPGET, true);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

            $content = json_decode(curl_exec( $ch ),true);
            $err     = curl_errno( $ch );
            $errmsg  = curl_error( $ch );
        	curl_close($ch);

			$data['plans'] = $content['TV_ID'];
		    return view('user.bills.cabletv-validated', $data);
		}



		 public function buytv(Request $request, $id)
    {
        $user = Auth::user();
        $request->validate([
            'plan' => 'required',
//
        ], [
            'plan.required' => 'Please select a bouquet plan'
        ]);

		$basic = Settings::first();

             if($user->pin != $request->pin){

        return back()->with('alert', 'Transaction Pin Is Incorrect');
         }

        if ($request->amount + 100  > $user->balance) {
            return back()->with('alert', 'Insufficient wallet balance. Please Try Again');
        }



        $curl = curl_init();

		  curl_setopt_array($curl, array(
		  CURLOPT_URL => "https://www.nellobytesystems.com/APICableTVV1.asp?UserID=".$basic->clubid."&APIKey=".$basic->clubkey."&CableTV=".$id."&Package=".$request->plan."&SmartCardNo=".$request->number,
		  CURLOPT_RETURNTRANSFER => true,
		  CURLOPT_ENCODING => "",
		  CURLOPT_MAXREDIRS => 10,
		  CURLOPT_TIMEOUT => 0,
		  CURLOPT_FOLLOWLOCATION => true,
		  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		  CURLOPT_CUSTOMREQUEST => "GET",

		));

		$response = curl_exec($curl);

		curl_close($curl);
		$rep=json_decode($response, true);
        //return $response;

        if(!isset($rep['status'])){
              return back()->with('alert', 'API Gateway Error');
        }


        $statusResult=$rep['status']; // Access Array data
        $total = $request->amount + $basic->decoderfee;

        if ($statusResult == "ORDER_RECEIVED" || $statusResult == "ORDER_COMPLETED") {
            $trx = strtoupper(str_random(20));
            $product['user_id'] = Auth::id();
            $product['network'] = $id;
            $product['phone'] = $request->number;
            $product['plan'] = $request->plan;
            $product['type'] = 3;
            $product['remark'] = "TV Subscription was successful on ".$id." ".$request->plan." bouquet";
            $product['trx'] = $trx;
            $product['status'] = 1;
            $product['amount'] = $request->amount;
            Bill::create($product);

            $user = Auth::user();
            $total = $product['amount'] + $basic->decoderfee;
            $user->balance = $user->balance - $total;
            $user->save();

             return redirect()->route('user.cabletv')->with("success", $product['remark']);
        } else {
         return back()->with('alert', 'We cannot process your selected subscription plan at the moment. Please Try Again');

        }
        }

          public function utilitybill()
    {
        $data['title']='Utility Bill';
        $data['network']= Power::whereStatus(1)->get();
        $data['bills']= Bill::whereUser_id(Auth::user()->id)->whereType(4)->whereStatus(1)->paginate(6);
        return view('user.bills.utilitybill', $data);
    }

      public function validateutilitybill(Request $request)
    {
         $user = Auth::user();
	     $request->validate([
            'meter' => 'required',
            'type' => 'required',
            'number' => 'required',
//
        ], [
            'type.required' => 'Please select a meter type',
            'meter.required' => 'Please select a meter company',
            'number.required' => 'Please enter a meter number',
        ]);



		$basic = Settings::first();
        $curl = curl_init();

		  curl_setopt_array($curl, array(
		  CURLOPT_URL => "https://www.nellobytesystems.com/APIVerifyElectricityV1.asp?UserID=".$basic->clubid."&APIKey=".$basic->clubkey."&ElectricCompany=".$request->meter."&meterno=".$request->number,
		  CURLOPT_RETURNTRANSFER => true,
		  CURLOPT_ENCODING => "",
		  CURLOPT_MAXREDIRS => 10,
		  CURLOPT_TIMEOUT => 0,
		  CURLOPT_FOLLOWLOCATION => true,
		  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		  CURLOPT_CUSTOMREQUEST => "GET",

		));

		$response = curl_exec($curl);

		curl_close($curl);
		$rep=json_decode($response, true);
        //return $rep;

			  if(!isset($rep['customer_name'])){
              return back()->with('alert', 'API Gateway Error');
              }

            if(isset($rep['status'])){
              return back()->with('alert', $rep['status']);
              }



             if ($rep['customer_name'] == "account no not found"){
		      return back()->with('alert', 'meter cant be vereified not found');
             }

        	 if ($rep['customer_name']  == ""){
			       return back()->with('alert', 'We are unable to process your request at the moment. Please Try Again');

        	 }


			Session::put('number', $request->number);
			Session::put('type', $request->type);
			Session::put('amount', $request->amount);
			Session::put('meter', $request->meter);
			Session::put('name', $rep['customer_name']);
			return redirect()->route('user.validated.utility');


		}

		public function validatedutility(Request $request)
		{

		$data['page_title'] = "Preview Payment";
		$data['meter'] = Session::get('meter');
		$data['number'] = Session::get('number');
		$data['amount'] = Session::get('amount');
		$data['type'] = Session::get('type');
		$data['name'] = Session::get('name');
		$data['network'] = Power::whereCode($data['meter'])->first();
		$data['title'] = $data['network']->name." Bill" ;
        return view('user.bills.utility-validated', $data);
		}


		 public function buypower(Request $request,$id)
    {
        $user = Auth::user();
        $input = $request->all();
        $rules = array(
            'amount' => 'required|integer|min:100',
            'number' => 'required',
            'company' => 'required',
            'type' => 'required',
            'name' => 'required',
        );

        $validator = Validator::make($input, $rules);



        $basic = Settings::first();
        $total = 100 + $request->amount;

        if ($total > $user->balance) {
        return back()->with('alert', 'Insufficient wallet balance. Please deposit more fund and try again');

        }

           if($user->pin != $request->pin){

        return back()->with('alert', 'Transaction Pin Is Incorrect');
         }

        $basic = Settings::first();
        $trx = strtoupper(str_random(6));


       $basic = Settings::first();
        $curl = curl_init();

		  curl_setopt_array($curl, array(
		  CURLOPT_URL => "https://www.nellobytesystems.com/APIElectricityV1.asp?UserID=".$basic->clubid."&APIKey=".$basic->clubkey."&ElectricCompany=".$request->company."&MeterNo=".$request->number."&MeterType=".$request->type."&Amount=".$request->amount."&RequestID=".$trx."&CallBackURL=http://www.your-website.com",
		  CURLOPT_RETURNTRANSFER => true,
		  CURLOPT_ENCODING => "",
		  CURLOPT_MAXREDIRS => 10,
		  CURLOPT_TIMEOUT => 0,
		  CURLOPT_FOLLOWLOCATION => true,
		  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		  CURLOPT_CUSTOMREQUEST => "GET",

		));

		$response = curl_exec($curl);

		curl_close($curl);
		$rep=json_decode($response, true);
        //return $rep;


        if(!isset($rep['status'])){
              return back()->with('alert', 'Gateway Errpr');
              }

        if($rep['status'] == "ORDER_RECEIVED"){

            $company = Power::whereCode($request->company)->first();
            $product['user_id'] = Auth::id();
            $product['network'] = $company->name;
            $product['phone'] = $request->number;
            $product['plan'] = $request->plan;
            $product['type'] = 4;
            $product['accountnumber'] = $request->name;
            $product['remark'] = "Utility bill was paid successfully";
            $product['ref'] = $trx; //$result['orderid'];
            $product['pin'] = $rep['metertoken'];
            $product['serial'] = $rep['metertoken'];
            $product['unit'] = 1;
            $product['trx'] = $trx;
            $product['status'] = 1;
            $product['amount'] = $request->amount;
            Bill::create($product);

            $user = Auth::user();
            $total = $product['amount'] + $basic->utility_fee;
            $user->balance = $user->balance - $total;
            $user->save();
              return redirect()->route('user.utilitybill')->with("success", $product['remark']);
        } else {
            return response()->json(['status' => 0, 'message' => 'We cannot process your request at the moment, please try again later']);
        }

    }




}
