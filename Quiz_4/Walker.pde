
public class Walker {
    public float x;
    public float y;
    
    // Perlin noise ; for position
    public float tx = 0, ty = 10000;
    
    // Perlin noise; for scale
    public float tscale = 5000;
    
    // Perlin noise; for RGB colors
    public float tr = 2000;
    public float tg = 3000;
    public float tb = 4000;
    
    void render() {
        // Map scale using Perlin noise (5 to 150)
        float scale = map(noise(tscale), 0, 1, 5, 150);
        
        // Map RGB colors using Perlin noise (0 to 255)
        float r = map(noise(tr), 0, 1, 0, 255);
        float g = 255; // One value should be 255 as per midterm requirements
        float b = map(noise(tb), 0, 1, 0, 255);
        
        fill(r, g, b);
        circle(x, y, scale);
    }
    
    void perlinWalk() {
        // Map x and y positions
        x = map(noise(tx), 0, 1, -640, 640);
        y = map(noise(ty), 0, 1, -360, 360);
        
        // Increment all 
        tx += 0.01f;
        ty += 0.01f;
        tscale += 0.01f;
        tr += 0.01f;
        tb += 0.01f;
    }
}
