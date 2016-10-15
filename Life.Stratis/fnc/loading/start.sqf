// A_loading_fnc_start

#include "header.h"


if (isServer) exitwith {};
if (A_loading_var_active) exitwith {};

params[["_title","",[""]],["_progress",0,[0]]];

A_loading_var_active = true;
startLoadingScreen[_title, "customLoadingScreen"];
[_progress] call A_loading_fnc_update_progress;