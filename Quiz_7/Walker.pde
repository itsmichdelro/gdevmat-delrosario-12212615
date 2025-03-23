public class Walker
{
    public PVector position = new PVector();
    public PVector velocity = new PVector();
    public PVector acceleration = new PVector();
    public float velocityLimit = 10;
    public float scale = 15;
    public color bubbleColor;
    public float alpha; 

    public Walker()
    {
        position = new PVector(random(Window.left, Window.right), random(Window.bottom, Window.top));
        //random scale 
        scale = random(10, 20);
        //added colors to have the bubble effect look
        float colorChoice = random(100);
        if (colorChoice < 70) {
            //light blue 
            bubbleColor = color(random(100, 200), random(200, 255), 255, 150);
        } else if (colorChoice < 90) {
            //dark blue 
            bubbleColor = color(0, random(100, 170), random(200, 255), 130);
        } else {
            //white/transparent 
            bubbleColor = color(220, 240, 255, 100);
        }
        
        //random transparency
        alpha = random(100, 200);
    }
    
    public void update()
    {
        //mouse direction
        PVector direction = new PVector(mouseX - Window.windowWidth/2, -(mouseY - Window.windowHeight/2));
        direction.sub(position);
        direction.normalize();
        acceleration = direction.copy();
        
        //multiply by 0.2
        acceleration.mult(0.2);
        velocity.add(acceleration);
        
        //limit velocity magnitude
        velocity.limit(velocityLimit);
        position.add(velocity);
    }
    
    public void render()
    {
        noStroke();
       
        // Bubble body
        fill(bubbleColor, alpha);
        circle(position.x, position.y, scale);
        
        // Bubble highlight 
        fill(255, 255, 255, 150);
        circle(position.x - scale/4, position.y - scale/4, scale/5);
    }
    
    public void checkEdges()
    {
        //goes to opposite edge if it hits the boundaries
        if (position.x > Window.right)
        {
            position.x = Window.left;
        }
        else if (position.x < Window.left)
        {
            position.x = Window.right;
        }
        
        if (position.y > Window.top)
        {
            position.y = Window.bottom;
        }
        else if (position.y < Window.bottom)
        {
            position.y = Window.top;
        }
    }
}
