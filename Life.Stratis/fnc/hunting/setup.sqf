// A_hunting_fnc_setup

#include "header.h"


//Create turtle hunting Area
private _turtle_area = [];
_turtle_area set [INDEX_AREA_NAME, "Hunting Area - Tutles"];
_turtle_area set [INDEX_AREA_MARKER, turtlelogic];

//Setup the turtle area
private _land_turtle_data = [];
_land_turtle_data set[INDEX_ANIMAL_NAME, "Land Turtle"];
_land_turtle_data set[INDEX_ANIMAL_CLASS, "Turtle_F"];
_land_turtle_data set[INDEX_ANIMAL_ITEM, "Turtle_F"];
_land_turtle_data set[INDEX_ANIMAL_MIN_COUNT, 15];
_land_turtle_data set[INDEX_ANIMAL_MAX_COUNT, 30];
_land_turtle_data set[INDEX_ANIMAL_SPAWN_RADIUS, 30];
_land_turtle_data set[INDEX_ANIMAL_DESPAWN_RADIUS, 100];
_land_turtle_data set[INDEX_ANIMAL_SPAWN_RATE, 60];

private _turtle_area_animal_data = [];
_turtle_area_animal_data pushBack _land_turtle_data;

_turtle_area set[INDEX_AREA_ANIMALS, _turtle_area_animal_data];

A_hunting_var_areas pushBack _turtle_area;



//Create goat hunting Area
private _goat_area = [];
_goat_area set [INDEX_AREA_NAME, "Hunting Area - Goat"];
_goat_area set [INDEX_AREA_MARKER, goatarealogic];

//Setup the goat area
private _goat_data = [];
_goat_data set [INDEX_ANIMAL_NAME, "Random Goat"];
_goat_data set [INDEX_ANIMAL_CLASS, "Goat_random_F"];
_goat_data set [INDEX_ANIMAL_ITEM, "Goat_random_F"];
_goat_data set [INDEX_ANIMAL_MIN_COUNT, 15];
_goat_data set [INDEX_ANIMAL_MAX_COUNT, 30];
_goat_data set [INDEX_ANIMAL_SPAWN_RADIUS, 30];
_goat_data set [INDEX_ANIMAL_DESPAWN_RADIUS, 100];
_goat_data set [INDEX_ANIMAL_SPAWN_RATE, 60];

private _goat_area_animal_data = [];
_goat_area_animal_data pushBack _goat_data;

_goat_area set [INDEX_AREA_ANIMALS, _goat_area_animal_data];

A_hunting_var_areas pushBack _goat_area;



//Create sheep hunting area
private _sheep_area = [];
_sheep_area set [INDEX_AREA_NAME, "Hunting Area - Sheep"];
_sheep_area set [INDEX_AREA_MARKER, sheeplogic];

//Setup the sheep area
private _sheep_data = [];
_sheep_data set [INDEX_ANIMAL_NAME, "Random Sheep"];
_sheep_data set [INDEX_ANIMAL_CLASS, "Sheep_random_F"];
_sheep_data set [INDEX_ANIMAL_ITEM, "Sheep_random_F"];
_sheep_data set [INDEX_ANIMAL_MIN_COUNT, 15];
_sheep_data set [INDEX_ANIMAL_MAX_COUNT, 30];
_sheep_data set [INDEX_ANIMAL_SPAWN_RADIUS, 30];
_sheep_data set [INDEX_ANIMAL_DESPAWN_RADIUS, 100];
_sheep_data set [INDEX_ANIMAL_SPAWN_RATE, 60];

private _sheep_area_animal_data = [];
_sheep_area_animal_data pushBack _sheep_data;

_sheep_area set [INDEX_AREA_ANIMALS, _sheep_area_animal_data];

A_hunting_var_areas pushBack _sheep_area;



//Create chicken hunting area
private _chicken_area = [];
_chicken_area set [INDEX_AREA_NAME, "Hunting Area - Chicken"];
_chicken_area set [INDEX_AREA_MARKER, chickenlogic];

//Setup the chicken area
_chicken_data = [];
_chicken_data set [INDEX_ANIMAL_NAME, "Random Chicken"];
_chicken_data set [INDEX_ANIMAL_CLASS, "Hen_random_F"];
_chicken_data set [INDEX_ANIMAL_ITEM, "Hen_random_F"];
_chicken_data set [INDEX_ANIMAL_MIN_COUNT, 15];
_chicken_data set [INDEX_ANIMAL_MAX_COUNT, 30];
_chicken_data set [INDEX_ANIMAL_SPAWN_RADIUS, 30];
_chicken_data set [INDEX_ANIMAL_DESPAWN_RADIUS, 100];
_chicken_data set [INDEX_ANIMAL_SPAWN_RATE, 60];

private _chicken_area_animal_data = [];
_chicken_area_animal_data pushBack _chicken_data;

_chicken_area set [INDEX_AREA_ANIMALS, _chicken_area_animal_data];

A_hunting_var_areas pushBack _chicken_area;



//Create catshark hunting area
private _catshark_area = [];
_catshark_area set [INDEX_AREA_NAME, "Hunting Area - Catshark"];
_catshark_area set [INDEX_AREA_MARKER, catsharklogic];

//Setup the catshark area
_catshark_data = [];
_catshark_data set [INDEX_ANIMAL_NAME, "Catshark"];
_catshark_data set [INDEX_ANIMAL_CLASS, "CatShark_F"];
_catshark_data set [INDEX_ANIMAL_ITEM, "CatShark_F"];
_catshark_data set [INDEX_ANIMAL_MIN_COUNT, 15];
_catshark_data set [INDEX_ANIMAL_MAX_COUNT, 30];
_catshark_data set [INDEX_ANIMAL_SPAWN_RADIUS, 30];
_catshark_data set [INDEX_ANIMAL_DESPAWN_RADIUS, 100];
_catshark_data set [INDEX_ANIMAL_SPAWN_RATE, 60];

private _catshark_area_animal_data = [];
_catshark_area_animal_data pushBack _catshark_data;

_catshark_area set [INDEX_AREA_ANIMALS, _catshark_area_animal_data];

A_hunting_var_areas pushBack _catshark_area;



//Create tuna hunting area
private _tuna_area = [];
_tuna_area set [INDEX_AREA_NAME, "Hunting Area - Tuna"];
_tuna_area set [INDEX_AREA_MARKER, tunalogic];

//Setup the tuna area
_tuna_data = [];
_tuna_data set [INDEX_ANIMAL_NAME, "Tuna"];
_tuna_data set [INDEX_ANIMAL_CLASS, "Tuna_F"];
_tuna_data set [INDEX_ANIMAL_ITEM, "Tuna_F"];
_tuna_data set [INDEX_ANIMAL_MIN_COUNT, 15];
_tuna_data set [INDEX_ANIMAL_MAX_COUNT, 30];
_tuna_data set [INDEX_ANIMAL_SPAWN_RADIUS, 30];
_tuna_data set [INDEX_ANIMAL_DESPAWN_RADIUS, 100];
_tuna_data set [INDEX_ANIMAL_SPAWN_RATE, 60];

private _tuna_area_animal_data = [];
_tuna_area_animal_data pushBack _tuna_data;

_tuna_area set [INDEX_AREA_ANIMALS, _tuna_area_animal_data];

A_hunting_var_areas pushBack _tuna_area;