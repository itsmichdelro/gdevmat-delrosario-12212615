Matter blackHole;
Matter[] particles;
int frameCounter = 0;
int resetFrames = 500; // Reset after 500 frames

void setup() {
    size(1080, 720, P3D);
    camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
    
    // black hole
    blackHole = new Matter(true);
    
    // particles array
    particles = new Matter[100];
    for (int i = 0; i < particles.length; i++) {
        particles[i] = new Matter(false);
    }
}

PVector mousePos() {
    float x = mouseX - Window.windowWidth;
    float y = -(mouseY - Window.windowHeight);
    return new PVector(x, y);
}

void draw() {
    background(0);
    
    // Update black hole position to follow mouse 
    if (mousePressed) {
        blackHole.position = mousePos();
    }
    
    // Render black hole
    blackHole.render();
    
    // Update and render particles
    for (Matter particle : particles) {
        particle.moveTowards(blackHole.position);
        particle.render();
    }
    
    // Reset after n frames
    frameCounter++;
    if (frameCounter >= resetFrames) {
        resetSimulation();
        frameCounter = 0;
    }
}

void resetSimulation() {
    // Reset black hole position if not following mouse
    if (!mousePressed) {
        blackHole = new Matter(true);
    }
    
    // Reset all particles
    for (int i = 0; i < particles.length; i++) {
        particles[i] = new Matter(false);
    }
}
