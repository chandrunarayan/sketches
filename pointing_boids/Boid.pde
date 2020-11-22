class Boid {
  Vector location;
  Vector velocity;
  Vector acceleration;
  float bWidth;
  float bHeight;
  float timeLeft;
  int bColor;

  Boid() {
    timeLeft = Vector.randVal(maxLife);
    location = new Vector(Vector.randVal(width), Vector.randVal(height));
    velocity = Vector.randVec(topSpeed);
    acceleration = new Vector(0, 0);
    bWidth = bHeight = ptSize;
    setRandColor();
  }

  Boid(int x_, int y_, int s_) {
    timeLeft = Vector.randVal(maxLife);
    location = new Vector(x_, y_);
    velocity = new Vector(0, 0);
    acceleration = new Vector(0, 0);
    bWidth = bHeight = s_;
    setRandColor();
  }

  void buildBoid() {
    pushMatrix();
    fill(bColor);
    stroke(bColor);
    translate((int)location.x, (int)location.y);
    Vector velVector = Vector.mul(velocity, ptSize/2); 
    line(0, 0, (int)velVector.x, (int)velVector.y);
    rotate(angle(velocity));
    int corners = 4;
    int [] xCorners = new int[] {-8, 16, -8, -4};
    int [] yCorners = new int[] {-8, 0, 8, 0};
    beginShape();
    for (int i = 0; i < corners; i++) {
      vertex(xCorners[i], yCorners[i]);
    }
    endShape(CLOSE);
    popMatrix();
  }

  float angle(Vector v_) {
    return (float)(atan2(v_.y, v_.x));
  }

  void setRandColor() {
    bColor = color(
      (int)(Math.random()*255), 
      (int)(Math.random()*255), 
      //(int)(Math.random()*255), 
      (int)(Math.random()*255)
      );
  }

  void showBoid() {
    if (timeLeft > 0) {
      buildBoid();
    }
  }

  void update () {
    Vector mouse = new Vector(mouseX, mouseY);
    Vector accelDir = Vector.sub(mouse, location);
    accelDir.setMag(accelMag);
    if (mousePressed) acceleration = accelDir;
    if (keyPressed) {
      if (key == 'r' || key == 'R') {
        velocity = Vector.randVec(topSpeed);
        acceleration = new Vector(0, 0);
      }
    }
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    timeLeft--;
  }

  void checkBorders () {
    if (location.x > width + bWidth/2) {
      location.x = bWidth/2;
    } else if (location.x < -bWidth/2) {
      location.x = width - bWidth/2;
    }
    if (location.y > height - bHeight/2) {
      location.y = 0;
    } else if (location.y < -bHeight/2) {
      location.y = height - bHeight/2;
    }
  }
}
