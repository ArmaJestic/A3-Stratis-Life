// A_hunting_fnc_setup

#include "..\..\includes\macro.h"


if (!(isServer)) exitWith {null};
//Create turtle hunting Area
private["_turtle_area"];
_turtle_area = [];
_turtle_area set [A_hunting_var_area_name, "Hunting Area - Tutles"];
_turtle_area set [A_hunting_var_area_marker, turtlelogic];

private["_turtle_area_animal_data", "_land_turtle_data"];
_turtle_area_animal_data = [];

//Setup the turtle area
_land_turtle_data = [];
_land_turtle_data set [A_hunting_var_area_animal_name, "Land Turtle"];
_land_turtle_data set [A_hunting_var_area_animal_class, "Turtle_F"];
_land_turtle_data set [A_hunting_var_area_animal_item, "Turtle_F"];
_land_turtle_data set [A_hunting_var_area_animal_min_count, 15];
_land_turtle_data set [A_hunting_var_area_animal_max_count, 30];
_land_turtle_data set [A_hunting_var_area_animal_spawn_radius, 30];
_land_turtle_data set [A_hunting_var_area_animal_despawn_radius, 100];
_land_turtle_data set [A_hunting_var_area_animal_spawn_rate, 60];
_turtle_area_animal_data set [count(_turtle_area_animal_data), _land_turtle_data];

_turtle_area set [A_hunting_var_area_animals, _turtle_area_animal_data];



//Create goat hunting Area
private["_goat_area"];
_goat_area = [];
_goat_area set [A_hunting_var_area_name, "Hunting Area - Goat"];
_goat_area set [A_hunting_var_area_marker, goatarealogic];

private["_goat_area_animal_data", "_goat_data"];
_goat_area_animal_data = [];

//Setup the goat area
_goat_data = [];
_goat_data set [A_hunting_var_area_animal_name, "Random Goat"];
_goat_data set [A_hunting_var_area_animal_class, "Goat_random_F"];
_goat_data set [A_hunting_var_area_animal_item, "Goat_random_F"];
_goat_data set [A_hunting_var_area_animal_min_count, 15];
_goat_data set [A_hunting_var_area_animal_max_count, 30];
_goat_data set [A_hunting_var_area_animal_spawn_radius, 30];
_goat_data set [A_hunting_var_area_animal_despawn_radius, 100];
_goat_data set [A_hunting_var_area_animal_spawn_rate, 60];
_goat_area_animal_data set [count(_goat_area_animal_data), _goat_data];

_goat_area set [A_hunting_var_area_animals, _goat_area_animal_data];


//Create sheep hunting area
private["_sheep_area"];
_sheep_area = [];
_sheep_area set [A_hunting_var_area_name, "Hunting Area - Sheep"];
_sheep_area set [A_hunting_var_area_marker, sheeplogic];

private["_sheep_area_animal_data", "_sheep_data"];
_sheep_area_animal_data = [];

//Setup the sheep area
_sheep_data = [];
_sheep_data set [A_hunting_var_area_animal_name, "Random Sheep"];
_sheep_data set [A_hunting_var_area_animal_class, "Sheep_random_F"];
_sheep_data set [A_hunting_var_area_animal_item, "Sheep_random_F"];
_sheep_data set [A_hunting_var_area_animal_min_count, 15];
_sheep_data set [A_hunting_var_area_animal_max_count, 30];
_sheep_data set [A_hunting_var_area_animal_spawn_radius, 30];
_sheep_data set [A_hunting_var_area_animal_despawn_radius, 100];
_sheep_data set [A_hunting_var_area_animal_spawn_rate, 60];
_sheep_area_animal_data set [count(_sheep_area_animal_data), _sheep_data];

_sheep_area set [A_hunting_var_area_animals, _sheep_area_animal_data];








