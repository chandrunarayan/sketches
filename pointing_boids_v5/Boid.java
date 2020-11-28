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
  double bWidth;
  double bHeight;
  double timeLeft;
  int [] bLineC;
  int [] bFillC;
  static int bdSize = 20;
  static double maxLife = 200000;
  static double topSpeed = (double) 3.0;
  static double accInc = (double) 0.08;  
  static double velInc = (double) 0.3;

  Boid() {
    resetBoid();
  }

  Boid(int x_, int y_, int s_) {
    resetBoid();
    location = new Vector(x_, y_);
    bWidth = bHeight = s_;
  }

  void resetBoid() {
    location = new Vector(Vector.randVal(Cfg.pWidth), Vector.randVal(Cfg.pHeight));
    velocity = Vector.randVec(velInc);
    acceleration = Vector.randVec(accInc);
    timeLeft = Vector.randVal(maxLife);
    bWidth = bHeight = bdSize;
    bLineC = setColor(0, 0, 0);
    bFillC = setRandColor();
  }

  int [] setRandColor() {
    int [] rc_ = new int[] { 
      (int)(Math.random()*255), 
      (int)(Math.random()*255), 
      (int)(Math.random()*255)
    };
    return rc_;
  }

  int [] setColor(int r_, int g_, int b_) {
    int [] rc_ = new int[] { r_, g_, b_ };
    return rc_;
  }

  void update () {
    if (isMouseInBorder()) {
      if (Cfg.pKeyPressed) {
        if (Cfg.pKey == 'r' || Cfg.pKey == 'R')
          resetBoid();
      } else if (Cfg.pMousePressed) {
        Vector mouseloc = new Vector(Cfg.pMouseX, Cfg.pMouseY);
        Vector accelDir = Vector.sub(mouseloc, location);
        accelDir.setMag(accInc);
        acceleration = accelDir;
      }
    }
    velocity.add(acceleration);
    velocity.limit(0.001);
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
    if (location.x > Cfg.pWidth) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = Cfg.pWidth;
    }
    if (location.y > Cfg.pHeight) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = Cfg.pHeight;
    }
  }
}
