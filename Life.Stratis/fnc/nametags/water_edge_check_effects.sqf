// A_nametags_fnc_water_edge_check_effects

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


private["_z"];
_z = (positionCameraToWorld [0,0,0] select 2);

private["_in_water_edge"];
_in_water_edge = (_z > -0.1 && _z < 0.09);
if (!(A_nametags_var_water_edge_colorized) && _in_water_edge) then {
	1 setFog 1;
	_hndl = ppEffectCreate ["WetDistortion", 300];
	_hndl ppEffectEnable true;
	_hndl ppEffectAdjust [
		0, //blurriness
		1.0, //effect strength top
		1.0, //effect strength bottom
		
		//Wave Speed
		1.0, 
		0.0, 
		0.0, 
		1.0, 
		//Wave Amplitues
		0.03, 
		0.01, 
		0.01,
		0.01,
		//Wave Coeficients
		0.08, 
		0.08, 
 			0.0, 
		1.0 
	];
	if (sunOrMoon > 0)  then {
		_hndl ppEffectCommit 0;
	};
	A_nametags_var_watter_edge_effect = _hndl;
	A_nametags_var_water_edge_colorized = true;
};

if (A_nametags_var_water_edge_colorized && !(_in_water_edge)) then {
	1 setFog 0;
	ppEffectDestroy A_nametags_var_watter_edge_effect;
	A_nametags_var_water_edge_colorized = false;
};
