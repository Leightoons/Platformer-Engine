/// @desc StateFreePlatformBackup

/// PLAYER MOVEMENT BACKUP!!!!!!!!!!!!

//calculate input direction
var _move	= keyRight - keyLeft; // -1 = left; 1 = right

if (_move != 0)	facing	= _move;


//	╔═════════════════════╗▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
//	║	 ACCEL  &  FRICTION   ║
//	╚═════════════════════╝

var _accel; var _friction;														//declaring local variables

if (OnGround())	{ _accel = groundAccel; _friction = groundFriction; }			//player is on ground
else { _accel = airAccel; _friction = airFriction; }							//player is in air

if (momentumLock > 0) {momentumLock--; _friction *= 0.6;}						//"lock" momentum after wall jump
																					//friction is decreased, meaning it is harder for the player to turn around again
																					//player facing direction is also locked while in momentum lock


//▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
//▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

//	╔══════════╗▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
//	║    RUN	 ║
//	╚══════════╝

if (keyRun) && (_move != 0) running = true;									//if running; set true
else running = false;														//if not running; set false

if (running)																//RUNNING
 {
	 topSpeed = Approach(topSpeed, speedRun, _accel*runAccel);				//move topSpeed towards running speed
 }
else																		// NOT RUNNING
 {
	 topSpeed = Approach(topSpeed, speedWalk, _accel*runSlow);				//return topSpeed to walkSpeed
	 if (abs(hSpeed) < speedWalk) topSpeed = max(abs(hSpeed), speedWalk);	//set topSpeed ceiling to current speed
 }

if (abs(hSpeed) > topSpeed)													//if hSpeed over topSpeed
	{hSpeed = Approach(hSpeed,topSpeed*_move, _friction * runSlow * 2);}	//reduce hSpeed back to topSpeed


//▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
//▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

//	╔═════════════════════╗▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
//	║	HORIZONTAL MOVEMENT   ║
//	╚═════════════════════╝

//Right Input
if (_move == 1)
{
	if (hSpeed < 0) {hSpeed = Approach(hSpeed, 0, _friction);}
	if (abs(hSpeed) < topSpeed) hSpeed = Approach(hSpeed, topSpeed * _move, _accel);
}
//Left Input
else if (_move == -1)
{
	if (hSpeed > 0) {hSpeed = Approach(hSpeed, 0, _friction);}
	if (abs(hSpeed) < topSpeed)hSpeed = Approach(hSpeed, topSpeed * _move, _accel);
}

//No Input
if (_move == 0) {hSpeed = Approach(hSpeed, 0, _friction);}


//▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
//▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

//	╔═════════════════════╗▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
//	║	 VERTICAL  MOVEMENT   ║
//	╚═════════════════════╝

// GRAVITY //////////////////////////////////////////////////////////////////////////////////////////////////////////
var _gravFinal = grav;												//default gravity to grav
var _vSpeedMaxFinal	= vSpeedMax;									//default max y speed to vSpeedMax

//Wall slide speed
if (onWall != 0) && (vSpeed > 0)									//if sliding down wall
{																	//
	_gravFinal = gravSlide;											//set gravity to gravSlide
	_vSpeedMaxFinal = vspMaxSlide;									//set max y speed to vspMaxSlide
	if (wallContactTrue==false)										//slow down if making first contact
	{
		vSpeed = Approach(vSpeed, 0, 999);
		wallContactTrue = true;
	}
}

vSpeed = Approach(vSpeed, _vSpeedMaxFinal, _gravFinal);				//apply gravity to vSpeed


// WALL JUMP ////////////////////////////////////////////////////////////////////////////////////////////////////////
if (onWall !=0) && (!OnGround()) && (keyJump)						//wall jump
{																	//
	hSpeed		= -onWall * hspWallJump;							//set horizontal speed of wall jump
	vSpeed		= -vspWallJump;										//set vertical speed of wall jump
	jumped		= true;												//update jumped status
	facing		= -facing;											//flip direction
																	//
	hSpeedFloat = 0;												//drop horizontal sub-pixel speed
	vSpeedFloat	= 0;												//drop vertical sub-pixel speed
	momentumLock = momentumLockMax;									//set momentum lock timer to max
}

 
// COYOTE TIME ////////////////////////////////////////////////////////////////////////////////////////////////////////
	//provides a margin of error where player can still jump after leaving solid ground
if (!OnGround())													//if NOT on ground
{
		if (coyoteCounter > 0)	coyoteCounter --;					//count down coyote timer
																	
		if (jumped = false) && (coyoteCounter > 0)					//if player hasn't yet jumped and is within allowed delay
		{															//
			if (keyJump)											//on jump input
			{														//	▼
				vSpeed = -jumpHeight;								//perform jump
				xScale = imageScale * 0.8;							//squash x
				yScale = imageScale * 1.2;							//stretch y
				playerAction = "air";								//update playerAction
				jumped = true;										//set jumped to true
			}
		}
}
else																//if player is on ground
{																	//		▼
	 jumped = false;												//reset jumped to false
	 coyoteCounter = coyoteMax;										//reset coyote time counter to max
}
 

