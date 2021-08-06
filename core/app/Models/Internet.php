<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Internet extends Model {
    protected $table = "internets";
    protected $guarded = [];
    public function network()
    {
        return $this->hasMany('App\Model\Network', 'name');
    }
}
