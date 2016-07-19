// A_underwater_base_fnc_underwater_setup_lights

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


private["_light"];
_light = "#lightpoint" createVehicleLocal [0,0,0];
_light setLightBrightness 3.0;
_light setLightAmbient[0.404,0.902,0.925];
_light setLightColor[0.404,0.902,0.925];
_light lightAttachObject [opfsubshopspawn_floating, [0,0,5]];

private["_light"];
_light = "#lightpoint" createVehicleLocal [0,0,0];
_light setLightBrightness 5.0;
_light setLightAmbient[0.404,0.902,0.925];
_light setLightColor[0.404,0.902,0.925];
_light lightAttachObject [opfsubshopspawn_submerged, [0,0,5]];
