/// @description Insert description here
// You can write your code in this editor


draw_set_color($FFFFFF);

draw_text(16,16,"FPS: " +  string(FPS));

	if(abs(objPlayer.hSpeed)<6) draw_set_color(c_red);
draw_text(16,34,objPlayer.hSpeed);
draw_text(40,34,objPlayer.hSpeedFloat);
	draw_set_color(c_black);

draw_text(16,48,objPlayer.vSpeed);
draw_text(40,48,objPlayer.vSpeedFloat);

//draw_text(16,70,FRAME_DELTA);



draw_text(16,90,objPlayer.playerAction);