// A_bases_fnc_underwater_setup_lights

#include "header.h"


params[["_prefix","",[""]]];
private _object = missionNamespace getVariable[format['opfsubshopspawn_floating%1',_prefix],objNull];
private _light = "#lightpoint" createVehicleLocal[0,0,0];

_light setLightBrightness 3.0;
_light setLightAmbient[0.404,0.902,0.925];
_light setLightColor[0.404,0.902,0.925];
_light lightAttachObject[_object,[0,0,5]];