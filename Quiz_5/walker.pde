public class Walker {
    private PVector position; // Position vector (instead of separate x, y)
    private PVector speed;    // Speed vector for movement
    
    public Walker() {
        // Initialize with random position and fixed speed
        position = new PVector(random(Window.left, Window.right), 
                             random(Window.bottom, Window.top));
        speed = new PVector(5, 8); // speed values 
    }
    
    public void render() {
        // Draw the walker
        fill(182, 52, 100);
        circle(position.x, position.y, 50);
    }
    
    public void moveAndBounce() {
        // Add speed to current position 
        position.add(speed);
        
        // Check for bouncing off edges
        if (position.x > Window.right || position.x < Window.left) {
            speed.x *= -1; // Reverse x direction
        }
        
        if (position.y > Window.top || position.y < Window.bottom) {
            speed.y *= -1; // Reverse y direction
        }
    }
}
