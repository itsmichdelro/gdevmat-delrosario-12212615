public class Walker {
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  public float velocityLimit = 5;
  public float scale = 15;
  public float mass = 1;
  public float r = 255, g = 255, b = 255, a = 180; 
  public float gravitationalConstant = 0.4; 
  
  public Walker() {
   
  }
  
  // Newton's Second Law of Motion
  public void applyForce(PVector force) {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f); //force accumulation
  }
  
  public void update() {
    this.velocity.add(this.acceleration); //velocity accumulation
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0); //resets acceleration 
  }
  
  public void render() {
    //for transparency
    fill(r, g, b, a);
    circle(position.x, position.y, scale);
  }
  
  public void checkEdges() {
    if (this.position.x > Window.right) {
      this.position.x = Window.left;
    } else if (this.position.x < Window.left) {
      this.position.x = Window.right;
    }
    
    if (this.position.y > Window.top) {
      this.position.y = Window.bottom;
    } else if (this.position.y < Window.bottom) {
      this.position.y = Window.top;
    }
  }
  
  public PVector calculateAttraction(Walker walker) {
    PVector force = PVector.sub(this.position, walker.position); //direction
    float distance = force.mag();
    force.normalize(); 
    distance = constrain(distance, 5, 25);
    
    float strength = (this.gravitationalConstant * this.mass * walker.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
}
