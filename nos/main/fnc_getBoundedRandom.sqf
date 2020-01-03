#include "script_component.hpp"
/*
 * Author: AACO
 * Function used to get a random value between an ordered min/max set
 *
 * Arguments:
 * 0: The ensured minimum number (inclusive) <NUMBER>
 * 1: The ensured maximum number (exclusive) <NUMBER>
 * 2: True if the random number should be rounded <BOOL>
 *
 * Return Value:
 * Random number between the min (inclusive) and the max (exclusive): <NUMBER>
 *
 * Examples:
 * [0, 1] call nos_main_fnc_getBoundedRandom; // random number between 0 and 1
 * [2, 5] call nos_main_fnc_getBoundedRandom; // random number between 2 and 5
 *
 * Public: Yes
 */
TRACE_1("params",_this);
PARAMS_2(_min,_max);
DEFAULT_PARAM(2,_round,false);

private "_random";
_random = if (_round) then {
    round (random (_max - _min))
} else {
    random (_max - _min)
};

_min + _random 