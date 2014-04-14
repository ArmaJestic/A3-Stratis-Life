#include "Awesome\Functions\macro.h"

liafu = true;


generic_picture_path = {
	ARGV(0,_id);
	([_id, "picture"] call generic_config_text)
};

generic_display_name = {
	ARGV(0,_id);
	([_id, "displayName"] call generic_config_text)
};

generic_icon_path = {
	ARGV(0,_id);
	([_id, "icon"] call generic_config_text)
};

generic_config_text = {
	ARGV(0,_id);
	ARGV(1,_field);
	if (undefined(_id)) exitWith {""};
	if (typeName "_id" != "STRING") exitWith {""};
	if (_id == "") exitWith {""};
	
	if (isClass(configFile >> "CfgWeapons" >> _id)) exitWith {
		(getText(configFile >> "CfgWeapons" >> _id >> _field))
	};
	
	if (isClass(configFile >> "CfgVehicles" >> _id)) exitWith {
		(getText(configFile >> "CfgVehicles" >> _id >> _field))
	};
	
	if (isClass(configFile >> "CfgMagazines" >> _id)) exitWith {
		(getText(configFile >> "CfgMagazines" >> _id >> _field))
	};
	
	if (isClass(configFile >> "CfgAmmos" >> _id)) exitWith {
		(getText(configFile >> "CfgAmmos" >> _id >> _field))
	};
	
	if (isClass(configFile >> "CfgGlasses" >> _id)) exitWith {
		(getText(configFile >> "CfgGlasses" >> _id >> _field))
	};
	
	""
};

setPitchBank = {
	private ["_obj","_pitch","_bank","_yaw","_vdir","_vup","_s ign","_rotate"];

	_obj = _this select 0;
	_pitch = _this select 1;
	_bank = _this select 2;

	if (undefined(_bank)) exitWith {null};
	if (undefined(_pitch)) exitWith {null};
	if (undefined(_obj)) exitWith {null};
	
	_yaw = 360-(getdir _obj);

	//----------------------------
	//function to rotate a 2d vector around the origin
	//----------------------------

	_rotate =
	{
		private ["_v","_d","_x","_y"];
		_v = +(_this select 0); //we don't want to modify the originally passed vector
		_d = _this select 1;
		if (undefined(_d)) then {
			_d = 0;
		};
		
		_x = _v select 0;
		_y = _v select 1;
		_v set [0, (cos _d)*_x - (sin _d)*_y];
		_v set [1, (sin _d)*_x + (cos _d)*_y];
		_v
	};

	//----------------------------
	//find vector dir (pitch)
	//----------------------------

	_sign = [1,-1] select (_pitch < 0);

	while {abs _pitch > 180} do {_pitch = _sign*(abs _pitch - 180)};

	if(abs _pitch == 90) then {_pitch = _sign*(89.9)};

	if(abs _pitch > 90) then {
		_obj setdir (getdir _obj)-180;
		_yaw = 360-(getdir _obj);
		_bank = _bank + 180;
		_pitch = (180 - abs _pitch)*_sign;
	};

	_vdir = [0, cos _pitch, sin _pitch];

	_vdir = [_vdir, _yaw] call _rotate;

	//----------------------------
	//find vector up (bank)
	//----------------------------

	_sign = [1,-1] select (_bank < 0);

	while {abs _bank > 360} do {_bank = _sign*(abs _bank - 360)};

	if(abs _bank > 180) then {_sign = -1*_sign; _bank = (360-_bank)*_sign};

	_vup = [sin _bank, 0, cos _bank];
	_vup = [_vup select 0] + ([[_vup select 1, _vup select 2], _pitch] call _rotate);
	_vup = [_vup, _yaw] call _rotate;

	//----------------------------
	//apply the vectors
	//----------------------------

	_obj setVectorDirAndUp [_vdir, _vup];
};

bash = {
	private["_damage"];
	_damage = damage player;
	[player, 10, 0] call setPitchBank;
	sleep 0.01;
	[player, -5, 0] call setPitchBank;

	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [10];
	"dynamicBlur" ppEffectCommit 0;
	waitUntil {ppEffectCommitted "dynamicBlur"};
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [0];
	"dynamicBlur" ppEffectCommit (0.4 + _damage);
	waitUntil {ppEffectCommitted "dynamicBlur"};
};

parse_number = {
	private ["_number"];
	_number = _this select 0;
	if (undefined(_number)) exitWith {0};
	if (typeName _number == "SCALAR") exitWith {_number};
	if (typeName _number != "STRING") exitWith {0};
	_number = parseNumber(_number);
	if (undefined(_number)) exitWith {0};
	if (typeName _number != "SCALAR") exitWith {0};
	_number
};

DialogCivilianPlayersList = {
	private["_control_id"];
	_control_id = _this select 0;
	([_control_id, true, false, false, false] call DialogPlayerList)
};

DialogAllPlayersList = {
	private["_control_id"];
	_control_id = _this select 0;
	([_control_id, true, true, true, true] call DialogPlayerList)
};

