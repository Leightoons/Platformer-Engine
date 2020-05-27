//READ ME

// If you find yourself confused or unable to find something, look here

#region// NAMING CONVENTIONS ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Here's how I usually name my assets/variables/etc:
//
//	SPRITES: prefix = spr; each word capitalized; no spaces
//		examples:	sprPlayerIdle, sprPlayerWalk, sprDust
//		notes:		I organize sprites meant for the same object into folders together, as well as sprites for things like tiles, particles, etc.
//
//	SCRIPTS: all words capitalized; no spaces
//		examples:	GetKeyboardInput, StateFreePlatform, ApplyHoriz
//		exceptions:	scripts meant for notes or storage are named in all caps with an underscore between words
//		notes:		I sometimes use scripts as a sort of 'folder' for storing large blocks of related code, especially when
//					an event/script starts to get very crowded. I moved my code for changing the player's position and checking
//					for collisions into scripts in order to de-clutter the StateFreePlatform script.
//
//	OBJECTS: prefix = obj; each word capitalized; no spaces
//		examples:	objPlayer, objCamera
//		exceptions:	I named the Initialization object obj_initialize, since objInitialize looked weird to me for some reason.
//
//	PARENT OBJECTS:	the same as objects except I use the prefix "par" instead of "obj" (par short for parent)
//		examples:	parSolid (the parent object for all solid, collidable objects
//		notes:		I tend to organize the child objects into a folder directly underneath the parent object.
//
//	VARIABLES: lowercase first word, following words all capitalized; no spaces
//		examples:	hSpeed, groundAccel, topSpeed, coyoteTimer
//		
//	LOCAL VARIABLES: same as regular varaibles but prefixed with an underscore
//		examples:	var _hSpeed, var _lastAnim, var _move
//		notes:		I have a bad habit of sometimes naming local variables the same thing as regular variables but with an underscore;
//					usually local variables that store regular variables with little extra calculation. Be careful not to confuse them.
//
//	GLOBAL VARIABLES: fully capitalized; underscores in between words
//		examples:	DELTA, FRAME_DELTA, FPS, DESIRED_FPS, PAUSED
//
//	ROOMS:	I don't really have much of a consistent naming scheme for rooms. ¯\_(ツ)_/¯
//
//	AUDIO: There is no audio present yet in this version of the engine, but I do have a set naming scheme for sounds and music.
//		Sounds:		prefix = sfx (short for sound effects); each word capitalized; no spaces
//		Music:		same as sound effects, except I use the prefix "mus" instead of "sfx" to help differentiate the two
//		notes:		Music will usually be placed in a separate folder from the sound effects for the sake of organization.
//
#endregion

#region// ORGANIZATION //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Sections
//
//	I separate code into sections based on what it's meant to do. The most common way I do this is by putting a header at the 
//beginning of a section with a label followed by a row of forward slashes (these: /).
//	I adjust this system depending on how dense the event/script is. Usually sections labelled in all caps are meant to contain the
//following non-capitalized sections, and headers with a full row of slashes are meant to be larger than those without.
//
//	Larger sections are usually spaced out with more white space in between them than smaller sub-sections, and large sections with
//many sub-sections sometimes have a row of forward slashes before and after them to denote where they start and end.
//	The StateFreePlatform script became so dense that I used special ASCII characters to create dividers and larger, clearer headings
//for the giant meta-sections. This usually isn't worth the space it takes up in smaller scripts/events, so I only use it when needed.
//	Regions are, of course, used to help contain very long sections, so that they may be collapsed when not needed.
//
//
//Comments
//
//	I try to keep my code as clear and understandable as possible, so I try to put descriptions of what every single line of code is meant to
//do next to or above them. A description for a section will usually be right under the header, and a description for a single line or small
//block of code will usually be to the right of it.
//	I use an unbroken vertical line of "//" to connect related descriptions, to make it clear that they are part of the same conditional
//statement or are part of the same sub-section. Descriptions that are under the umbrella of another description/label will also
//occasionally be indented to signify that they are within the larger descriptor.
#endregion
