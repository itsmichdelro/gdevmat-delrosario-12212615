float time = 0;
float amplitude = 30;
float frequency = 0.06;

void setup() {
    size(1280, 720, P3D);
    camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

void draw() {
    background(0);
    drawCartesianPlane();
    drawQuadratic();
    drawLinearPurple();
    drawMovingSineWave();
    time += 0.1;  // increment time for sine wave 
}

void drawCartesianPlane() {
    stroke(255);
    line(300, 0, -300, 0);  // x-axis
    line(0, -300, 0, 300);  // y-axis
    // tick marks
    for (int i = -300; i <= 300; i += 10) {
        line(i, -2, i, 2);
        line(-2, i, 2, i);
    }
}

void drawQuadratic() {
    // f(x) = x^2-15x-3 in yellow
    fill(255, 255, 0);
    noStroke();
    for (float x = -300; x <= 300; x += 0.1f) {
        float y = (float)(Math.pow(x, 2) - 15 * x - 3);
        circle(x, y, 5);
    }
}

void drawLinearPurple() {
    // f(x) = -5x+30 in purple
    fill(128, 0, 128);
    noStroke();
    for (float x = -300; x <= 300; x += 0.1f) {
        float y = -5 * x + 30;
        circle(x, y, 5);
    }
}

void drawMovingSineWave() {
    // sine wave in pink
    fill(255, 192, 203);
    noStroke();
    for (float x = -300; x <= 300; x += 0.1f) {
        float y = amplitude * sin(frequency * x + time);
        circle(x, y, 5);
    }
}

void keyPressed() {
    // Controls for sine wave
    if (key == 'a') amplitude += 10;    // Increase amplitude
    if (key == 's') amplitude -= 10;    // Decrease amplitude
    if (key == 'f') frequency += 0.01;  // Increase frequency
    if (key == 'd') frequency -= 0.01;  // Decrease frequency
} 
