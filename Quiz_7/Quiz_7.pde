Walker[] bubbles = new Walker[100]; 

void setup()
{
    size(1280, 720, P3D);
    camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
    
    //100 Walker instances with random positions and scales
    for (int i = 0; i < bubbles.length; i++)
    {
        bubbles[i] = new Walker();
    }
}

void draw()
{   
    // added colors
    background(0, 50, 100);
    
    noStroke();
    for (int i = 0; i < height; i += 5) {
        float inter = map(i, 0, height, 0, 1);
        color c = lerpColor(color(0, 150, 230), color(0, 50, 100), inter);
        fill(c, 5);
        rect(0, i, width, 5);
    }

    blendMode(ADD);
    
    //update and render all walkers
    for (int i = 0; i < bubbles.length; i++)
    {
        bubbles[i].update();
        bubbles[i].checkEdges();
        bubbles[i].render();
    }

    blendMode(BLEND);
}