DialogNotCopsList = {
	private["_control_id"];
	_control_id = _this select 0;
	([_control_id, true, false, true, true] call DialogPlayerList)
};

DialogPlayerList = {
	private ["_control_id", "_show_civ", "_show_cop", "_show_ins", "_show_opf"];
	
	_control_id = _this select 0;
	_show_civ = _this select 1;
	_show_cop = _this select 2;
	_show_ins = _this select 3;
	_show_opf = _this select 4;
	
	if (undefined(_control_id)) exitWith {null};
	if (typeName _control_id != "SCALAR") exitWith {null};
	
	private["_index", "_my_index"];
	_index = 0;
	_my_index = -1;
  
	private["_c"];
	_c = 0;
	while { _c <  (count playerstringarray) } do {
		private["_player_variable_name", "_player_variable"];
		
		_player_variable_name = playerstringarray select _c;
		_player_variable = missionNamespace getVariable [_player_variable_name, null];
		
		if (true) then {
			if (not([_player_variable] call player_exists)) exitWith {null};
			private["_is_civ", "_is_cop", "_is_ins", "_is_opf"];
			_is_civ = [_player_variable] call player_civilian;
			_is_cop = [_player_variable] call player_cop;
			_is_ins = [_player_variable] call player_insurgent;
			_is_opf = [_player_variable] call player_opfor;
			
			if (_is_civ && not(_show_civ)) exitWith {null};
			if (_is_cop && not(_show_cop)) exitWith {null};
			if (_is_ins && not(_show_ins)) exitWith {null};
			if (_is_opf && not(_show_opf)) exitWith {null};
			
			private["_player_name"];
			_player_name = (name _player_variable);
			_index = lbAdd [_control_id, format ["%1 - (%2)", _player_variable_name, _player_name]];
			lbSetData [_control_id, _index, str(_player_variable)];
			
			if (_player_variable == player) then {
				_my_index = _index;
			};
		};
		_c = _c + 1;
	};
	
	 _my_index
};

Isse_AddCrimeLogEntry = {
	private ["_logtime", "_logdate", "_logtext", "_logart", "_logplayer", "_zusatzinfo"];

	_logart = _this select 0;
	_logplayer = format["%1", _this select 1];
	_zusatzinfo = "";
  
	if (count _this > 2) then {
		_zusatzinfo = _this select 2
	};

	_logtime = time;
	_logdate = date;
	_logtext = "";
		
	switch (_logart) do {
		case "Bank": {
			_logtext = format[localize "STRS_functions_crimelog_msg1", _zusatzinfo];
		};
		case "Stole": {
			_logtext = format[localize "STRS_functions_crimelog_msg2"];
		};
		case "KilledCiv": {
			_logtext = format[localize "STRS_functions_crimelog_msg3", _zusatzinfo];
		};
		case "KilledCop": {
			_logtext = format[localize "STRS_functions_crimelog_msg4", _zusatzinfo];
		};
		case "KilledWorker": {
			_logtext = format[localize "STRS_functions_crimelog_msg13", _zusatzinfo];
		};
		case "PrisonIn": {
			_logtext = format[localize "STRS_functions_crimelog_msg5"];
		};
		case "PrisonOut": {
			_logtext = format[localize "STRS_functions_crimelog_msg6"];
		};
		case "PrisonEsc": {
			_logtext = format[localize "STRS_functions_crimelog_msg7"];
		};
		case "Died": {
			_logtext = format[localize "STRS_functions_crimelog_msg8"];
		};
		case "Ticket": {
			_logtext = format[localize "STRS_functions_crimelog_msg9", _zusatzinfo];
		};
		case "Bomb": {
			_logtext = format[localize "STRS_functions_crimelog_msg10"];
		};
		case "slave": {
			_logtext = format[localize "STRS_functions_crimelog_msg11"];
		};
		case "Speed": {
			_logtext = format[localize "STRS_functions_crimelog_msg12"];
		};
		case "StoleVcl": {
			_logtext = format[localize "STRS_functions_crimelog_msg13", _zusatzinfo];
		};
		case "AttemptedStoleVcl": {
			_logtext = format[localize "STRS_functions_crimelog_msg14", _zusatzinfo];
		};
		case "Assassin": {
			_logtext = format[localize "STRS_functions_crimelog_msg15"];
		};
		case "Ill_PMC": {
			_logtext = format["Illegal PMC"];
		};
	};
	CopLog = CopLog + [ [_logplayer, _logtext, _logdate, _logtime] ];
};

