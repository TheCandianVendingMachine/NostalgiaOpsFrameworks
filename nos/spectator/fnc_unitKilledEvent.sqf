#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Initialize player to spectator on their death
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Killer <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorTarget player] call nos_spectator_fnc_unitKilledEvent
 *
 * Public: No
 */
PARAMS_2(_unit,_killer);
if !(isPlayer _unit) exitWith {};
[{
    alive player
}, {
    [player] call FUNC(startSpectator);
    player setPos [0, 0, 0];
}] call nos_main_fnc_waitUntilAndExecute;


