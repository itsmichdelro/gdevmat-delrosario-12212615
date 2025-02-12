void setup() {
    size(1020, 720, P3D);
    camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
    background(0);
}

void draw() {
    // For X pos - using Gaussian distribution
    float gaussianX = randomGaussian();
    float meanX = 0;  // Center
    float stdDevX = 300;  // Spread across screen width
    float x = stdDevX * gaussianX + meanX;
    
    // For Y pos - using random() between screen bounds
    //camera setup: Y coordinates are flipped, so i used negative values
    float y = random(-height/2, height/2);
    
    // For circle 
    float gaussianSize = randomGaussian();
    float meanSize = 30;  // Average circle size
    float stdDevSize = 10;  // Variation in circle size
    float diameter = stdDevSize * gaussianSize + meanSize;
    
    // Random colors 
    float r = random(255);
    float g = random(255);
    float b = random(255);
    float a = random(10, 100);  // Alpha between 10-100 as specified
    
    // splatter
    noStroke();
    fill(r, g, b, a);
    circle(x, y, max(5, diameter));  // Using max() to prevent tiny circles
    
    // Bonus: Reset canvas every 300 frames
    if (frameCount % 300 == 0) {
        background(0);
    }
}
