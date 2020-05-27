/*
playerAction states and corresponding animAction states
	ground
		-sprPlayerIdle
		-sprPlayerWalk
		-sprPlayerRun
		-sprPlayerLand
		-sprPlayerTurn
	air
		-sprPlayerJump
		-sprPlayerPeakHeight
		-sprPlayerFall
	wall
		-sprPlayerWall
		
	UNUSED ANIMATIONS
		-sprPlayerBrake
	
*/

//MISC FIXES
if (objPlayer.onWall != 0 && objPlayer.onGround == false) objPlayer.playerAction = "wall";

//set position to player position
x = objPlayer.x;
y = objPlayer.y;

playerAction		= objPlayer.playerAction;									//get playerAction from objPlayer
var _onGround	= place_meeting(objPlayer.x, objPlayer.y + 1, parSolid);		//get player OnGround() check

var _hSpeedApprox	= round(objPlayer.hSpeed + objPlayer.hSpeedFloat);			//hSpeed + hSpeedFloat ROUNDED to nearest 0.5 (removes inconsistencies in hSpeed between frames)
var _vSpeedApprox	= round(objPlayer.vSpeed + objPlayer.vSpeedFloat);			//vSpeed + vSpeedFloat ROUNDED to nearest 0.5
var _hSpeedTotal	= objPlayer.hSpeed + objPlayer.hSpeedFloat;					//combine hSpeed and hSpeedFloat into one variable



//Reset image_speed to default
image_speed=1;


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//CHECK FOR END OF TRANSITION ANIMATIONS
	//transition animations are animations that transition into...
	//another animation once they have finished playing
	
	//NOTE: transition animations must have one extra frame at the end, as...
	//they will be considered over once they reach their last frame
	
if (image_index > image_number-1)																		//if animation ison last frame, check for transition animations
	{
		//sprPlayerLand							//landing		►		idle
		if (sprite_index		== sprPlayerLand)		{sprite_index = sprPlayerIdle; image_index = 0;}
		//sprPlayerPeakHeight					//peak height	►		fall
		else if (sprite_index	== sprPlayerPeakHeight)	{sprite_index = sprPlayerFall; image_index = 0;}
		//sprPlayerTurn							//turn			►		idle
		else if (sprite_index	== sprPlayerTurn)		{sprite_index = sprPlayerIdle; image_index = 0;}
	}


//UNINTERRUPTABLE ANIMATIONS
	//animations listed here will exit the script if playing, preventing a...
	//new animation from being chosen instead
	
	//NOTE: if an animation here is not also a transition animation with a specified animation...
	//to play upon finishing, it will continue to play indefinitely

//sprPlayerTurn
if (sprite_index == sprPlayerTurn) exit;




// GROUND ANIMATIONS //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if (playerAction == "ground" )
{
	if (sprite_index == sprPlayerFall) {sprite_index = sprPlayerLand;image_index = 0; image_speed=1;}		//PLAYER LANDING AFTER JUMP/FALL
	
	if (_hSpeedApprox == 0.00 && sprite_index != sprPlayerLand)												//PLAYER IS IDLE
	{																										//
		sprite_index = sprPlayerIdle;																		//
	}																										//
	
	//Player is Moving
	else if (sprite_index != sprPlayerLand)																	//PLAYER IS MOVING
	{																										//	
/*WIP*/	image_speed = clamp(0.1+abs(objPlayer.hSpeed+objPlayer.hSpeedFloat)*0.15, 0.5, 1.4)					//set animation speed to match movement speed
// **ABOVE FORMULA IS WORK IN PROGRESS**																	//
//
	//Player is Moving Normally
		if ((sign(_hSpeedTotal) == sign(move)) && (move !=0))												//If player is moving in the direction their current momentum
		{
			if (abs(_hSpeedApprox) < 5)																		//PLAYER IS AT WALK SPEED
			{																								//
				var _lastAnim = sprite_index;																//
				var _storeFrame = image_index;																//
				sprite_index = sprPlayerWalk;																//
				if (_lastAnim == sprPlayerRun) {image_index = _storeFrame;}									// if transitioning from run pick up from last frame
			}																								
		
			else if (abs(_hSpeedApprox) > 5)																//PLAYER IS AT RUN SPEED
			{																								//
				var _lastAnim = sprite_index;																//
				var _storeFrame = image_index;																//
				sprite_index = sprPlayerRun;																//
				if (_lastAnim == sprPlayerWalk) {image_index = _storeFrame;}								// if transitioning from walk pick up from last frame
			}
		}
//
	//Player is Turning Around
		if (facing	!= objPlayer.facing)																	//DIRECTION HAS CHANGED
		{																									//
			facing = objPlayer.facing;																		//turn to face new direction
			
			//establish local var																			//this variable is used to determine whether
			var _canTurn = false;	//establish var and default to false									//or not the player is currently in an animation
			if (sprite_index		== sprPlayerIdle)	{_canTurn = true;}									//that can transition into the turning animation
			else if (sprite_index	== sprPlayerWalk)	{_canTurn = true;}									//
			else if (sprite_index	== sprPlayerRun)	{_canTurn = true;}									//
			
			if (_canTurn == true && abs(_hSpeedTotal) < 10000)												//PLAYER HAS TURNED (second condition will always be <10000...)
																											//		(...it's a relic from earlier version; safe to remove)
			{																								//
				image_index		= 0;																		//set frame to 0
				sprite_index	= sprPlayerTurn;															//play turning animation

			}
		}
	}
	 
}

// AIR ANIMATIONS //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
else if (playerAction == "air")														//AIR ANIMATIONS
{
	//temporary: need air turning animation
	if (facing != objPlayer.facing) facing = objPlayer.facing;
	
	
	if (_vSpeedApprox < 0)																			//PLAYER IS JUMPING
	{																								//
		sprite_index = sprPlayerJump;																//
	}																								
	else if (sprite_index == sprPlayerJump)															//PLAYER IS BEGINNING TO FALL
	{																								//
		sprite_index = sprPlayerPeakHeight;															//
	}																								
	else if (sprite_index != sprPlayerPeakHeight) sprite_index = sprPlayerFall;						//PLAYER IS FALLING
	
}
// WALL ANIMATIONS //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
else if (playerAction == "wall")																	//WALL ANIMATIONS
{
	facing = objPlayer.facing;																		//turn to face new direction
	if (true)																						//PLAYER IS WALL SLIDING
	{																								//
		sprite_index = sprPlayerWall;																//
	}
}