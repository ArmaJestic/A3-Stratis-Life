// A_loading_fnc_update_title
// updates loading title
// meant to be called through A_loading_fnc_update

#include "header.h"


params [["_title","",[""]]];

startLoadingScreen[_title, "customLoadingScreen"];
[A_loading_var_progress] call A_loading_fnc_update_progress;