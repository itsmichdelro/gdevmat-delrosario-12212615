class Walker 
{ 
  public PVector position = new PVector(); 
  public PVector velocity = new PVector(); 
  public PVector acceleration = new PVector(); 
  public color col; 
  public float scale; 
  public float mass; 
   
  public Walker(float x, float y, float m, color c) 
  { 
    position.x = x; 
    position.y = y; 
    velocity.x = 0; 
    velocity.y = 0; 
    acceleration.x = 0; 
    acceleration.y = 0; 
    mass = m; 
    scale = mass * 15; 
    col = c; 
  } 
   
  public void update() 
  { 
    //update velocity by adding acceleration 
    velocity.add(acceleration); 
     
    //update position by adding velocity 
    position.add(velocity); 
     
    //reset acceleration
    acceleration.mult(0); 
  } 
   
  public void render() 
  { 
    fill(col); 
    circle(position.x, position.y, scale); 
  } 
   
  public void applyForce(PVector force) 
  { 
    //account for mass in the force calculation
    PVector f = PVector.div(force, mass); 
    acceleration.add(f); 
  } 
}
