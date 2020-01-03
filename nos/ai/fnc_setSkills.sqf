#include "script_component.sqf"
/*
 * Author: Brandon (TCVM)
 * Sets AI unit skills according to a global value
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call nos_ai_fnc_setSkills
 *
 * Public: No
 */
PARAMS_1(_unit);

if !(local _unit) exitWith {};

{
    private ["_skill", "_inputMin", "_inputMax"];
    _skill = _x select 0;
    _inputMin = _x select 1;
    _inputMax = _x select 2;
    
    _unit setSkill [_skill, [_inputMin, _inputMax] call EFUNC(main,getBoundedRandom)];
} forEach SUB_SKILLS;

