// A_plant_fnc_seed_handler_persistent

#include "header.h"


params["_death_time","_position_asl","_seed_id"];

private _seed_data = [_seed_id] call A_plant_fnc_seed_lookup_id;
if UNDEFINED(_seed_data) exitWith {};

private _model = _seed_data select INDEX_MODEL;
private _scale = _seed_data select INDEX_SCALE;

private _time = serverTime;
if (_time > _death_time) exitWith {};

private _life_remaining = _death_time - _time;

private _anchor = "Land_Can_V3_F" createVehicleLocal [0,0,0];
_anchor hideObject true;
_anchor setPosASL _position_asl;

private _particle = "#particlesource" createVehicleLocal _position_asl;
_particle setParticleParams [_model, "", "SpaceObject", 0, _life_remaining, [0,0,-0.5], [0, 0, 0], 0,1.275,1,0, _scale, [[0, 1, 0 ,1], [0, 1, 0 ,1], [0, 1, 0 ,1]], [0,0], 0, 0, "", "", _anchor];
_particle setDropInterval _life_remaining;
sleep 1;
deleteVehicle _anchor;
deleteVehicle _particle;