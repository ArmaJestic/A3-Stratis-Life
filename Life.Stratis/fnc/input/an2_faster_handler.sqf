// A_input_fnc_an2_faster_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


private["_vcl", "_lvl", "_vel", "_spd"];
_vcl = vehicle player;

if (not(_vcl iskindof "An2_Base_EP1")) exitWith { false }; 

_vel = velocity _vcl;
_spd = speed _vcl;
_vcl setVelocity [(_vel select 0) * 1.001, (_vel select 1) * 1.001, (_vel select 2) * 0.99];
		
false
