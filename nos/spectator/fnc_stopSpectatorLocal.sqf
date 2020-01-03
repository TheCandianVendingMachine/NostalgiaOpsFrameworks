#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Stops spectator for the local client. Only called by events
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call nos_spectator_fnc_stopSpectatorLocal
 *
 * Public: No
 */

player allowDamage true;
[EQGVAR(main,hideObject), [player, false]] call CBA_fnc_globalEvent;
[player] call FUNC(stopAcreSpectator);
[player, _this select 1] call ace_fnc_startSpectator;
ace_sys_spectator_can_exit_spectator = true;
ace_sys_spectator_exit_spectator = true;