// JUMP BUFFER ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//provides a margin of error for pressing the jump key too early before landing
	
if (keyJump) jumpBufferCounter = jumpBufferMax;						//set buffer counter to max on jump input

if (jumpBufferCounter > 0)											//If counter greater than 0
{																	//		▼
	jumpBufferCounter --;											//count down buffer timer
	if (OnGround())													//Once on ground
	{																//		▼
		vSpeed = -jumpHeight ;										//perform jump
		xScale = imageScale * 0.8;									//squash x
		yScale = imageScale * 1.2;									//stretch y
		playerAction = "air";										//update playerAction
		jumped = true;												//update jumped
	}
}


// Variable Jump Height ////////////////////////////////////////////////////////////////////////////////////////////////////////
	//reduce jump speed if player lets go of jump button before the peak of the jump

if (keyJumpReleased)												//If jump key released
{
    if (vSpeed < 0 && vSpeed >= -jumpHeight)						//if player is moving UP and slower than jump speed
        vSpeed *= 0.5;												//decrease vSpeed by half
}



//▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
//▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

//	╔═════════════════════╗▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
//	║	  APPLY MOVEMENTS	  ║
//	╚═════════════════════╝

// Clamp Speed ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
clamp(vSpeed,-_vSpeedMaxFinal, _vSpeedMaxFinal);
clamp(hSpeed,-hSpeedMax, hSpeedMax);

//Apply Movements + Collisions /////////////////////////////////////////////////////////////////////////////////////////////////////////
		//moved into scripts for organization
ApplyHoriz();
ApplyVertical();


//▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
//▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

//	╔═════════════════════╗▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
//	║		WALL SLIDING	  ║
//	╚═════════════════════╝

//Wall Slide
var _onWall = place_meeting(x+1,y,parSolid) - place_meeting(x-1,y,parSolid)			//if any part of player is touching a wall (-1 for left, 0 for none, 1 for right)

//Check if bottom of target zone and top of target zone are both touching the same wall
	//the "target zone" is the area in in the middle of the player that must be touching the wall to slide
	//	The target zone is defined by its top and bottom (y values), and both these points 
	//must be touching the wall for the player to start sliding
	//	This means that the player will not slide against the wall if only the top or bottom is against the wall
//Define target zone bounds
	var _targetTop		=	10;		//the top edge of the target zone, in pixels offset from top of player bounding box
										//positive value = pixels BELOW bbox top
										
	var _targetBottom	=	20;		//the bottom edge of the target zone, in pixels offset from bottom of player bounding box
											//positive value = pixels ABOVE bbox bottom
											
if (place_meeting(x+_onWall,bbox_bottom-_targetBottom,parSolid) == place_meeting(x+_onWall,bbox_top+_targetTop,parSolid)) //if entire target zone is touching the wall
{																									
	onWall = _onWall;							//-1 means wall on left, 1 means wall on right, 0 means no wall
}
else {onWall = 0;}								//not on a wall

if (onWall == 0) {wallContactTrue = false;}		//reset wallcontacttrue if not on wall

//▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
//▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

//	╔═════════════════════╗▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
//	║	UPDATE ANIMATION INFO ║
//	╚═════════════════════╝

// CALCULATE CURRENT STATE /////////////////////////////////////////////////////////////////////////////////////////////////////////

image_speed = 1;																//reset animation speed to default
if (_move !=0 && momentumLock == 0) image_xscale = sign(_move);					//set sprite direction (unless in momentum lock

//Player is NOT on Ground
if (!onGround)																	//if NOT on ground
{																				//
	if (onWall != 0 )
	{
		facing	= -onWall;												//set sprite direction
		playerAction	= "wall";												//update playerAction
		var _side					= bbox_left;								//default _side to left
		if (onWall == 1) _side	= bbox_right;									//change _side to right if needed
		  
		//Dust Effect
		dust++;																	//increment dust timer (spawn dust particle at 3)
		if ((dust > 2) && (vSpeed > 0)) with (instance_create_layer(_side,bbox_top+random_range(-2,2), "VFX1", objDust))	//create dust particle
		{																		//
			other.dust	= 0;													//reset player dust spawn timer
			hspeed		= -other.onWall * random_range(0.2,0.8);				//set dust direction opposite wall
		}
	}
	 else																		//if NOT on wall
	{																			//
		dust			=	0;													//reset dust spawn counter
		playerAction	= "air";												//player is in the air
	}
}
//Player is on Ground
else if (OnGround()) playerAction= "ground";									//if player ON ground
onGround = OnGround();															//update onGround (may be outdated)

//Copy local variables to Sprite Mask
objPlayerMask.move	=	_move;