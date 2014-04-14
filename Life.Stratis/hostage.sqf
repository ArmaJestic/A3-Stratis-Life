#include "Awesome\Functions\macro.h"


hostage_init_handler_persistent = {
	ARGV(0,_unit);
	ARGV(1,_unit_name);
	
	if (undefined(_unit)) exitWith {};
	if (undefined(_unit_name)) exitWith {};
	if (typeName _unit != "OBJECT") exitWith {};
	if (isNull _unit ) exitWith {};
	if (typeName _unit_name != "STRING") exitWith {};
	
	_unit setVehicleVarName _unit_name;
	missionNamespace setVariable [_unit_name, _unit];
};

// new version of assassin mission with vip and guards armed, car,  new spawn locations, bug fixes and more stability by Scripter Wulfer
_secondcounter = 0;
_minutecounter = 0;
_art = (_this select 3) select 0;

if (undefined(workplacejob_hostage_serverarray)) then {workplacejob_hostage_serverarray = []};

if (_art == "serverloop") then {

	while {true} do {
		for [{_i=0}, {_i < (count workplacejob_hostage_serverarray)}, {_i=_i+1}] do {
			if (isNull ((workplacejob_hostage_serverarray select _i) select 0)) then {

				if (!(isNull ((workplacejob_hostage_serverarray select _i) select 1))) then {
					deleteVehicle ((workplacejob_hostage_serverarray select _i) select 1);
					deletemarker "htargetmarker";
				};

				workplacejob_hostage_serverarray set [_i,""];
				workplacejob_hostage_serverarray = workplacejob_hostage_serverarray - [""];
				//"if(iscop)then{player sidechat ""The threat to the hostage has been removed""}" call broadcast;
				sleep ((workplacejob_hostage_break)*60);
				workplacejob_hostage_active = false;
				publicvariable "workplacejob_hostage_active";

			};
		};
		sleep 10;
	};
};

if (_art == "getajob_hostage") then {
	if(workplacejob_hostage_active)exitWith{player groupChat "There are currently no more hostages.";};
	if(workplacejob_hostage_failed)exitWith{player groupChat "You have failed a hostage mission recently, maybe you can do it again later.";};

	_array  = [[Hostagespawn1, 10], [Hostagespawn2, 10], [Hostagespawn3, 10], [Hostagespawn4, 10], [Hostagespawn5, 10]];
	_city   = (floor(random(count _array)));
	_pos    = (_array select _city) select 0;
	_radius = (_array select _city) select 1;
	_a1	= 0;

	//delete any left overs from last time this ran
	deletemarker "htargetmarker";
	deletevehicle hostage1;


	//creating VIP
	liafu = true;
	_group = createGroup east;
	
	private["_hostage_unit"];
	_hostage_unit = _group createUnit ["Functionary1_EP1", _pos, [], _radius, "FORM"];
	
	private["_hostage_name"];
	_hostage_name = "hostage1";
	
	//[[_hostage_unit, _hostage_name], "hostage_init_handler_persistent", true, true] spawn BIS_fnc_MP;
	[[_hostage_unit, _hostage_name], "hostage_init_handler_persistent", true, true, _hostage_unit] spawn jip_register;
	waitUntil {not(isNil _hostage_name)};

	format["workplacejob_hostage_serverarray = workplacejob_hostage_serverarray + [[%1, hostage1]];", player] call broadcast;

	_markerobj = createMarker ["htargetmarker",[0,0]];
	_markername= "htargetmarker";
	_markerobj setMarkerShape "ICON";
	"htargetmarker" setMarkerType "Marker";
	"htargetmarker" setMarkerColor "ColorRed";
	"htargetmarker" setMarkerText "Hostage target";
	_markername SetMarkerPos _start;

	workplacejob_hostage_active = true; publicvariable "workplacejob_hostage_active";

	player groupChat "The Hostage is marked on the map, don't let the police get you.";

	"if (iscop) then {player sideChat ""Someone is trying to take a hostage. The hostage has been marked on the map. Arrest the hostage taker before its too late!""};" call broadcast;

	player groupchat "The police are on to you, hurry up!";
	[player, "Assassin", 200000] call player_update_warrants;


	while {true} do {
		"htargetmarker" setmarkerpos getpos hostage1;

		if (_minutecounter >= 750 and alive player) exitWith {
			[player, 300000] call bank_transaction;
			player groupchat "Well done, you kept the hostage for 15 minutes, $300000 has been transfered to your account.";
			sleep 10;
			"server globalchat ""Hostage Taker WINS, he kept the hostage for 15 minutes."";" call broadcast;
			sleep 1;
			deletevehicle hostage1;
			deletemarker "htargetmarker";
			_minutecounter = 0;
		};

		if (!alive hostage1 and alive player) exitWith {
			player groupchat "Hostage has been killed, No one WINS!!";
			sleep 5;
			"server globalchat ""The Hostage has been Killed, No one WINS!"";" call broadcast;
			deletevehicle hostage1;
			deletemarker "htargetmarker";
		};

		if(hostage1 distance getmarkerpos "hostagezone" > 150) exitwith {
			"
			server globalchat ""The Hostage taker has fled the area! Cops get $5000"";
			_copplayernumber = playersNumber west;
			_copbonus = 5000;
			if (iscop) then {[player, _copbonus] call bank_transaction; player sidechat format[""you received $%1 for hostage taker fleeing the area"", _copbonus];};
			" call broadcast;
			sleep 2;
			player groupchat "You fled the area with the hostage, stay in the zone next time, mission failed!";
			workplacejob_hostage_failed = true;
			deletevehicle hostage1;
			deletemarker "htargetmarker";
		};


		if(player distance hostage1 > 150) exitWith {
			"
			server globalchat ""The Hostage taker has lost!"";
			_copplayernumber = playersNumber west;
			_copbonus = 5000;
			if (iscop) then {[player, _copbonus] call bank_transaction; player sidechat format[""you received $%1 for the successful rescue of the hostage"", _copbonus];};
			" call broadcast;
			sleep 2;
			player groupchat "The Hostage was rescued, mission failed!";
			workplacejob_hostage_failed = true;
			deletevehicle hostage1;
			deletemarker "htargetmarker";
		};

		_minutecounter = _minutecounter + 1;
		_secondcounter = _secondcounter + 1;
		sleep 1;
	};

//	deleteGroup _group;
	deletevehicle hostage1;
	deletemarker "htargetmarker";

	sleep ((workplacejob_hostage_break)*60);
	workplacejob_hostage_active = false;
	publicvariable "workplacejob_hostage_active";

	if (workplacejob_hostage_failed) then {
		sleep ((workplacejob_hostage_break)*60);
		workplacejob_hostage_failed = false;
	};
};

// written by Wulfer, template by Eddie Vedder