Bomb_Vehicle = {
	if (count _this > 1) then {
		if (not(isNull (_this select 1))) then {
			_obj = _this select 1;
			if (((getPosATL _obj) select 2) > 5) then {
				liafu = true;
				_obj setDamage 1;
			} 
			else {
				createVehicle ["Bo_GBU12_LGB", (_this select 0), [], 0, "NONE"];
				_obj setDamage 1;
			};
		};
    }
	else {
		createVehicle ["Bo_GBU12_LGB", (_this select 0), [], 0, "NONE"];
	};

	if (count _this > 2) then {
		format ["
		if ((random 100) < 10) then {
			hint format[localize ""STRS_vehiclebomb_public_explode"", %1];
			[""Bomb"", %1] spawn Isse_AddCrimeLogEntry;
		};
		", player] call broadcast;
	};
};



SayDirectSpeach = {
	private ["_text", "_dis"];
	_text = _this select 0;
    _art = _this select 1;
    if (not ((_text == "") or (_text == " ")) ) then {
		_text = format["%1-%2 shouts: %3", player, name player, _text];
		if (_art == "direct") then {
			_dis = 50;
			format ["
			if ((player distance %1) < %3) then {
				titleText[""%2"", ""PLAIN""];
			};
			", player, _text, _dis] call broadcast;
		};

		if (_art == "side") then {
			format ["%1 sideChat ""%2"";", player, _text] call broadcast;
		};

		if (_art == "global") then {
			format ["%1 globalChat ""%2"";", player, _text] call broadcast;
		};
	};
};

{ _x setVariable ["BIS_noCoreConversations", true] } forEach allUnits;

buildings_list = {
	if (not(undefined(all_buildings))) exitWith {all_buildings};
	
	private["_pos"];
	_pos = getPos player;
	all_buildings = [(_pos select 0), (_pos select 1)] nearObjects ["Building",1000000];
	all_buildings
};

buildings_protect = {
	{
		_x allowDamage false;
	} foreach (call buildings_list);
};

format_integer = {
	private["_value", "_nan", "_separator"];
	_nan = "NotANumber"; 
	_value = _this select 0;
	_separator = _this select 1;
	
	if (undefined(_value)) exitWith {_nan};
	if (typeName _value != "SCALAR") exitWith {_nan};
	
	if (_value == 0) exitWith {"0"};
	
	private["_string_value", "_digits", "_remainder", "_sign"];
	_string_value = "";
	_digits = 0;
	_sign = if (_value < 0) then {"-"} else {""};
	_value = abs(round(_value));
	while { _value >= 1 } do {
		_digits = _digits + 1;
		if ( _digits > 1 && ((_digits - 1) % 3) == 0) then {
			_string_value = _separator + _string_value;
		};
		_remainder = _value % 10;
		_string_value = str(_remainder) + _string_value;
		_value = floor(_value / 10);
	};
	
	_sign+_string_value
};

strlen = {
	private["_text"];
	_text = _this select 0;
	if (undefined(_text)) exitWith {0};
	if (typeName _text != "STRING") exitWith {null};
	(count (toArray _text))
};

strstr = {
	private["_needle", "_haystack"];
	_needle = _this select 0;
	_haystack = _this select 1;
	
	if (undefined(_needle)) exitWith {false};
	if (undefined(_haystack)) exitWith {false};
	if (typeName _needle != "STRING") exitWith {false};
	if (typeName _haystack != "STRING") exitWith {false};
	
	_needle_array = toArray _needle;
	_haystack_array = toArray _haystack;
	
	private["_i", "_j", "_k", "_matches", "_chr1", "_chr2"];
	_i = 0;
	_matches = false;
	
	while { not(_matches) && _i < (count _haystack_array) } do {
		private["_haystack_char"];
		_k = _i;
		_j = 0;
		while { _j < (count _needle_array)  && _k < (count _haystack_array)} do {
			_chr1 = _needle_array select _j;
			_chr2 = _haystack_array select _k;
			if ( _chr1 != _chr2) exitWith {null};
			_j = _j + 1;
			_k = _k + 1;
		};
		_matches = (_chr1 == _chr2);	
		_i = _i + 1;
	};
	
	_matches 
};


substr = {
	private["_string", "_start", "_length"];
	_string = _this select 0;
	_start = _this select 1;
	_length = _this select 2;
	
	if (undefined(_string)) exitWith {""};
	if (undefined(_start)) exitWith {""};
	
	if (typeName _string != "STRING") exitWith {""};
	if (typeName _start != "SCALAR") exitWith {""};
	
	
	private["_string_data", "_string_out_data"];
	_string_data = toArray _string;
	_string_out_data = [];
	
	if (undefined(_length)) then {
		_length = count(_string_data) - _start;
	};
	
	private["_i", "_count"];
	_i = _start;
	_count = 0;
	while {(_i < (count _string_data)) && (_count < _length)} do {
		_string_out_data set [_count, (_string_data select _i)];
		_count = _count + 1;
		_i = _i + 1;
	};
	
	(toString _string_out_data)
};

toLowerArray = {
	private["_array"];
	_array = _this select 0;
	if (undefined(_array)) exitWith {[]};
	if (typeName _array != "ARRAY") exitWith {[]};
	
	private["_i"];
	_i = 0;
	while {_i < count(_array)} do {
		_array set [_i, toLower(_array select _i)];
		_i = _i + 1;
	};
	
	(_array)
};


call buildings_protect;