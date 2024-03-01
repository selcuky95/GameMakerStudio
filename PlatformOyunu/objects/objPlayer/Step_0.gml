//get player input

var key_left = keyboard_check(vk_left);  // parametre içerisinde belirtilen tuşa basıyor olup olmadığımız
                                         // durumlarda ( keyboard_check ) kullanıcaz.!!  basarsak 1 basmazsak 0
var key_up = keyboard_check(vk_up);
                   
var key_right = keyboard_check(vk_right);

var key_jump = keyboard_check_pressed(vk_space);

var move = key_right - key_left;

// calculate movement
hsp = move * walksp;

vsp = vsp + grv;

if(place_meeting(x,y+1,objWall)) && (key_jump)
{
	vsp = -7;
	onthefloor = 1;
}

// horizontal collision
if(place_meeting(x+hsp,y,objWall))
{
	while (!place_meeting(x+sign(hsp),y,objWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}

x = x + hsp;

// vertical collision

if(place_meeting(x,y+vsp,objWall))
{
	while (!place_meeting(x,y+sign(vsp),objWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;


// animation
if(!place_meeting(x,y+1,objWall))
{
	sprite_index = sPlayer2;
	image_speed = 0;
	if(sign(vsp) > 0) image_index = 1; else	image_index = 0;	
}



if(hsp != 0) image_xscale = sign(hsp);   // KARAKTERİN YÜZÜ SİGN(HSP) NİN - ya da + yönüne göre dönecek KOD

