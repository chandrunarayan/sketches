// Adapted by Chandru Narayan
// For the Bush School CPJava Final Project
// Fall 2021 - Spring 2022

// Credits:
// The Nature of Code
// Daniel Shiffman
//

// Pathfinding Flowfield w/ Genetic Algorithms

// A class for an obstacle, just a simple rectangle that is drawn
// and can check if a creature touches it

// Also using this class for starting point and target position

class Obstacle {

  Rectangle r;

  Obstacle(int x, int y, int w, int h) {
    r = new Rectangle(x,y,w,h);
  }
  
  Obstacle(Rectangle r_) {
    r = r_;
  }

  void display() {
    stroke(0);
    fill(175);
    rectMode(CORNER);
    rect(r.x,r.y,r.width,r.height);
  }

  boolean contains(PVector spot) {
    if (r.contains((int)spot.x,(int)spot.y)) {
      return true;
    } else {
      return false;
    }
  }

}
