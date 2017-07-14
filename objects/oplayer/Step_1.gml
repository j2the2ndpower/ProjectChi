///Flash gray when you get hurt, dont ask me that's just how things work
if (iframe == true) {
    timr1 += 1
    if (timr1 == 5) {
        timr1 = 0
        if (timr2 == 0) {
            sprite_index = damageSprite;
            timr2 = 1;    
        } else if (timr2 == 1) {
            sprite_index = playerSprite;
            timr2 = 0;
        }
    }
}
