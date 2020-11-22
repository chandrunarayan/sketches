//
// Created by Chandru Narayan
// for Bush School CPJava course
// Fall 2020
//
// 11-22-2020 version v2
// Boids orient in the direction of movement
// Boids move towards a point where mouse is pressed
// Ability to show Velocity vectors as a line
// Hit 'r' to reset
//

int numBoid = 50;
Boid [] boids = new Boid[numBoid];

void setup() {
  size(800, 600);
  setupCfg();
  for (int i=0; i<boids.length; i++) {
    //boids[i] = new Boid(width/2, height/2, Boid.ptSize);
    boids[i] = new Boid();
    boids[i].setFillColor(buildRandColor());
    boids[i].setLineColor(0);
  }
  Cfg.buildBoid();
}

void draw() {
  background(255);
  updateCfg();
  for (int i=0; i<boids.length; i++) {
    boids[i].checkBorders();
    showBoid(boids[i]);
    boids[i].update();
  }
}

void setupCfg() {
  Cfg.pWidth = width;
  Cfg.pHeight = height;
}

void updateCfg() {
  Cfg.pMouseX = mouseX;
  Cfg.pMouseY = mouseY;
  Cfg.pMousePressed = mousePressed;
  Cfg.pKeyPressed = keyPressed;
  Cfg.pKey = key;
}

void showBoid(Boid bd_) {
  if (bd_.timeLeft > 0) {
    pushMatrix();
    fill(color(bd_.bFillC));
    stroke(color(bd_.bLineC));
    translate((int)bd_.location.x, (int)bd_.location.y);
    Vector velVector = Vector.mul(bd_.velocity, Boid.ptSize/2); 
    line(0, 0, (int)velVector.x, (int)velVector.y);
    rotate(bd_.location.angle(bd_.velocity));
    beginShape();
    for (int i = 0; i < Cfg.vertices.length; i++) {
      vertex(Cfg.vertices[i].x, Cfg.vertices[i].y);
    }
    endShape(CLOSE);
    popMatrix();
  }
}

int buildRandColor() {
  return color(
    (int)(Math.random()*255), 
    (int)(Math.random()*255), 
    (int)(Math.random()*255)
    );
}

int buildRandColorT() {
  return color(
    (int)(Math.random()*255), 
    (int)(Math.random()*255), 
    (int)(Math.random()*255), 
    (int)(Math.random()*255)
    );
}
