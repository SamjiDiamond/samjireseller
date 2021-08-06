<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Power extends Model {
    protected $table = "powers";
    protected $guarded = [];

    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }

}
