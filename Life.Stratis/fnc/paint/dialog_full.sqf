// A_paint_fnc_dialog_full



private ["_cam", "_IA", "_index", "_item", "_cost", "_lic", "_armorb", "_armors", "_texts", "_class", "_cfg", "_pack", "_DFML", "_n", "_c", "_veh", "_selected_maps"];

disableSerialization;

P_Preview_Logic		= _this select 0;

P_CamOffsetX = 0;
P_CamOffsetY = 0;
P_CamZoomX = 3.5;
P_CamZoomY = 0;
P_CamDir = 1;

P_Preview_Class = typeOf (vehicle player);

P_Preview_Pos = getPosATL P_Preview_Logic;
P_Preview_Dir = getDir P_Preview_Logic;

liafu = true;

P_Preview_Unit = P_Preview_Class createVehicleLocal (P_Preview_Pos);
/*
P_Preview_Unit setVehicleInit format["liafu = true; this setVehicleVarName '%1_CP_Dummy'; %1_CP_Dummy = this; this lock true; this allowDamage false;", player];
processInitCommands;
*/
P_Preview_Unit setDir P_Preview_Dir;
P_Preview_Unit setpos P_Preview_Pos;
P_Preview_Unit allowDamage false;

["light", P_Preview_Unit, 0.01] execvm "effects.sqf";

A_paint_var_t_p = [];
P_T_Change = false;

_veh = vehicle player;

if (!(createDialog "Paint_Dialog")) exitWith {hint "Dialog Error!";};
[] call A_paint_fnc_dialog_setup;

_cam = "Camera" camCreate [0, 0, 0];
_cam cameraEffect ["internal", "front"];

_texts = [];
//_texts		= C_selectedarray select 10;
_t_cfg			= getArray (configFile >> "CfgVehicles" >> P_Preview_Class >> "hiddenselections");
_t_count		= count _t_cfg;
					
if (_t_count > 0) then {	
	_n = 0;
	{
		_texts set [_n, _n];
		_n = _n + 1;
	} foreach _t_cfg;				
};

//_texts = A_paint_var_texts;				
							
{
	_index	= lbAdd [1502, format["%1", (_x)]];
	lbSetData [1502, _index, format["%1", (_x)]];
} foreach _texts;

_selected_maps = "";

