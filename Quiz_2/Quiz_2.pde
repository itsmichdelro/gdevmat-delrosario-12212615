class Walker {
    float x;
    float y;
    
    // initialize position
    Walker() {
        x = width/2;
        y = height/2;
    }
    
    void render() {
        // Random color with alpha between 50-100
        float r = random(255);
        float g = random(255);
        float b = random(255);
        float a = random(50, 100);
        fill(r, g, b, a);
        circle(x, y, 30);
    }
    
    void randomWalk() {
        // 8 directions: up, down, left, right, and diagonals
        int rng = int(random(8));
        
        switch(rng) {
            case 0: // Up
                y -= 10;
                break;
            case 1: // Down
                y += 10;
                break;
            case 2: // Left
                x -= 10;
                break;
            case 3: // Right
                x += 10;
                break;
            case 4: // Up-Left
                x -= 10;
                y -= 10;
                break;
            case 5: // Up-Right
                x += 10;
                y -= 10;
                break;
            case 6: // Down-Left
                x -= 10;
                y += 10;
                break;
            case 7: // Down-Right
                x += 10;
                y += 10;
                break;
        }
    }
    
    void randomWalkBiased() {
        // Generate between 0-99 for percentage
        float chance = random(100);
        
        // 40% right, 20% left, 20% up, 20% down
        if (chance < 40) { // 40% chance right
            x += 10;
        } else if (chance < 60) { // 20% chance left
            x -= 10;
        } else if (chance < 80) { // 20% chance up
            y -= 10;
        } else { // 20% chance down
            y += 10;
        }
    }
}
