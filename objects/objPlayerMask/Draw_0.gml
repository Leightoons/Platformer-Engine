/// @description Insert description here
// You can write your code in this editor

//sprite origin point must be at bottom to allign with ground properly
draw_sprite_ext(sprite_index, image_index, x, y , objPlayer.xScale * sign(facing), objPlayer.yScale, 0, image_blend, image_alpha);