while {dialog} do {
	showCinemaBorder false;

	_DFML = findDisplay 3004;

	_cam camSetTarget [(getPosATL P_Preview_Unit select 0) + P_CamOffsetX, (getPosATL P_Preview_Unit select 1) + P_CamOffsetY, 1];
	_cam camSetRelPos [P_CamZoomX, P_CamZoomY, 0];
	_cam camCommit 0;
	
	
	if ((lbCurSel 1502) >= 0) then {
		ctrlEnable [1700, true];
		ctrlEnable [1701, true];
		ctrlEnable [1702, true];
		
		ctrlEnable [1705, true];
		ctrlEnable [1712, true];				
						
		P_T_Slot = lbData [1502, (lbCurSel 1502)];
		P_T_S = lbData [2100, (lbCurSel 2100)];
		P_T_M = lbData [2104, (lbCurSel 2104)];
						
		switch P_T_S do {		
			case "color": {
				(_DFML displayCtrl 1009) ctrlSetText format ['Red'];
				(_DFML displayCtrl 1010) ctrlSetText format ['Green'];
				(_DFML displayCtrl 1011) ctrlSetText format ['Blue'];
				(_DFML displayCtrl 1012) ctrlSetText format ['Alpha'];
				(_DFML displayCtrl 1013) ctrlSetText format ['N/A'];
			
				if ( ((lbCurSel 1502) >= 0) && ((lbCurSel 2100) >= 0) && ((lbCurSel 2101) >= 0) && ((lbCurSel 2102) >= 0) && ((lbCurSel 2103) >= 0) && ((lbCurSel 2104) >= 0) ) then {
					ctrlEnable [1713, true];
				} else {
					ctrlEnable [1713, false];
				};
			};
			
			case "perlinNoise":{
				(_DFML displayCtrl 1009) ctrlSetText format ['Y Scale'];
				(_DFML displayCtrl 1010) ctrlSetText format ['X Scale'];
				(_DFML displayCtrl 1011) ctrlSetText format ['Min'];
				(_DFML displayCtrl 1012) ctrlSetText format ['Max'];
				(_DFML displayCtrl 1013) ctrlSetText format ['N/A'];
			
				if ( ((lbCurSel 1502) >= 0) && ((lbCurSel 2100) >= 0) && ((lbCurSel 2101) >= 0) && ((lbCurSel 2102) >= 0) && ((lbCurSel 2103) >= 0) && ((lbCurSel 2104) >= 0) ) then {
					ctrlEnable [1713, true];
				} else {
					ctrlEnable [1713, false];
				};
			};

			case "irradiance": {
				(_DFML displayCtrl 1009) ctrlSetText format ['Specular'];
				(_DFML displayCtrl 1010) ctrlSetText format ['N/A'];
				(_DFML displayCtrl 1011) ctrlSetText format ['N/A'];
				(_DFML displayCtrl 1012) ctrlSetText format ['N/A'];
				(_DFML displayCtrl 1013) ctrlSetText format ['N/A'];
				
				if ( ((lbCurSel 1502) >= 0) && ((lbCurSel 2100) >= 0) && ((lbCurSel 2101) >= 0) && ((lbCurSel 2102) >= 0) && ((lbCurSel 2103) >= 0) && ((lbCurSel 2104) >= 0) ) then {
					ctrlEnable [1713, true];
				} else {
					ctrlEnable [1713, false];
				};
			};

			case "fresnelGlass":{
				(_DFML displayCtrl 1009) ctrlSetText format ['N/A'];
				(_DFML displayCtrl 1010) ctrlSetText format ['N/A'];
				(_DFML displayCtrl 1011) ctrlSetText format ['N/A'];
				(_DFML displayCtrl 1012) ctrlSetText format ['N/A'];
				(_DFML displayCtrl 1013) ctrlSetText format ['N/A'];
			
				if ( ((lbCurSel 1502) >= 0) && ((lbCurSel 2100) >= 0) && ((lbCurSel 2101) >= 0) && ((lbCurSel 2102) >= 0) && ((lbCurSel 2103) >= 0) && ((lbCurSel 2104) >= 0) ) then {
					ctrlEnable [1713, true];
				} else {
					ctrlEnable [1713, false];
				};
			};

			case "waterIrradiance":{
				(_DFML displayCtrl 1009) ctrlSetText format ['Specular'];
				(_DFML displayCtrl 1010) ctrlSetText format ['N/A'];
				(_DFML displayCtrl 1011) ctrlSetText format ['N/A'];
				(_DFML displayCtrl 1012) ctrlSetText format ['N/A'];
				(_DFML displayCtrl 1013) ctrlSetText format ['N/A'];
			
				if ( ((lbCurSel 1502) >= 0) && ((lbCurSel 2100) >= 0) && ((lbCurSel 2101) >= 0) && ((lbCurSel 2102) >= 0) && ((lbCurSel 2103) >= 0) && ((lbCurSel 2104) >= 0) ) then {
					ctrlEnable [1713, true];
				} else {
					ctrlEnable [1713, false];
				};
			};

			case "treeCrown":{
				(_DFML displayCtrl 1009) ctrlSetText format ['Density'];
				(_DFML displayCtrl 1010) ctrlSetText format ['N/A'];
				(_DFML displayCtrl 1011) ctrlSetText format ['N/A'];
				(_DFML displayCtrl 1012) ctrlSetText format ['N/A'];
				(_DFML displayCtrl 1013) ctrlSetText format ['N/A'];
			
				if ( ((lbCurSel 1502) >= 0) && ((lbCurSel 2100) >= 0) && ((lbCurSel 2101) >= 0) && ((lbCurSel 2102) >= 0) && ((lbCurSel 2103) >= 0) && ((lbCurSel 2104) >= 0) ) then {
					ctrlEnable [1713, true];
				} else {
					ctrlEnable [1713, false];
				};
			};

			case "custom":{
				(_DFML displayCtrl 1009) ctrlSetText format ['N/A'];
				(_DFML displayCtrl 1010) ctrlSetText format ['N/A'];
				(_DFML displayCtrl 1011) ctrlSetText format ['N/A'];
				(_DFML displayCtrl 1012) ctrlSetText format ['N/A'];
				(_DFML displayCtrl 1013) ctrlSetText format ['N/A'];
			
				if ( ((lbCurSel 2105) >= 0) ) then {
					ctrlEnable [1713, true];
				} else {
					ctrlEnable [1713, false];
				};
			};
		};

		if (_selected_maps != P_T_M) then {
			switch P_T_M do {
				case "1": {
					A_paint_var_t_height = [];
					_selected_maps = "1";
					_n = 0;
					for [{_c = 1}, {_c <= 128}, {_c=_c * 2}] do {
						A_paint_var_t_height set [_n, _c];
						_n = _n + 1;
					};
				};
				case "2":{
					A_paint_var_t_height = [];
					_selected_maps = "2";
					_n = 0;
					for [{_c = 2}, {_c <= 128}, {_c=_c * 2}] do{
						A_paint_var_t_height set [_n, _c];
						_n = _n + 1;
					};
				};
				case "3":{
					A_paint_var_t_height = [];
					_selected_maps = "3";
					_n = 0;
					for [{_c = 4}, {_c <= 128}, {_c=_c * 2}] do{
						A_paint_var_t_height set [_n, _c];
						_n = _n + 1;
					};
				};
				case "4":{
					A_paint_var_t_height = [];
					_selected_maps = "4";
					_n = 0;
					for [{_c = 8}, {_c <= 128}, {_c=_c * 2}] do{
						A_paint_var_t_height set [_n, _c];
						_n = _n + 1;
					};
				};
				case "5":{
					A_paint_var_t_height = [];
					_selected_maps = "5";
					_n = 0;
					for [{_c = 16}, {_c <= 128}, {_c=_c * 2}] do{
						A_paint_var_t_height set [_n, _c];
						_n = _n + 1;
					};
				};
				case "6":{
					A_paint_var_t_height = [];
					_selected_maps = "6";
					_n = 0;
					for [{_c = 32}, {_c <= 128}, {_c=_c * 2}] do{
						A_paint_var_t_height set [_n, _c];
						_n = _n + 1;
					};
				};
				case "7": {	
					A_paint_var_t_height = [];
					_selected_maps = "7";
					_n = 0;
					for [{_c = 64}, {_c <= 128}, {_c=_c * 2}] do{
						A_paint_var_t_height set [_n, _c];
						_n = _n + 1;
					};
				};
				case "8": {
					A_paint_var_t_height = [];
					_selected_maps = "8";
					_n = 0;
					for [{_c = 128}, {_c <= 128}, {_c=_c * 2}] do{
						A_paint_var_t_height set [_n, _c];
						_n = _n + 1;
					};
				};		
			};
				
			lbClear 2103;
			
			{
				_index	= lbAdd [2103, format["%1", (_x)]];
				lbSetData [2103, _index, format["%1", (_x)]];
			} foreach A_paint_var_t_height;
				
			lbSetCurSel [2103, 0];
		};

		/*		
		if ( ((lbCurSel 1502) >= 0) && ((lbCurSel 2100) >= 0) && ((lbCurSel 2101) >= 0) && ((lbCurSel 2102) >= 0) && ((lbCurSel 2103) >= 0) && ((lbCurSel 2104) >= 0) ) then {
				ctrlEnable [1705, true];
				ctrlEnable [1712, true];
				ctrlEnable [1713, true];
			} else {
				ctrlEnable [1705, false];
				ctrlEnable [1712, false];
				ctrlEnable [1713, false];
			};
		*/			
	} else {
		ctrlEnable [1700, false];
		ctrlEnable [1701, false];
		ctrlEnable [1702, false];

		ctrlEnable [1705, false];
		ctrlEnable [1712, false];
		ctrlEnable [1713, false];
	};

	
	if (P_choice == "storage") then {
		ctrlEnable [1701, false];
	};
	
	if (P_choice == "store") then {
		ctrlEnable [1701, true];
	};
	
	if (vehicle player == player) then {closeDialog 0; player groupchat "P ERROR: Player exited vehicle"};
	if (vehicle player != _veh) then {closeDialog 0; player groupchat "P ERROR: Player Changed Vehicles"};
	
	sleep 0.01;
};

_cam cameraEffect ["terminate", "front"];
camDestroy _cam;
deleteVehicle P_Preview_Unit;
