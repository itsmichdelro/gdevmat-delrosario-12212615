void setup() {
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1080, 720, P3D);
}

PVector mousePos() {
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

void draw() {
  background(130);
  
  PVector mouse = mousePos();
  // normalize and set length for the blade
  PVector normalizedMouse = mouse.normalize().mult(500);
  
  // double-sided effect
  PVector opposite = normalizedMouse.copy().mult(-1);
  
  // Black handle (medium thickness)
  strokeWeight(8);
  stroke(0);
  line(-20, 0, 20, 0);
  
  // Red outer glow (high thickness)
  strokeWeight(15);
  stroke(255, 0, 0, 150);
  line(0, 0, normalizedMouse.x, normalizedMouse.y);
  line(0, 0, opposite.x, opposite.y);
  
  // White inner blade (low thickness)
  strokeWeight(3);
  stroke(255, 255, 255);
  line(0, 0, normalizedMouse.x, normalizedMouse.y);
  line(0, 0, opposite.x, opposite.y);
  
  // Print magnitude of one side
  println("Blade Length: " + normalizedMouse.mag());
}
