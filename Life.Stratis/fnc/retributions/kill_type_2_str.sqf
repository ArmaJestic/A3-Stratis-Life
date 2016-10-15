// A_retributions_fnc_kill_type_2_str

#include "header.h"


_type = _this select 0;

if (_type == "vtk" || _type == "ktk") exitWith { "team-killing" };
if (_type == "vdm" || _type == "kdm" ) exitWith { "death-matching" };

"unknown"
