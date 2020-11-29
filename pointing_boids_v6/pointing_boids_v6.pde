//
// Created by Chandru Narayan
// for Bush School CPJava course
// Fall 2020
//
// 11-23-2020 pointing_boids version v5
// Change Vector class to double
// Boids orient in the direction of movement
// Boids move towards a point where mouse is pressed
// Ability to show Velocity vectors as a line
// Hit 'r' to reset
//
// 11-28-2020 pointing_boids version v3
// Added ability to show Acceleration vector
// Modified Boid shape a little
//
int numBoid = 10;
Boid [] boids = new Boid[numBoid];

void setup() {
  size(800, 600);
  setupCfg();
  for (int i=0; i<boids.length; i++) {
    boids[i] = new Boid();
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
  Cfg.pMouseX = 0;
  Cfg.pMouseY = 0;
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
    fill(color(bd_.bFillC[0], bd_.bFillC[1], bd_.bFillC[2]));
    // translate to origin (center) of Boid)
    translate((float)(bd_.loc.x), (float)(bd_.loc.y));

    // Draw the Velocity vector by cloning 
    // the velocity vector and
    // scaling by Boid Size. Draw from
    // center of Boid in Blue color
    stroke(color(0, 0, 255));
    strokeWeight(1);
    //Vector velVector = Vector.cloneVectorWithSize(bd_.vel, Cfg.bdSize * 3);
    //line(0.0, 0.0, (float)(velVector.x), (float)(velVector.y));
    line(0.0, 0.0, (float)(bd_.vel.x), (float)(bd_.vel.y));

    // Draw the Acceleration vector by cloning 
    // the acceleration vector and
    // scaling by Boid Size. Draw from
    // center of Boid in Red color    
    stroke(color(255, 0, 0));
    strokeWeight(2);
    //Vector accVector = Vector.cloneVectorWithSize(bd_.acc, Cfg.bdSize * 2);
    //line(0.0, 0.0, (float)(accVector.x), (float)(accVector.y));
    line(0.0, 0.0, (float)(bd_.acc.x), (float)(bd_.acc.y));
    // rotate the Boid shape by the angle of the velocity vector
    rotate((float)bd_.loc.angle(bd_.vel));  
    // Draw the Boid with translated and rotated coordinates
    noStroke();
    beginShape();
    for (int i = 0; i < Cfg.vertices.length; i++) {
      vertex((float)Cfg.vertices[i].x, (float)Cfg.vertices[i].y);
    }
    endShape(CLOSE);

    // Restore original state of orgin and rotation
    popMatrix();
  }
}

int buildRandColor() {
  return color(
    (float)(Math.random()*255), 
    (float)(Math.random()*255), 
    (float)(Math.random()*255)
    );
}

int buildRandColorT() {
  return color(
    (float)(Math.random()*255), 
    (float)(Math.random()*255), 
    (float)(Math.random()*255), 
    (float)(Math.random()*255)
    );
}
