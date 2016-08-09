// A_home_fnc_init2


if (isServer) then {
	//static definition of the location of the homes, and the location of the walls for each home
	homes_list = 
	[
		[ "Home1",       
		  [ 5565.1235, 9332.3623, 2.99821],
		  "", "",
		  false,        
		  objNull,
		  -1, -1, -1,
		  A_home_var_initial_buying_price, A_home_var_initial_selling_price,
		  [[ "Concrete_Wall_EP1", [3.5, 4.2, 0], 0],
		   [ "Concrete_Wall_EP1", [-3.5, 2.65, 0], 0],
		   [ "Concrete_Wall_EP1", [-4.5, -4.35, 0], 0]]
		],
		[ "Home2",       
		  [5524.93, 9350.08,3.06506],
		  "", "",
		  false,        
		  objNull,
		  -1, -1, -1,
		  A_home_var_initial_buying_price, A_home_var_initial_selling_price,
		  [[ "Concrete_Wall_EP1", [1.4, 1.2, 0], 0],
		   [ "Concrete_Wall_EP1", [2.0, -3.5, 0], 0]]
		],
		[ "Home3",       
		  [5532.32,9327.52,0.955223],
		  "", "",
		  false,        
		  objNull,
		  -1, -1, -1,
		  A_home_var_initial_buying_price, A_home_var_initial_selling_price,
		  [
		   [ "Concrete_Wall_EP1", [-2.90, 8.2, 0], 0],
		   [ "Concrete_Wall_EP1", [3.1, 4.4, 0], 90],
		   [ "Concrete_Wall_EP1", [-9.55, 4.2, 0], 0],
		   [ "Concrete_Wall_EP1", [-2.35, 5.2, 0], 0]]
		],
		[ "Home4",       
		  [5561.06,9354.53,0.834846],
		  "",
		  "",
		  false,        
		  objNull,
		  -1, -1, -1,
		  A_home_var_initial_buying_price, A_home_var_initial_selling_price,
		  [
		   [ "Concrete_Wall_EP1", [-3,-3.8, 0], 90],
		   [ "Concrete_Wall_EP1", [1.3,-7.9, 0], 90],
		   [ "Concrete_Wall_EP1", [4,3.1, 0], 0],
		   [ "Concrete_Wall_EP1", [-7.2,-0.5, 0], 0]
		  ]
		]
	];
};

"A_home_var_msg" addPublicVariableEventHandler {
	//this is the main server/client model implementation for the home system
	//throughout the whole mission, the server keeps the state of all homes, with the metadata
	//like who is the owner, and if it's locked or not.
	//
	//when a player connects to the server, it sends a message ("request_homes") to server asking for list of homes
	//and server then replies back sending "update_home" messages to that client.
	//
	
	private["_homes_msg", "_msg_to, "_msg_from", "_msg_type", "_msg_data", "_myself", "_home", "_home_name", "_c_home"];
	_homes_msg = _this select 1;
	_msg_to = _homes_msg select A_home_var_msg_to;
	_msg_from = _homes_msg select A_home_var_msg_from;
	_msg_type = _homes_msg select A_home_var_msg_type;
	_msg_data = _homes_msg select A_home_var_msg_data;

	if (isServer) then {
		_myself = "server";

		if (_msg_to in [_myself, "all"]) then {
			//server globalChat format["RECV: %1", _homes_msg];
			//hint format["%1", _homes_msg];
			if (_msg_type == "request_homes") then {
				{
					_home = _x;
					_home_name = _home select A_home_var_name;
					_c_home = server getVariable _home_name;

					A_home_var_msg = [_myself, _msg_from, "update_home", _c_home];
					//server globalChat format["SEND: %1", A_home_var_msg];
					publicVariable "A_home_var_msg";
				} forEach homes_list;           
			}else{ 
				if (_msg_type == "update_home") then {
					_home = _msg_data;
					_home_name = _home select A_home_var_name;
					_c_home = server getVariable _home_name;
					_c_home set [A_home_var_owner_uid, _home select A_home_var_owner_uid];
					_c_home set [A_home_var_owner_name, _home select A_home_var_owner_name];
					_c_home set [A_home_var_locked, _home select A_home_var_locked];

					server setVariable [_home_name, _c_home];    

					if (!isDedicated) then {
						server setVariable [_home_name, [_c_home] call A_home_fnc_updateactions];
					};
				};
			};
		};
	}else {
		_myself = name player;
		if (_msg_to == _myself or _msg_to == "all")  then {
			//server globalChat format["RECV: %1", _homes_msg];
			//hint format["%1", _homes_msg];
			if (_msg_type == "update_home") then {
				_home = _msg_data;
				_home_name = _home select A_home_var_name;

				_c_home = server getVariable [_home_name, []];

				if (count _c_home == 0) then {
					_home set [A_home_var_ownership_action, -1];
					_home set [A_home_var_locking_action, -1];
					_home set [A_home_var_object, objNull];
					[_home] call A_home_fnc_setobject;

					server setVariable [_home_name, [_home] call A_home_fnc_updateactions];
				}else {
					_c_home set [A_home_var_owner_uid, _home select A_home_var_owner_uid];
					_c_home set [A_home_var_owner_name, _home select A_home_var_owner_name];
					_c_home set [A_home_var_locked, _home select A_home_var_locked];

					server setVariable [_home_name, [_c_home] call A_home_fnc_updateactions];
				};
			};
		};
	};
};

[] call A_home_fnc_main;