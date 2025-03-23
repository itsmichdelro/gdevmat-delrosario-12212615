static class Window 
{ 
  static float left = -640; 
  static float right = 640; 
  static float bottom = -360; 
  static float top = 360; 
   
  static PVector borderForceField(Walker w) 
  { 
    PVector force = new PVector(0, 0); 
     
    if (w.position.x <= Window.left) 
    { 
      force.x = 1; 
    } 
    else if (w.position.x >= Window.right) 
    { 
      force.x = -1; 
    } 
     
    if (w.position.y <= Window.bottom) 
    { 
      force.y = 1; 
    } 
    else if (w.position.y >= Window.top) 
    { 
      force.y = -1; 
    } 
     
    return force; 
  } 
}
