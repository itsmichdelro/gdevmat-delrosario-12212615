Walker[] walkers = new Walker[10];

void setup() {
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  //walkers with random properties
  for (int i = 0; i < walkers.length; i++) {
    walkers[i] = new Walker();
    walkers[i].position = new PVector(
      random(Window.left, Window.right),
      random(Window.bottom, Window.top)
    );
    
    //random mass 
    walkers[i].mass = random(5, 10);
    walkers[i].scale = walkers[i].mass * 10;
    
    //random colors with transparency
    walkers[i].r = random(50, 255);
    walkers[i].g = random(50, 255);
    walkers[i].b = random(50, 255);
    walkers[i].a = random(100, 180); 
    
    walkers[i].gravitationalConstant = 0.4; 
 
    //velocity limit 
    walkers[i].velocityLimit = 5; 
  }
}

void draw() {
  background(0); 
  blendMode(BLEND);
  noStroke();
  
  //apply gravitational forces to all walkers
  for (int i = 0; i < walkers.length; i++) {
    for (int j = 0; j < walkers.length; j++) {
      if (i != j) {
        //calculate attraction from walker j-i
        PVector force = walkers[j].calculateAttraction(walkers[i]);
        //apply force to walker i
        walkers[i].applyForce(force);
      }
    }
    walkers[i].update();
    walkers[i].render();
    walkers[i].checkEdges();
  }
}
