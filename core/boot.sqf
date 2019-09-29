
/*
	Title: Core Framework Bootstrap
	Author(s): Naught
*/

/* Don't Double Load */
if !(isNil "core_init") exitWith {};

if (isServer) then {
    nos_markerHash = [[], nil] call CBA_fnc_hashCreate;
    nos_postInit = false;
    ["nos_createGroupMarkers", {
        private ["_groupID", "_color", "_side", "_object", "_marker", "_type", "_size", "_attachToUnit"];
        _groupID = _this select 0;
        _side = _this select 1;
        _object = _this select 2;
        _type = _this select 3;
        _color = _this select 4;
        _size = _this select 5;
        _attachToUnit = _this select 6;
        
        if (isNil "_type") then {
            _type = "";
        } else {
            player groupChat str _type;
            _type = toLower _type;
        };
        
        if (isNil "_color") then {
            _color = "";
        };
        
        private ["_uidStr", "_attachedType"];
        _uidStr = _groupID + "_" + str _side + "_" + _type;
        _attachedType = if (_attachToUnit) then {
            _obj;
        } else {
            group _obj;
        };
        
        if !([nos_markerHash, _uidStr] call CBA_fnc_hashHasKey) then {
            // If we are past all players loaded then broadcast all future marker creations globally
            if (nos_postInit) then {
                ["nos_createGroupMarkerLocal", [_uidStr, _attachedType, _type, _groupID, _color, _size]] call CBA_fnc_globalEvent;
            };
            [nos_markerHash, _uidStr, [_groupID, _attachedType, _type, _groupID, _color, _size]] call CBA_fnc_hashSet;
        };
    }] call CBA_fnc_addEventHandler;

    ["nos_playerInitialized", {
        private ["_player"];
        _player = _this select 0;

        [nos_markerHash, {
            ["nos_createGroupMarkerLocal", [_player, _key, _value select 1, _value select 2, _value select 3, _value select 4, _value select 5]] call CBA_fnc_whereLocalEvent;
        }] call CBA_fnc_hashEachPair;
               
    }] call CBA_fnc_addEventHandler;
};

fnc_initializeUnit = compile preprocessFileLineNumbers "fnc_initializeUnit.sqf";

/* Set Defines */
#define COMPONENT "Core-Init"

/* Load Version Number */
core_version = call compile preprocessFile "core\version";

/* Start Loading Screen */
startLoadingScreen [format["Loading Core Mission Framework v%1...", core_version]];

/* Load Data and Libraries */
#include "load.sqf"

/* Load Core Initialization */
#include "init.sqf"

/* End Loading Screen */
endLoadingScreen;
