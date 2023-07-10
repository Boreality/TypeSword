draw_set_font(fnt_default);
draw_text(x,y,"Game Over");
draw_text(x,y+40,"R- Restart");
draw_text(x,y+60,"Esc- Exit to Desktop");

draw_set_font(fnt_defeated);
draw_text(x,150,"Final Score: "+string(global.score));