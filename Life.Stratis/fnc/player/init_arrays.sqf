// A_player_fnc_init_arrays

#include "../../includes/macro.h"


while {true} do {
	private["_complete"];
	_complete = ([player] call A_player_fnc_human) || isServer;
	if (_complete) exitWith {null};
};

private["_player"];
_player = player;

playerstringarray = 
[
	"civ1","civ2","civ3","civ4","civ5","civ6","civ7","civ8","civ9","civ10",
	"civ11","civ12","civ13","civ14","civ15","civ16","civ17","civ18","civ19","civ20",
	"civ21","civ22","civ23","civ24","civ25","civ26","civ27","civ28","civ29","civ30",
	"civ31","civ32","civ33","civ34","civ35","civ36","civ37","civ38","civ39","civ40",
	"civ41","civ42","civ43","civ44","civ45","civ46","civ47","civ48","civ49","civ50",
	"civ51","civ52","civ53","civ54","civ55","civ56","civ57","civ58","civ59","civ60",
	"civ61","civ62","civ63","civ64",
	"ins1","ins2","ins3","ins4","ins5","ins6","ins7","ins8","ins9","ins10",
	"opf1","opf2","opf3","opf4","opf5","opf6","opf7","opf8","opf9","opf10",
	"cop1","cop2","cop3","cop4","cop5","cop6","cop7","cop8","cop9","cop10",
	"cop11","cop12","cop13","cop14","cop15","cop16","cop17","cop18","cop19","cop20"
];


role = _player;
rolestring = str(_player);
rolenumber = (playerstringarray find rolestring) + 1;

//player groupChat format["role = %1, rolestring = %2,  rolenumber = %3", role, rolestring, rolenumber];

isciv = [_player] call A_player_fnc_civilian;
isblu = [_player] call A_player_fnc_blufor;
isopf = [_player] call A_player_fnc_opfor;
isind = [_player] call A_player_fnc_independent;

_player addMPEventHandler ["MPKilled", { _this call A_player_fnc_handle_mpkilled }];
_player addMPEventHandler ["MPRespawn", { _this call A_player_fnc_handle_mprespawn }];
