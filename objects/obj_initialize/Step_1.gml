/// @desc Update Frame Delta

//Calculate change in time per step
DELTA = delta_time / 1000000;

//Calculate game acceleration (relative to delta):
FRAME_DELTA_OVERRIDE = DESIRED_FPS * DELTA;

//Calculate game acceleration (respective to pausing):
FRAME_DELTA = FRAME_DELTA_OVERRIDE *!PAUSED;

//Update FPS every one second (Debug purposes only)
fpsTimer -= (1/FPS)* FRAME_DELTA; //count down in frames relative to deltatime

if (fpsTimer <= 0){
	//one second has passed
	fpsTimer = 1;
	//calculate fps
	FPS = fps_real;
}