//Create chicken hunting area
private["_chicken_area"];
_chicken_area = [];
_chicken_area set [A_hunting_var_area_name, "Hunting Area - Chicken"];
_chicken_area set [A_hunting_var_area_marker, chickenlogic];

private["_chicken_area_animal_data", "_chicken_data"];
_chicken_area_animal_data = [];

//Setup the chicken area
_chicken_data = [];
_chicken_data set [A_hunting_var_area_animal_name, "Random Chicken"];
_chicken_data set [A_hunting_var_area_animal_class, "Hen_random_F"];
_chicken_data set [A_hunting_var_area_animal_item, "Hen_random_F"];
_chicken_data set [A_hunting_var_area_animal_min_count, 15];
_chicken_data set [A_hunting_var_area_animal_max_count, 30];
_chicken_data set [A_hunting_var_area_animal_spawn_radius, 30];
_chicken_data set [A_hunting_var_area_animal_despawn_radius, 100];
_chicken_data set [A_hunting_var_area_animal_spawn_rate, 60];
_chicken_area_animal_data set [count(_chicken_area_animal_data), _chicken_data];

_chicken_area set [A_hunting_var_area_animals, _chicken_area_animal_data];





//Create catshark hunting area
private["_catshark_area"];
_catshark_area = [];
_catshark_area set [A_hunting_var_area_name, "Hunting Area - Catshark"];
_catshark_area set [A_hunting_var_area_marker, catsharklogic];

private["_catshark_area_animal_data", "_catshark_data"];
_catshark_area_animal_data = [];

//Setup the catshark area
_catshark_data = [];
_catshark_data set [A_hunting_var_area_animal_name, "Catshark"];
_catshark_data set [A_hunting_var_area_animal_class, "CatShark_F"];
_catshark_data set [A_hunting_var_area_animal_item, "CatShark_F"];
_catshark_data set [A_hunting_var_area_animal_min_count, 15];
_catshark_data set [A_hunting_var_area_animal_max_count, 30];
_catshark_data set [A_hunting_var_area_animal_spawn_radius, 30];
_catshark_data set [A_hunting_var_area_animal_despawn_radius, 100];
_catshark_data set [A_hunting_var_area_animal_spawn_rate, 60];
_catshark_area_animal_data set [count(_catshark_area_animal_data), _catshark_data];

_catshark_area set [A_hunting_var_area_animals, _catshark_area_animal_data];



//Create tuna hunting area
private["_tuna_area"];
_tuna_area = [];
_tuna_area set [A_hunting_var_area_name, "Hunting Area - Tuna"];
_tuna_area set [A_hunting_var_area_marker, tunalogic];

private["_tuna_area_animal_data", "_tuna_data"];
_tuna_area_animal_data = [];

//Setup the tuna area
_tuna_data = [];
_tuna_data set [A_hunting_var_area_animal_name, "Tuna"];
_tuna_data set [A_hunting_var_area_animal_class, "Tuna_F"];
_tuna_data set [A_hunting_var_area_animal_item, "Tuna_F"];
_tuna_data set [A_hunting_var_area_animal_min_count, 15];
_tuna_data set [A_hunting_var_area_animal_max_count, 30];
_tuna_data set [A_hunting_var_area_animal_spawn_radius, 30];
_tuna_data set [A_hunting_var_area_animal_despawn_radius, 100];
_tuna_data set [A_hunting_var_area_animal_spawn_rate, 60];
_tuna_area_animal_data set [count(_tuna_area_animal_data), _tuna_data];

_tuna_area set [A_hunting_var_area_animals, _tuna_area_animal_data];




hunting_areas = [];
hunting_areas set [count(hunting_areas), _turtle_area];
hunting_areas set [count(hunting_areas), _goat_area];
hunting_areas set [count(hunting_areas), _sheep_area];
hunting_areas set [count(hunting_areas), _chicken_area];
hunting_areas set [count(hunting_areas), _catshark_area];
hunting_areas set [count(hunting_areas), _tuna_area];
