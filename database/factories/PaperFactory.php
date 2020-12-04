<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Paper;
use Faker\Generator as Faker;

$factory->define(Paper::class, function (Faker $faker) {
    return [
        'title' => $faker->sentence,
        'description' => $faker->sentence
    ];
});
