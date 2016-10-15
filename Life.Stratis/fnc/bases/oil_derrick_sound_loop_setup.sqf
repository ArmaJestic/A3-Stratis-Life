// A_bases_fnc_oil_derrick_sound_loop_setup

#include "header.h"


params[["_obj",objNull,[objNull]]];
if (isNull _obj) exitwith {};

//[{playSound3D[A_bases_var_oil_derrick_sound,_this,false,(getPosASL _this),1,1,100];},20,_obj] call A_frame_fnc_perFrame;
[20,_obj,{!(isNull _this)},{playSound3D[A_bases_var_oil_derrick_sound,_this,false,(getPosASL _this),1,1,100];},{}] call A_frame_fnc_while;