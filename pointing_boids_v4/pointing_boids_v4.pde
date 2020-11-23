//
// Created by Chandru Narayan
// for Bush School CPJava course
// Fall 2020
//
// 11-22-2020 pointing_boids version v2
// Boids orient in the direction of movement
// Boids move towards a point where mouse is pressed
// Ability to show Velocity vectors as a line
// Hit 'r' to reset
//
// 11-22-2020 pointing_boids version v3
// Added ability to show Acceleration vector
// Modified Boid shape a little
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
  Cfg.pMouseX = width/2;
  Cfg.pMouseY = height/2;
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
    // Save original state of orgin and rotation
    pushMatrix();    
    fill(color(bd_.bFillC));
    // translate to origin (center) of Boid)
    translate((int)bd_.location.x, (int)bd_.location.y);

    // Draw the Velocity vector by cloning 
    // the velocity vector and
    // scaling by Boid Size. Draw from
    // center of Boid in Blue color
    stroke(color(0, 0, 255));
    Vector velVector = Vector.mul(bd_.velocity, Boid.ptSize);
    line(0, 0, (int)(velVector.x), (int)(velVector.y));

    // Draw the Acceleration vector by cloning 
    // the acceleration vector and
    // scaling by Boid Size. Draw from
    // center of Boid in Blue color    
    stroke(color(255, 0, 0));
    Vector accVector = Vector.mul(bd_.acceleration, Boid.ptSize*20);
    line(0, 0, (int)(accVector.x), (int)(accVector.y));

    // rotate the Boid shape by the angle of the velocity vector
    rotate(bd_.location.angle(bd_.velocity));  
    // Draw the Boid with translated and rotated coordinates
    noStroke();
    beginShape();
    for (int i = 0; i < Cfg.vertices.length; i++) {
      vertex(Cfg.vertices[i].x, Cfg.vertices[i].y);
    }
    endShape(CLOSE);

    // Restore original state of orgin and rotation
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
