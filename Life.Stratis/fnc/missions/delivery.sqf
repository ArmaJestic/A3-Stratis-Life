// A_missions_fnc_delivery

#include "..\..\includes\macro.h"


_art = ((_this select 3) select 0);
if (_art == "getajob_delivery") then {
	if (alreadygotaworkplacejob == 2) exitWith {
		player groupChat localize "STRS_workplacemission_searchalready";
	};

	if (alreadygotaworkplacejob == 1) exitWith {
		player groupChat format [localize "STRS_workplacemission_already", workplacejob_deliveryname];
	};

	if(canceltime) exitwith {
		player groupchat "You cannot start another A_missions_fnc_delivery mission so soon after failing one!";
	};

	canceltime=false;
	alreadygotaworkplacejob = 1;
	_whereto = floor(random (count A_missions_var_workplacejob_deliveryflagarray));
	_msg = (A_missions_var_workplacejob_deliverymsg select (round(random((count A_missions_var_workplacejob_deliverymsg)-1))));
	
	workplacejob_deliveryflag = A_missions_var_workplacejob_deliveryflagarray select (_whereto);
	workplacejob_deliveryname = A_missions_var_workplacejob_deliverynamearray select (_whereto);
	
	while { workplacejob_deliveryflag distance player < 1500 } do { 
		_whereto = floor(random (count A_missions_var_workplacejob_deliveryflagarray));
		workplacejob_deliveryflag = A_missions_var_workplacejob_deliveryflagarray select (_whereto);
		workplacejob_deliveryname = A_missions_var_workplacejob_deliverynamearray select (_whereto);
	};
	
	player groupChat format[localize _msg, workplacejob_deliveryname];
	workplacemissioninfos = ["A_missions_fnc_delivery Mission", format["%1", (_whereto+1)]];
	timetaken = 0;
	_a1 = 0;
	_pos = getpos player;
	vcl = objnull;
	workplacejob_deliverymoney = round(workplacejob_deliveryflag distance _pos)*A_missions_var_deliveryjobmulti;
	if(workplacejob_deliverymoney > A_missions_var_workplacejob_courier_maxmoney) then {
		workplacejob_deliverymoney = A_missions_var_workplacejob_courier_maxmoney
	};
	
	maxtime	= workplacejob_deliverymoney/50;
	
	if(maxtime < A_missions_var_deliverymintime) then {
		maxtime = A_missions_var_deliverymintime
	};

	while {true} do {
		if (player distance workplacejob_deliveryflag <= 5 and vehicle player == player) exitwith {
			player removeaction deliveryinfoaction;
			vcl removeaction deliveryinfoaction;
			player groupChat format[localize "STRS_workplacemission_delivery_finish", strM(workplacejob_deliverymoney)];
			hint format["Destination: %1\nTime taken: %2 seconds.\nPay: $%3\nDistance remaining: %4m", workplacejob_deliveryname, timetaken, round workplacejob_deliverymoney, (round(workplacejob_deliveryflag Distance player))];
			[player, 'money', round workplacejob_deliverymoney] call A_inventory_fnc_add_item;
			alreadygotaworkplacejob = 0;
			workplacemissioninfos = ["", ""];
		};

		if (vehicle player != player and _a1 == 1) then {
			vcl = vehicle player;
			player removeaction deliveryinfoaction;
			deliveryinfoaction = vcl addAction ["A_missions_fnc_delivery mission info", A_actions_fnc_noscript, 'hint format["Destination: %1\nTime remaining: %2 seconds.\nPay: $%3\nDistance remaining: %4m", workplacejob_deliveryname, round(maxtime - timetaken), round workplacejob_deliverymoney, (round(workplacejob_deliveryflag Distance player))]',1,false,true,"",""];

			_a1 = 0;
		};

		if (vehicle player == player and _a1 == 0) then {
			vcl removeaction deliveryinfoaction;
			deliveryinfoaction = player addAction ["A_missions_fnc_delivery mission info", A_actions_fnc_noscript, 'hint format["Destination: %1\nTime remaining: %2 seconds.\nPay: $%3\nDistance remaining: %4m", workplacejob_deliveryname, round(maxtime - timetaken), round workplacejob_deliverymoney, (round(workplacejob_deliveryflag Distance player))]',1,false,true,"",""];

			_a1 = 1;
		};

		timetaken = timetaken + 1;

		if(timetaken > maxtime)exitwith{_art = "cancel"};
		if(alreadygotaworkplacejob == 0)exitWith {null};

		sleep 1;
	};
};

if (_art == "cancel") then {
	player removeAction deliveryinfoaction;
	player removeAction deliverycancelaction;
	vcl removeaction deliveryinfoaction;
	player groupchat "A_missions_fnc_delivery mission failed!";
	alreadygotaworkplacejob = 0;
	workplacemissioninfos = ["", ""];

	canceltime=true;
	sleep 60;
	canceltime=false;
};
