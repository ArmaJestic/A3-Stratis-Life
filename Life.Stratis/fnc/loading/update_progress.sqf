// A_loading_fnc_update_progress
// sets progress bar on loading screen

#include "header.h"


params [["_progress",0,[0]]];

if ((_progress < 0) || {_progress > 1}) exitWith {};

A_loading_var_progress = _progress;
progressLoadingScreen _progress;