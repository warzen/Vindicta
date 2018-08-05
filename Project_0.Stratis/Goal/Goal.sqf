/*
The atomic goal class.
Based on source from "Programming Game AI by Example" by Mat Buckland: http://www.ai-junkie.com/books/toc_pgaibe.html

Author: Sparker 05.08.2018
*/

#include "..\OOP_Light\OOP_Light.h"
#include "Goal.hpp"
#include "..\Message\Message.hpp"
#include "..\MessageTypes.hpp"

CLASS("Goal", "MessageReceiver")

	VARIABLE("entity"); // The entity that owns this goal: unit, group, garrison, etc
	VARIABLE("state"); // Status of this goal
	VARIABLE("msgLoop"); // Message loop of this goal, if this goal needs to receive any messages
	VARIABLE("timer"); // The timer which will be sending messages to this goal so that it calls its process method
	
	// ----------------------------------------------------------------------
	// |                              N E W                                 |
	// |                                                                    |
	// | Arguments:                                                         |
	// |  _entity - The entity that owns this goal: unit, group, garrison ..|
	// |  _autonomous - if true, a timer will be created to call the        |
	// |   process method of this goal periodically.                        |
	// |   If false, this goal is assumed to be a subgoal and it will not   |
	// |   call its process method on its own.                              |
	// ----------------------------------------------------------------------
	
	METHOD("new") {
		params [["_thisObject", "", [""]], ["_msgLoop", "", [""]], ["_entity", "", [""]], ["_autonomous", false, [false]]];
		
		if (isNil "gTimerServiceMain") exitWith { diag_log "[Goal::new] Error: main timer service doesnt't exist!"; };
		
		SET_VAR(_thisObject, "entity", _entity);
		SET_VAR(_thisObject, "state", GOAL_STATE_INACTIVE); // Default state
		SETV(_thisObject, "msgLoop", _msgLoop);
		
		// If the goal is autonomous, create a timer for it
		if (_autonomous) then {
			private _msg = MESSAGE_NEW();
			_msg set [MESSAGE_ID_DESTINATION, _thisObject];
			_msg set [MESSAGE_ID_SOURCE, ""];
			_msg set [MESSAGE_ID_DATA, 0];
			_msg set [MESSAGE_ID_TYPE, GOAL_MESSAGE_PROCESS];
			private _args = [_thisObject, 3, _msg, gTimerServiceMain]; // message receiver, interval, message, timer service
			private _timer = NEW("Timer", _args);
			SETV(_thisObject, "timer", _timer);
		} else {
			SETV(_thisObject, "timer", ""); // No timer for this goal!
		};
	} ENDMETHOD;
	
	// ----------------------------------------------------------------------
	// |                            D E L E T E                             |
	// ----------------------------------------------------------------------
	
	METHOD("delete") {
		params [["_thisObject", "", [""]]];
		
		// Delete the timer of this goal if it exists
		private _timer = GETV(_thisObject, "timer");
		if (_timer != "") then {
			DELETE(_timer);
		};
	} ENDMETHOD;
	
	// ----------------------------------------------------------------------
	// |                   G E T   M E S S A G E   L O O P                  |
	// |                                                                    |
	// | Must implement this since we inherit from MessageReceiver          |
	// ----------------------------------------------------------------------
	
	METHOD("getMessageLoop") {
		params [ ["_thisObject", "", [""]] ];
		GETV(_thisObject, "msgLoop")
	} ENDMETHOD;
	
	// ----------------------------------------------------------------------
	// |                   S E T   M E S S A G E   L O O P                  |
	// |                                                                    |
	// | Sets the message loop for this goal                                |
	// ----------------------------------------------------------------------
	
	/* // Don't think I need it now anyway
	METHOD("setMessageLoop") {
		params [["_thisObject", "", [""]], ["_msgLoop", "", [""]] ];
		SETV(_thisObject, "msgLoop", _msgLoop);
	} ENDMETHOD;
	*/
	
	// ----------------------------------------------------------------------
	// |                      H A N D L E   M E S S A G E                   |
	// |                                                                    |
	// | Call this from handleMessage of inherited classes. If it returns   |
	// | true, it means message has been handled.                           |
	// ----------------------------------------------------------------------
	
	METHOD("handleMessage") { //Derived classes must implement this method
		params [ ["_thisObject", "", [""]] , ["_msg", [], [[]]] ];
		private _msgType = _msg select MESSAGE_ID_TYPE;
		if (_msgType == GOAL_MESSAGE_PROCESS) exitWith {
			diag_log format ["[Goal::handleMessage] Info: Calling process method...", _msg];
			CALLM(_thisObject, "process", []);
			true // message handled
		};
		
		if (_msgType == GOAL_MESSAGE_DELETE) exitWith {
			CALLM(_thisObject, "terminate", []);
			DELETE(_thisObject);
			true // message handled
		};
		false // message not handled
	} ENDMETHOD;
	
	// ----------------------------------------------------------------------
	// |                 A C T I V A T E   I F   I N A C T I V E            |
	// ----------------------------------------------------------------------

	METHOD("activateIfInactive") {
		params [["_thisObject", "", [""]]];
		private _state = GETV(_thisObject, "state");
		if (_state == GOAL_STATE_INACTIVE) then {
			CALLM(_thisObject, "activate", []);
		};
	} ENDMETHOD;
	
	// ----------------------------------------------------------------------
	// |                 R E A C T I V A T E   I F   F A I L E D            |
	// ----------------------------------------------------------------------
	
	METHOD("reactivateIfFailed") {
		params [["_thisObject", "", [""]]];
		private _state = GETV(_thisObject, "state");
		if (_state == GOAL_STATE_FAILED) then {
			CALLM(_thisObject, "activate", []);
		};
	} ENDMETHOD;
	
	// ----------------------------------------------------------------------
	// |                      V I R T U A L   M E T H O D S                 |
	// ----------------------------------------------------------------------
	
	// logic to run when the goal is activated
	/* virtual */ METHOD("activate") {} ENDMETHOD;
	
	// logic to run each update-step
	/* virtual */ METHOD("process") {} ENDMETHOD;
	
	// logic to run when the goal is satisfied
	/* virtual */ METHOD("terminate") {} ENDMETHOD; 
	
	// a Goal is atomic and cannot aggregate subgoals yet we must implement
	// this method to provide the uniform interface required for the goal
	// hierarchy.
	/* virtual */ METHOD("addSubgoal") { diag_log "[Goal::addSubgoal] Error: can't add a subgoal to an atomic goal!"; } ENDMETHOD;
	
	
	// ----------------------------------------------------------------------
	// |                         S T A T E   C H E C K S                    |
	// |                                                                    |
	// | Methods for checking the state of the goal                         |
	// ----------------------------------------------------------------------
	
	METHOD("isCompleted") {
		params [ ["_thisObject", "", [""]] ];
		private _state = GETV(_thisObject, "state"); _state == GOAL_STATE_COMPLETED
	} ENDMETHOD;
	
	METHOD("isActive") {
		params [["_thisObject", "", [""]]];
		(GETV(_thisObject, "state")) == GOAL_STATE_ACTIVE
	} ENDMETHOD;
	
	METHOD("isInactive") {
		params [["_thisObject", "", [""]]];
		(GETV(_thisObject, "state")) == GOAL_STATE_INACTIVE
	} ENDMETHOD;
	
	METHOD("isFailed") {
		params [["_thisObject", "", [""]]];
		(GETV(_thisObject, "state")) == GOAL_STATE_COMPLETED
	} ENDMETHOD;
ENDCLASS;