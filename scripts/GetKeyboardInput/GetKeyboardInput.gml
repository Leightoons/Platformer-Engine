///Keyboard Input///
	//Reads player input on keyboard when called

keyLeft			=	keyboard_check(vk_left) || keyboard_check(ord("A"));
keyRight		=	keyboard_check(vk_right) || keyboard_check(ord("D"));
keyUp			=	keyboard_check(vk_up) || keyboard_check(ord("W"));
keyDown			=	keyboard_check(vk_down) || keyboard_check(ord("S"));

keyJump			=	keyboard_check_pressed(vk_up);
keyJumpReleased	=	keyboard_check_released(vk_up);

keyRun			=	keyboard_check(ord("Z")) || keyboard_check(ord("X"));