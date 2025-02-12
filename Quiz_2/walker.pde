Walker walker1;
Walker walker2;

void setup() {
    size(1080, 720, P3D);
    walker1 = new Walker();
    walker2 = new Walker();
}

void draw() {
   
    walker1.randomWalk();
    walker1.render();
    
    walker2.randomWalkBiased();
    walker2.render();
}
