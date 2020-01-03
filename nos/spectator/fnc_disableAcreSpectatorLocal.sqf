#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Waits until player has a Teamspeak ID and then stops the ACRE spectator function
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call nos_spectator_fnc_stopAcreSpectatorLocal
 *
 * Public: No
 */
PARAMS_1(_unit);

if !(isPlayer _unit) exitWith {};

systemChat str _unit;

[{
    acre_sys_core_ts3id != -1
}, {
    [false] call acre_api_fnc_setSpectator;
}] call nos_main_waitUntilAndExecute;

