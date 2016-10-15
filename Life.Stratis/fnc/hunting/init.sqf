// A_hunting_fnc_init

#include "header.h"


if (!isServer) exitwith {};

A_hunting_var_areas = [];
A_hunting_var_spawned_animals = [];

[] call A_hunting_fnc_setup;
[] call A_hunting_fnc_loop;