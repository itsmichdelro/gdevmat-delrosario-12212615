Walker[] walkers = new Walker[10]; 
Liquid liquid;
float groundLevel;

void setup() 
{
  size(1280, 720, P3D);
  
  //liquid in the bottom half of the screen
  liquid = new Liquid(0, height/2, width, height/2, 0.1f);
  groundLevel = height - 20;
  
  //10 walkers
  for (int i = 0; i < walkers.length; i++) 
  { 
    float posX = map(i, 0, walkers.length-1, 100, width-100);
    float posY = -50; //slightly above the screen
    
    //random colors
    color randomColor = color(random(150, 255), random(50, 200), random(150, 255));
    
    //random mass 
    float mass = random(1, 7);
    
    walkers[i] = new Walker(posX, posY, mass, randomColor);
  }
}

void draw() 
{
  background(255);
  
  //ground
  fill(25, 25, 112); 
  rect(0, groundLevel, width, height - groundLevel);
  
  // Render the liquid
  liquid.render();
  
  for (Walker w : walkers) 
  {
    //wind force (constant)
    PVector wind = new PVector(0.1, 0);
    w.applyForce(wind);
    //gravity force 
    PVector gravity = new PVector(0, 0.15f * w.mass);
    w.applyForce(gravity);
    
    //drag force if walker is in the liquid
    if (liquid.isInside(w)) {
      PVector dragForce = liquid.calculateDrag(w);
      w.applyForce(dragForce);
    }
    
    w.update();
    
    //ground collision
    if (w.position.y + w.scale/2 > groundLevel) {
      //reposition to be on the ground
      w.position.y = groundLevel - w.scale/2;
      
      //bounce with some -energy 
      w.velocity.y *= -1.0; 
    }
    
    w.render();
    
    //horizontal border to keep walkers in view
    if (w.position.x - w.scale/2 < 0) {
      w.position.x = w.scale/2;
      w.velocity.x *= -1;
    }
    if (w.position.x + w.scale/2 > width) {
      w.position.x = width - w.scale/2;
      w.velocity.x *= -1;
    }
  }
}

void mousePressed() 
{
  //reset when mouse is clicked
  setup();
}
