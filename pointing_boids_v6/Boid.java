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
  Vector loc;
  Vector vel;
  Vector acc;  
  double bWidth;
  double bHeight;
  double timeLeft;
  int [] bLineC;
  int [] bFillC; 

  Boid() {
    resetBoid();
  }

  Boid(int x_, int y_, int s_) {
    resetBoid();
    loc = new Vector(x_, y_);
    bWidth = bHeight = s_;
  }

  void resetBoid() {
    loc = new Vector(Vector.randVal(Cfg.pWidth), Vector.randVal(Cfg.pHeight));
    vel = Vector.randVec(Cfg.velMag);
    acc = Vector.randVec(Cfg.accMag); 
    timeLeft = Vector.randVal(Cfg.maxLife);
    bWidth = bHeight = Cfg.bdSize;
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
      } else {
        acc = Vector.buildVectorFromRoot(loc, Cfg.pMouseX, Cfg.pMouseY);
        acc.setMag(Cfg.accMag);
      }
    }
    vel.add(acc);
    //vel.limit(Cfg.topSpeed);
    vel.limit(0.0);
    loc.add(vel);
    timeLeft--;
  }

  Boolean isMouseInBorder() {
    if (Cfg.pMouseX > 0 && Cfg.pMouseX < Cfg.pWidth &&
      Cfg.pMouseY > 0 && Cfg.pMouseY < Cfg.pHeight
      ) return true;
    else return false;
  }

  void checkBorders () {
    if (loc.x > Cfg.pWidth) {
      loc.x = 0;
    } else if (loc.x < 0) {
      loc.x = Cfg.pWidth;
    }
    if (loc.y > Cfg.pHeight) {
      loc.y = 0;
    } else if (loc.y < 0) {
      loc.y = Cfg.pHeight;
    }
  }
}
