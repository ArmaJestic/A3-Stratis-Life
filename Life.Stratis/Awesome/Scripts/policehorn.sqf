#include "..\..\includes\macro.h"

liafu = true;
_vcl  = vehicle player;
if (undefined(HORN_Playing)) then	{ HORN_Playing = false;	};
_class = typeOf (vehicle (player));
_isbike = (configName(inheritsFrom(inheritsFrom (configFile >> "CfgVehicles" >> _class))) == "Bicycle");
_isdriver = (player == (driver _vcl));

if (HORN_Playing || _isbike || !_isdriver) exitWith {null};
HORN_Playing = true;

format["

_vehicle = %1;
_distance = player distance _vehicle;

if ( _distance <= 60 ) then
{
	[_vehicle, player] say3D ""policehorn"";
};

", _vcl] call broadcast;
sleep 3;
HORN_Playing = false;
