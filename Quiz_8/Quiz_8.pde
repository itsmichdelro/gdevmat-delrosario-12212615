Walker[] walkers = new Walker[10]; //10 Walker objects
PVector gravity = new PVector(0, -0.4); //gravity force
PVector wind = new PVector(0.15, 0); //wind force

void setup()
{
    size(1280, 720, P3D);
    camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
    
    //10 Walker objects in an array
    for (int i = 0; i < walkers.length; i++)
    {
        walkers[i] = new Walker();
        
        //mass 1 to 10
        walkers[i].mass = i + 1;
        
        //scale depending on mass
        walkers[i].scale = walkers[i].mass * 15;
        
        //random color
        walkers[i].walkerColor = color(random(50, 255), random(50, 255), random(50, 255));
        
        //all walkers start at (-500, 200) position
        walkers[i].position = new PVector(-500, 200);
    }
}

void draw()
{
   
    background(0);
    
    for (int i = 0; i < walkers.length; i++)
    {
        //apply forces to all walkers
        walkers[i].applyForce(wind);
        walkers[i].applyForce(gravity);
        
        //update position
        walkers[i].update();
        
        //applied Newton's Third Law by making it bounce from the edges
        //bottom edge
        if (walkers[i].position.y <= Window.bottom)
        {
            walkers[i].velocity.y *= -1;
        }
        
        //top edge
        if (walkers[i].position.y >= Window.top)
        {
            walkers[i].velocity.y *= -1;
        }
        
        //left edge
        if (walkers[i].position.x <= Window.left)
        {
            walkers[i].velocity.x *= -1;
        }
        
        //right edge
        if (walkers[i].position.x >= Window.right)
        {
            walkers[i].velocity.x *= -1;
        }
        walkers[i].render();
    }
}
