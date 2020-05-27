/// @desc Player Variables

//Animations/Misc
	facing		= 1;						//which direction the player should face ( -1 = left; 1 = right)
												//direction player SPRITE is facing is handled separately
												//in the 'End Step' event of objPlayerMask
// Movement Speed
	m = 1;									//adjust this to change overall player speed
	
	hSpeed		=	0.00;					//horizontal speed (negative = left; positive = right)
	hSpeedFloat	=	0.00;					//leftover fraction from hSpeed
	hFloatLast	=	0.00;					//stores previous hSpeedFloat
	hFloatSame	=	0;						//stores number of frames hFloat has stayed the same
	hSpeedMax	=	10 * m;					//maximum horizontal speed
	
	vSpeed		=	0.00;					//vertical speed (negative = up; positive = down)
	vSpeedFloat	=	0.00;					//leftover fraction from vSpeed
	vSpeedMax	=	12 * m;					//maximum vertical speed


// Friction
	groundAccel		=	0.4 * m;			//acceleration on ground
	groundFriction	=	0.40 * m;			//friction on ground

	airAccel		=	0.35 * m;			//acceleration in air
	airFriction		=	0.22 * m;			//friction in air


// Walking/Running
	speedWalk	=	3.8 * m;				//player target walking speed
	speedRun	=	8.0 * m;				//player target running speed
	
	running		=	false;					//(boolean) is player holding run button
	
	topSpeed	=	speedWalk * m;			//current target speed (speed to shift towards when accelerating)
	
	runAccel	=	0.10 * m;				//how fast to reach max running speed while holding run
	runSlow		=	0.20 * m;				//how fast to decay topSpeed back to speedWalk when not running


// Jumping
	jumpHeight			=	18  * m;		//jump speed (vSpeed set to -jumpHeight on jump)
	grav				=	1   * m;		//gravity (added to vSpeed)
	gravSlide			=	0.3 * m;		//gravity while wall sliding
	
	jumpBufferCounter	=	0;				//initialize buffer counter
	jumpBufferMax		=	2;				//max frames to store jump input
	
	coyoteCounter		=	0;				//initialize coyote time counter
	coyoteMax			=	6;				//amount of frames to allow for late jump
	
	jumped				=	true;			//checks if player has already jumped
	onGround			=	false;			//similar to OnGround() function, but value is only updated...
											//...when this variable is set manually
	
// Wall Jumping/Sliding
	//gravSlide is grouped next to grav

	onWall		=	0;						//-1 means wall on left, 1 means wall on right, 0 means no wall
	
	
	wallTargetTop		=	40;				//the top edge of the target zone, in pixels offset from top of player bounding box
												//positive value = pixels BELOW bbox top
										
	wallTargetBottom	=	20;				//the bottom edge of the target zone, in pixels offset from bottom of player bounding box
												//positive value = pixels ABOVE bbox bottom			

	hspWallJump			=	8 * m;			//horizontal speed of wall jump
	vspWallJump			=	14 * m;			//vertical speed of wall jump
	vSpeedMaxSlide		=	3 * m;			//max y velocity while wall sliding
											//max speed you will slide down the wall
												
	wallLeaveCounter	=	0;				//counts up when player is attempting to move away from a wall they are currently on, counts down if not
	wallLeaveThreshold	=	10;				//	if player has been holding directional button away from wall for this
											//many frames, unstick from wall
	

	momentumLock		=	0;				//set to max after wall jump; 'locks' momentum when above 0
	momentumLockMax		=	10;				//how many frames to 'lock' momentum after wall jump
												//	when momentum is'locked' ability to slow down
												//or turn around is reduced, (by altering frcition)
												//and player direction is locked in place
	
	dust				=	0;				//timer/counter for spawning dust particles
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Transform
imageScale = 1.0;							//object size relative to default sprite size (1 meaning 1:1 ratio)
image_xscale = imageScale;						//editing image_xscale directly will affect the collision mask,
image_yscale = imageScale;						//so we use a variable instead and set the scale in a 'Draw' event

xScale = imageScale;						//sprite xscale (used for squash and stretch)
yScale = imageScale;						//sprite yscale (used for squash and stretch)

reformSpeed = 0.035							//how quickly to return to defualt shape after transformation

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

playerState = StateFreePlatform;			//used for state machine
playerAction = "idle";						//used for animating objPlayerMask

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

