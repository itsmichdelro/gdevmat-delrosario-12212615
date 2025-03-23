Walker[] walkers = new Walker[14]; 
 
void setup() 
{ 
  size(1280, 720, P3D); 
  //7 walkers 
  for (int i = 0; i < walkers.length; i++) 
  { 
    //proper spacing of walkers
    float posY = 2 * (height / walkers.length) * (i - (walkers.length / 2)); 
     
    //random colors 
    color randomColor = color(random(50, 255), random(50, 255), random(50, 255)); 
     
    // (smallest at top, largest at bottom) 
    float mass = (i + 1) * 0.5; 
    walkers[i] = new Walker(Window.left + 100, posY, mass, randomColor); 
  } 
} 
 
void draw() 
{ 
  background(0, 0, 50); // Dark blue background 
  stroke(255); 
  strokeWeight(5); 
  line(0, Window.bottom, 0, Window.top); 
  strokeWeight(1); 
  noStroke(); 
   
  //braking point 
  float brakingPoint = Window.right - 5;
   
  for (Walker w : walkers) 
  { 
    //acceleration force (to the right) 
    PVector acceleration = new PVector(0.2, 0); 
    w.applyForce(acceleration); 
     
    //light base friction 
    float mew = 0.01f;  
     
    //friction when close to the edge
    if (w.position.x > brakingPoint) {
      mew = 0.8f; 
    }
    float normal = 1; 
    float frictionMagnitude = mew * normal; 
    PVector friction = w.velocity.copy(); 
    friction.mult(-1); 
    friction.normalize(); 
    friction.mult(frictionMagnitude); 
     
    w.applyForce(friction); 
    w.update(); 
    w.render(); 
  } 
} 
 
void mousePressed() 
{ 
  //reset when mouse is clicked 
  setup(); 
}
