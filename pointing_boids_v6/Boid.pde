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
  PVector loc;
  PVector vel;
  PVector acc;  
  double bWidth;
  double bHeight;
  double timeLeft;
  int [] bLineC;
  int [] bFillC; 
  int corners = 4;  //Number of Boid corners
  int [] xCorners = new int[] {-8, 16, -8, -2};
  int [] yCorners = new int[] {-8, 0, 8, 0};
  PVector [] vertices = new PVector[corners];
  double bdSize = 20;   //Characteristic dimension of a single Boid
  double velMag = (double) 0.3;    //Boid Initial Velocity magnitude 
  double accMag = (double) 0.08;   //Boid Initial Acceleration magnitude  
  double maxLife = 200000;   //Max life of a Boid
  double topSpeed = (double) 3.0;   //Limit Boid to a top speed

  void buildBoid() {                //Function to build Boid shape
    for (int i = 0; i < vertices.length; i++) {
      vertices[i] = new PVector(xCorners[i], yCorners[i]);
    }
  }

  Boid() {
    resetBoid();
  }

  Boid(int x_, int y_, int s_) {
    resetBoid();
    loc = new PVector(x_, y_);
    bWidth = bHeight = s_;
  }

  void showBoid() {
    if (timeLeft > 0) {
      // Save original state of orgin and rotation
      pushMatrix();    
      fill(color(bFillC[0], bFillC[1], bFillC[2]));
      // translate to origin (center) of Boid)
      translate((float)(loc.x), (float)(loc.y));

      // Draw the Velocity vector by cloning 
      // the velocity vector and
      // scaling by Boid Size. Draw from
      // center of Boid in Blue color
      stroke(color(0, 0, 255));
      strokeWeight(1);
      PVector velVector = vel;
      line(0.0, 0.0, (float)(velVector.x), (float)(velVector.y));
      //line(0.0, 0.0, (float)(vel.x), (float)(vel.y));

      // Draw the Acceleration vector by cloning 
      // the acceleration vector and
      // scaling by Boid Size. Draw from
      // center of Boid in Red color    
      stroke(color(255, 0, 0));
      strokeWeight(2);
      PVector accVector = acc;
      line(0.0, 0.0, (float)(accVector.x), (float)(accVector.y));
      //line(0.0, 0.0, (float)(acc.x), (float)(acc.y));
      // rotate the Boid shape by the angle of the velocity vector
      rotate((float)vel.heading());  
      // Draw the Boid with translated and rotated coordinates
      noStroke();
      beginShape();
      for (int i = 0; i < vertices.length; i++) {
        vertex((float)vertices[i].x, (float)vertices[i].y);
      }
      endShape(CLOSE);

      // Restore original state of orgin and rotation
      popMatrix();
    }
  }

  void resetBoid() {
    loc = new PVector((float)(Math.random()*255), (float)(Math.random()*255));
    vel = new PVector(0.0, 0.0);
    acc = new PVector(0.0, 0.0);
    timeLeft = Math.random()*maxLife;
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
      if (keyPressed) {
        if (key == 'r' || key == 'R')
          resetBoid();
      } else {
        PVector mouse = new PVector((float)mouseX, (float)mouseY);
        acc = PVector.sub(mouse, loc);
        acc.setMag((float)accMag);
      }
    }
    vel.add(acc);
    vel.limit((float)topSpeed);
    loc.add(vel);
    timeLeft--;
  }

  Boolean isMouseInBorder() {
    if (mouseX > 0 && mouseX < width &&
      mouseY > 0 && mouseY < height
      ) return true;
    else return false;
  }

  void checkBorders () {
    if (loc.x > width) {
      loc.x = 0;
    } else if (loc.x < 0) {
      loc.x = width;
    }
    if (loc.y > height) {
      loc.y = 0;
    } else if (loc.y < 0) {
      loc.y = height;
    }
  }
}
