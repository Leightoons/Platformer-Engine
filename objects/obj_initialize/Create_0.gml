/// @desc Initialize

//	Make sure that the very first room of the game has this object!
//A blank room containing obj_initialize must be the very first room
//loaded, as this object sets up many important game settings and will
//remain persistant between rooms

//	Many of the variables and lines of code in this object are either
//for debug purposes or are leftovers from earlier versions of the engine

//	If you plan to remove or edit this object, make
//sure you know what effects this will have first.

//Global Variables
globalvar DELTA, FRAME_DELTA, FRAME_DELTA_OVERRIDE, DESIRED_FPS, PAUSED, FPS;

DESIRED_FPS = 60;
FPS = fps_real; // FPS & fpsTimer for debug purposes only
fpsTimer = 1;


// DELTA TIME // (game objects no longer factor delta_time into their movements)

//Force game to use microsecond intervals:
game_set_speed(16666,gamespeed_microseconds);

//Game is not paused at startup:
PAUSED = 0;

//Calculate change in time per step:
DELTA = delta_time / 1000000;

//Calculate game acceleration (relative to delta):
FRAME_DELTA_OVERRIDE = DESIRED_FPS * DELTA;
	//use for anything outside the scope of game world (GUI and menus and shit)

//Calculate game acceleration (respective to pausing):
FRAME_DELTA = FRAME_DELTA_OVERRIDE *!PAUSED;

//Start game:
room_goto_next();