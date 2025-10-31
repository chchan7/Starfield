 public class OddballParticle extends Particle {
    OddballParticle() {
      setColor(color(200,120,200));
      setSpeed(1.5);
    }
    
    void move() {
      setAngle(getAngle() + 0.02);
      setX(getX() + Math.cos(getAngle()) * getSpeed());
      setY(getY() + Math.sin(getAngle()) * getSpeed());
    }
    
    void show() {
      fill(getColor());
      noStroke();
      ellipse((float) getX(), (float) getY(), 80, 80);
    }
  }
