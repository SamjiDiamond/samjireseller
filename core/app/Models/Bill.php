<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Bill extends Model {
    protected $table = "bills";
    protected $guarded = [];
    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }

}
