//
// Created by Chandru Narayan
// for Bush School CPJava course
// Fall 2020
//
// The Boid class defines a small object with a shape,
// location, velocity, acceleration and mass
// This class could used as a base class for creating
// systems of partcles and simulating group behaviour
// in movement and implementing Newtons laws of motion.
// It uses the custom Vector class strictly implemented 
// which closely follows the PVector class in Processing.
// 

class Boid {
  Vector location;
  Vector velocity;
  Vector acceleration;
  float bWidth;
  float bHeight;
  float timeLeft;
  int bLineC;
  int bFillC;
  static int ptSize = 20;
  static float maxLife = 200000;
  static float topSpeed = (float) 3.0;
  static float accelMag = (float) 0.1;  

  Boid() {
    timeLeft = Vector.randVal(maxLife);
    location = new Vector(Vector.randVal(Cfg.pWidth), Vector.randVal(Cfg.pHeight));
    velocity = Vector.randVec(topSpeed);
    acceleration = Vector.randVec(accelMag/2);
    bWidth = bHeight = ptSize;
    bLineC = 0;
    bFillC = 255;
  }

  Boid(int x_, int y_, int s_) {
    timeLeft = Vector.randVal(maxLife);
    location = new Vector(x_, y_);
    velocity = new Vector(0, 0);
    acceleration = new Vector(0, 0);
    bWidth = bHeight = s_;
    bLineC = 0;
    bFillC = 255;
  }

  void resetBoid() {
    location = new Vector(Vector.randVal(Cfg.pWidth), Vector.randVal(Cfg.pHeight));
    velocity = Vector.randVec(topSpeed);
    acceleration = Vector.randVec(accelMag/2);
  }

  void setLineColor(int lc_) {
    bLineC = lc_;
  }

  void setFillColor(int fc_) {
    bFillC = fc_;
  }

  void update () {
    if (isMouseInBorder() && Cfg.pMousePressed) {
      Vector mouseloc = new Vector(Cfg.pMouseX, Cfg.pMouseY);
      Vector accelDir = Vector.sub(mouseloc, location);
      accelDir.setMag(accelMag);
      acceleration = accelDir;
    }
    if (Cfg.pKeyPressed) {
      if (Cfg.pKey == 'r' || Cfg.pKey == 'R')
        resetBoid();
    }
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    timeLeft--;
  }

  Boolean isMouseInBorder() {
    if (Cfg.pMouseX > 0 && Cfg.pMouseX < Cfg.pWidth &&
      Cfg.pMouseY > 0 && Cfg.pMouseY < Cfg.pHeight
      ) return true;
    else return false;
  }

  void checkBorders () {
    if (location.x > Cfg.pWidth + bWidth/2) {
      location.x = bWidth/2;
    } else if (location.x < -bWidth/2) {
      location.x = Cfg.pWidth - bWidth/2;
    }
    if (location.y > Cfg.pHeight - bHeight/2) {
      location.y = 0;
    } else if (location.y < -bHeight/2) {
      location.y = Cfg.pHeight - bHeight/2;
    }
  }
}
