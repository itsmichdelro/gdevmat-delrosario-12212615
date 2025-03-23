class Liquid
{
  float x, y, w, h;    //dimensions and position
  float c;             //drag coefficient
  color liquidColor;   //color of the liquid
  
  Liquid(float x, float y, float w, float h, float c)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    this.liquidColor = color(0, 100, 200, 150); 
  }
  
  boolean isInside(Walker walker)
  {
    //checks if the walker is inside the liquid
    return (walker.position.x > x && 
            walker.position.x < x + w &&
            walker.position.y > y && 
            walker.position.y < y + h);
  }
  
  PVector calculateDrag(Walker walker)
  {
    //drag force
    float speed = walker.velocity.mag();
    float dragMagnitude = c * speed * speed;
    
    //direction of drag - opposite to velocity
    PVector dragForce = walker.velocity.copy();
    dragForce.mult(-1);
    dragForce.normalize();
    dragForce.mult(dragMagnitude);
    
    return dragForce;
  }
  
  void render()
  {
    noStroke();
    fill(liquidColor);
    rect(x, y, w, h);
  }
}
