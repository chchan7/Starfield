class Particle {
  double myX, myY, mySpeed, myAngle;
  int myColor;
  
  Particle() {
    myColor = color((int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 256));
    myX = mouseX;   
    myY = mouseY;  
    mySpeed = Math.random() * 5 + 1; 
    myAngle = Math.random() * 2 * Math.PI;
  }
  
  void move() {
    myX += Math.cos(myAngle) * mySpeed;
    myY += Math.sin(myAngle) * mySpeed;
  }
  
  void show() {
    fill(myColor);
    noStroke();
    ellipse((float) myX, (float) myY, 50, 50);
  }
}

class OddballParticle extends Particle {
  OddballParticle() {
    super();
    myColor = color(200,120,200);
    mySpeed = 1.5;
  }
  
  void move() {
    myAngle += 0.02;
    myX += Math.cos(myAngle) * mySpeed;
    myY += Math.sin(myAngle) * mySpeed;
  }
  
  void show() {
    fill(myColor);
    noStroke();
    ellipse((float) myX, (float) myY, 80, 80);
  }
}

Particle[] sue;
Particle bob;

void setup() {
  frameRate(144);
  size(600, 600);
  initParticles();
}

void initParticles() {
  sue = new Particle[400];
  bob = new OddballParticle(); 
  for (int i = 0; i < sue.length; i++) {
    sue[i] = new Particle();
  }
}

void draw() {
  background(255);
  for (int i = 0; i < sue.length; i++) {
    sue[i].move();
    sue[i].show();
  }
  bob.move();
  bob.show();
}

void mousePressed() {
  if (mouseButton == LEFT) {
    initParticles();
  }
}

