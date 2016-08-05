// A_loading_fnc_update_title
// updates loading title
// meant to be called through A_loading_fnc_update

#include "..\..\includes\macro.h"


PARAM_EXIT(A_loading_fnc_update_title, [["_title", null, [""], 1]])
UNDEF_EXIT(A_loading_fnc_update_title, _title)

format["A_loading_fnc_update_title: %1", _title] call A_err_fnc_logd;

startLoadingScreen[_title , "customLoadingScreen"];
[A_loading_var_progress] call A_loading_fnc_update_progress;