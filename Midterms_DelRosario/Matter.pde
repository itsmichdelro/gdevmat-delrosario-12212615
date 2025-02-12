// Matter class to handle black hole and other particles
class Matter {
    PVector position;
    float scale;
    color col;
    
    Matter(boolean isBlackHole) {
        if (isBlackHole) {
            // Random position for black hole
            position = new PVector(random(Window.left, Window.right), 
                                 random(Window.bottom, Window.top));
            scale = 50;
            col = color(255); // White for black hole
        } else {
            // Gaussian distribution
            position = new PVector(randomGaussian() * (Window.windowWidth/3), 
                                 randomGaussian() * (Window.windowHeight/3));
            scale = random(5, 20);
            col = color(random(255), random(255), random(255));
        }
    }
    
    void render() {
        fill(col);
        noStroke();
        circle(position.x, position.y, scale);
    }
    
    void moveTowards(PVector target) {
        // Get direction vector without modifying original positions
        PVector direction = PVector.sub(target, position);
        
        // Normalize direction and scale movement speed
        direction.normalize();
        direction.mult(2); // Adjust speed as needed
        
        // Update position
        position.add(direction);
    }
}
