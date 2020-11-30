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
  for (int i=0; i<boids.length; i++) {
    boids[i] = new Boid();
    boids[i].buildBoid();
  }

}

void draw() {
  background(255);
  for (int i=0; i<boids.length; i++) {
    //boids[i].checkBorders();
    boids[i].showBoid();
    boids[i].update();
  }
}

//void setupCfg() {
//  Cfg.pWidth = width;
//  Cfg.pHeight = height;
//  Cfg.pMouseX = 0;
//  Cfg.pMouseY = 0;
//}

//void updateCfg() {
//  Cfg.pMouseX = mouseX;
//  Cfg.pMouseY = mouseY;
//  Cfg.pMousePressed = mousePressed;
//  Cfg.pKeyPressed = keyPressed;
//  Cfg.pKey = key;
//}

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
