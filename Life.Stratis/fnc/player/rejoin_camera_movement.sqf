// A_player_fnc_rejoin_camera_movement

#include "..\..\includes\macro.h"


player_rejoin_camera_complete = false;


private["_deadcam_target_array"];
_deadcam_target_array =
[
	[17205.75,99198.17,-49454.65],
	[114238.47,12719.49,3040.26],
	[114238.47,12719.49,3040.28],
	[9396.48,-87407.76,-3495.99],
	[9396.48,-87407.76,-3495.72],
	[-85499.48,17145.94,-3497.86],
	[-81437.91,41177.12,-3500.26],
	[-68592.92,68496.92,-3504.91],
	[63894.18,99059.27,-3504.91],
	[57781.25,102312.13,-3505.24],
	[18155.12,112290.52,-3505.59],
	[114056.91,13559.94,-3506.64],
	[114056.91,13559.94,-3506.63],
	[12082.11,112377.59,-3507.94],
	[12082.11,112377.59,-3508.13],
	[12082.11,112377.59,-3507.88],
	[71475.13,94441.38,-3511.65],
	[79131.48,88521.11,-3512.17],
	[90116.62,77668.10,-3514.78],
	[93979.69,72896.55,-3515.45],
	[23989.44,112118.31,-3515.51],
	[111421.41,-10631.93,-3515.78],
	[111421.41,-10631.93,-3515.45],
	[111421.41,-10631.93,-3515.62],
	[-85207.23,22475.24,-3515.77],
	[-85269.09,22481.34,761.18],
	[-52542.68,-60176.11,-15820.92],
	[66335.50,-71098.57,-15831.98],
	[112733.68,9274.25,-15848.19],
	[112733.68,9274.25,-15848.03],
	[112733.68,9274.25,-15848.01],
	[112733.68,9274.25,-15848.28],
	[15793.38,-87445.16,-1975.57],
	[15793.38,-87445.16,-1975.58],
	[-85045.43,23679.19,-1976.55],
	[-2976.49,110953.34,-1977.04],
	[-2976.49,110953.34,-1976.94],
	[25975.48,-86795.57,-1977.29],
	[25975.48,-86795.57,-1977.28],
	[30152.87,-86219.98,-1977.49],
	[114191.58,8919.13,-1977.75],
	[114186.95,8335.76,-1978.02],
	[13212.45,-87514.59,-1978.28],
	[13212.45,-87514.59,-1978.39],
	[13328.19,-76559.05,-45508.50]
];

private["_deadcam_position_array", "_x_adjust", "_y_adjust", "_deadcamlogic_pos"];
_deadcamlogic_pos = getPos deadcamlogic;

//re-adjust the position to be anchored more or less around the deadcamlogic marker
_x_adjust = (_deadcamlogic_pos select 0) - 6575.55;
_y_adjust = (_deadcamlogic_pos select 1) - 2451.36;
_z_adjust = 10;
	
_deadcam_position_array   =
[
	[6573.78,2365.67,19.16],
	[6563.33,2409.16,3.60],
	[6598.98,2409.17,3.60],
	[6615.21,2406.75,2.60],
	[6616.97,2469.89,3.60],
	[6619.17,2455.47,4.36],
	[6650.88,2457.08,5.60],
	[6719.63,2400.90,6.92],
	[6712.46,2403.60,7.08],
	[6712.08,2419.00,8.08],
	[6727.18,2457.75,20.08],
	[6724.96,2465.48,15.08],
	[6764.31,2465.91,7.08],
	[6771.92,2463.60,20.08],
	[6771.38,2538.25,21.08],
	[6771.13,2550.88,22.08],
	[6769.29,2568.52,23.08],
	[6793.91,2598.42,24.08],
	[6825.21,2646.20,25.08],
	[6839.44,2658.20,25.08],
	[6869.00,2658.38,25.08],
	[6909.94,2668.50,25.35],
	[6942.29,2667.94,25.33],		
	[6846.04,2627.05,20.37],
	[6827.04,2538.54,18.41],
	[6742.96,2468.32,18.69],
	[6769.18,2697.18,15.22],
	[6792.32,2615.79,10.43],
	[6679.88,2556.44,6.43],
	[6560.67,2516.16,6.43],
	[6588.56,2525.49,6.43],
	[6551.50,2521.79,6.43],
	[6606.49,2523.45,1.69],
	[6606.37,2476.85,1.69],
	[6602.42,2474.65,1.69],
	[6578.19,2474.97,1.69],
	[6574.55,2488.17,1.69],
	[6574.79,2497.03,1.69],
	[6573.99,2491.74,5.46],
	[6574.33,2490.64,4.93],
	[6574.66,2458.02,4.93],
	[6597.66,2457.95,4.93],
	[6599.95,2459.04,5.23],
	[6599.66,2459.05,18.31],
	[6575.55,2451.36,19.46]
];


private["_deadcam_kameraposition", "_position"];

_deadcam_kameraposition = round(random (count _deadcam_position_array - 1));
_position = (_deadcam_position_array select _deadcam_kameraposition);
_position = [((_position select 0) + _x_adjust), ((_position select 1) + _y_adjust), ((_position select 2) + _z_adjust)];

//INITIATE THE CAMERA
private["_camera"];
_camera = "camera" camCreate _position;
_camera cameraEffect ["Internal", "LEFT"];
_camera camPreparePos [0,0,0];

_camera camSetPos _position;
_camera camSetTarget (_deadcam_target_array select _deadcam_kameraposition);
_camera camSetFOV 0.700;
if (not(sunOrMoon > 0)) then {
	camUseNVG true;
};
_camera camCommit 1;
waitUntil {camCommitted _camera};


//CYCLE THE CAMERA POSITIONS
while {true} do {
	_deadcam_kameraposition = _deadcam_kameraposition + 1;
	if (count _deadcam_position_array <= _deadcam_kameraposition) then {
		_deadcam_kameraposition = 0;
	};
	
	private["_position", "_target"];

	_position = _deadcam_position_array select _deadcam_kameraposition;
	_target = _deadcam_target_array   select _deadcam_kameraposition;
	
	_position = [((_position select 0) + _x_adjust), ((_position select 1) + _y_adjust), ((_position select 2) + _z_adjust)];
	

	_camera camSetPos _position;
	_camera camSetTarget _target;
	_camera camSetFOV 0.7;
	_camera camCommit 5;
	
	waitUntil {(camCommitted _camera) || (playerRespawnTime <= 0)};
	if (playerRespawnTime <= 0) exitWith {};

};

//DESTROY THE CAMERA
_camera cameraEffect ["terminate","back"];
//titleCut [" ","Black in"];
camDestroy _camera;
camUseNVG false;
//titlefadeout 0;
//0 cutfadeout 0;
"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [6];
"dynamicBlur" ppEffectCommit 0;
"dynamicBlur" ppEffectAdjust [0];
"dynamicBlur" ppEffectCommit 5;

setPlayerRespawnTime 30;
player_rejoin_camera_complete = true;
