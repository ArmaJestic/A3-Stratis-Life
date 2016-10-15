// A_bombs_fnc_client

#include "..\..\includes\macro.h"
#define REMOVE_BOMB() A_bombs_var_localbombarray set[_forEachIndex,null]; _update = true;


private _update = false;
//for [{_i=0}, {_i < (count A_bombs_var_localbombarray)}, {_i=_i+1}] do {
{
	private _array = _x;
	_array params["_id","_vehicle","_item","_actionArr"];
	
	if ((isNull _vehicle) || {!alive _vehicle}) then {
		REMOVE_BOMB()
	}else{
		if ((vehicle player == _vehicle) && {(count _actionArr) == 0}) then {
			_v = vehicle player;
			switch _item do {
				case "fernzuenderbombe": {
					_actionArr pushBack (_v addAction [localize "STRS_inv_item_vehiclebomb_action_deactivate",  A_actions_fnc_noscript, format["[""config"", ""defuse"", ""%1"", ""%2""] spawn A_bombs_fnc_bombs;", _item, _id ]]);
				};
				case "zeitzuenderbombe": { 
					_actionArr pushBack (_v addAction [localize "STRS_inv_item_vehiclebomb_action_deactivate", A_actions_fnc_noscript,  format["[""config"", ""defuse"", ""%1"", ""%2""] spawn A_bombs_fnc_bombs;", _item, _id ]]);
					_actionArr pushBack (_v addAction [localize "STRS_inv_item_vehiclebomb_action_changetimer", A_actions_fnc_noscript, format["[""config"", ""Timer"",  ""%1"", ""%2""] spawn A_bombs_fnc_bombs;", _item, _id ]]);
				};
				case "aktivierungsbombe": { 
					_actionArr pushBack (_v addAction [localize "STRS_inv_item_vehiclebomb_action_deactivate", A_actions_fnc_noscript, format["[""config"", ""defuse"", ""%1"", ""%2""] spawn A_bombs_fnc_bombs;", _item, _id ]]);
				};
				case "geschwindigkeitsbombe":  {
					_actionArr pushBack (_v addAction [localize "STRS_inv_item_vehiclebomb_action_deactivate", A_actions_fnc_noscript, format["[""config"", ""defuse"", ""%1"", ""%2""] spawn A_bombs_fnc_bombs;", _item, _id ]]);
				};
			};
			_x set [3, _actionArr];
		}else{
			if (vehicle player != _vehicle) then {
				{
					_vehicle removeAction _j;
				} forEach _actionArr;
				_actionArr = [];
				_x set [3, _actionArr];
			};
		};
	};
} forEach A_bombs_var_localbombarray;

if (_update) then {
	A_bombs_var_localbombarray = A_bombs_var_localbombarray - [null];
};