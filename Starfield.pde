  public class Particle {
    private double myX, myY, mySpeed, myAngle;
    private int myColor;
    
    public Particle() {
      myColor = color((int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 256));
      myX = mouseX;   
      myY = mouseY;  
      mySpeed = Math.random() * 5 + 1; 
      myAngle = Math.random() * 2 * Math.PI;
    }
    
    public void move() {
      myX += Math.cos(myAngle) * mySpeed;
      myY += Math.sin(myAngle) * mySpeed;
    }
    
    public void show() {
      fill(myColor);
      noStroke();
      ellipse((float) myX, (float) myY, 50, 50);
    }
      public double getX () {return myX;}
      public double getY () {return myY;}
      public double getSpeed () {return mySpeed;}
      public double getAngle () {return myAngle;}
      public int getColor () {return myColor;}
      
      public void setX(double x) { myX = x; }
      public void setY(double y) { myY = y; }
      public void setSpeed(double speed) { mySpeed = speed; }
      public void setAngle(double angle) { myAngle = angle; }
      public void setColor(int colorP) { myColor = colorP; }
  }

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
  
  Particle[] sue;
  Particle bob;
  
  public void setup() {
    frameRate(144);
    size(600, 600);
    initParticles();
  }
  
  public void initParticles() {
    sue = new Particle[400];
    bob = new OddballParticle(); 
    for (int i = 0; i < sue.length; i++) {
      sue[i] = new Particle();
    }
  }
  
  public void draw() {
    background(255);
    for (int i = 0; i < sue.length; i++) {
      sue[i].move();
      sue[i].show();
    }
    bob.move();
    bob.show();
  }
  
  public void mousePressed() {
    if (mouseButton == LEFT) {
      initParticles();
    }
  }

