public class Walker
{
    public PVector position = new PVector();
    public PVector velocity = new PVector();
    public PVector acceleration = new PVector();
    public float velocityLimit = 10;
    public float scale = 15;
    public float mass = 1;
    public color walkerColor;
    
    public Walker()
    {
    }
    
    public void applyForce(PVector force)
    {
        PVector f = PVector.div(force, this.mass);
        this.acceleration.add(f); //force accumulation
    }
    
    public void update()
    {
        this.velocity.add(this.acceleration); //velocity accumulation
        this.velocity.limit(velocityLimit);
        this.position.add(this.velocity);
        this.acceleration.mult(0); //reset acceleration 
    }
    
    public void render()
    {
        fill(walkerColor);
        circle(position.x, position.y, scale);
    }
}
