#include "macro.h"
if (not(undefined(quicksort_functions_defined))) exitWith {null};

sort_key = 0;
sort_data = 1;

qsort_swap = {
	ARGV(0,_array);
	ARGV(1,_left);
	ARGV(2,_right);
	
	private["_temp"];
	_temp = _array select _left;
	_array set [_left, (_array select _right)];
	_array set [_right, _temp];
};

qsort_partition = {
   ARGV(0,_array);
   ARGV(1,_left);
   ARGV(2,_right);
   ARGV(3,_pivot);
   
   private["_pivot_value"];
   _pivot_value = (_array select _pivot) select sort_key;
   
	[_array, _pivot, _right] call qsort_swap;
	
	private["_i", "_store_index"];
	_store_index = _left;
	_i = _left;
	while { _i <= (_right - 1) } do {
		if (((_array select _i) select sort_key) < _pivot_value) then {
			[_array, _i, _store_index] call qsort_swap;
			_store_index = _store_index + 1;
		};
		_i = _i + 1;
	};
	
	[_array, _store_index, _right] call qsort_swap;
	_store_index
};

qsort = {
	ARGV(0,_array);
	ARGV(1,_left);
	ARGV(2,_right);
	
	if (not(_left < _right)) exitWith { _array };
	  		
	private["_pivot"];			
	_pivot = floor((_left + _right)/2);
	_pivot = ([_array, _left, _right, _pivot] call qsort_partition);
 
	[_array, _left, (_pivot - 1)] call qsort;
	[_array, (_pivot + 1), _right] call qsort;
};

quicksort = {
	[_this, 0, ((count _this) - 1)] call qsort;
};

quicksort_functions_defined = true;