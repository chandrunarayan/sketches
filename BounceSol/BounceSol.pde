// Ball Bounce Off An Angle
// Adapted from Keith Peters' Algorithm 
// from his book Foundation Actionscript 3.0 Animation: Making Things Move


// position, radius of the ball
float posx, posy;
float radius;

// velocity of the ball
float velx, vely;

// center, rotation and length of inclined segment.
float gx, gy, rot, len;

void setup(){
  size(600,600);
  posx = width/2;
  posy = height/2;
  radius = 40;
  
  velx = 5; 
  vely = 7;
  
  // center of segment = midpoint of (0,400) and (width, height)
  gx = width/2;
  gy = 500;
  
  // len and rotation of segment
  // use dist(x1,y1,x2,y2) to compute distance.
  // use atan2(dy, dx) for the rotation angle.
  len = dist(0, 400, width, height);
  rot = atan2(200, 600);
}
  
void draw(){
  background(255);
  // fill and draw triangle(inclined ramp): (0,400), (width,height), (0, height)
  fill(255,0,0);
  triangle(0,400,width,height,0,height);
  
  displayBall();
  moveBall();
  checkWallsCollision();  
  checkInclineCollision();

}

void displayBall(){
  // fill and draw ellipse(ball) at (posx,posy)
  fill(0,0,255);
  ellipse(posx, posy, 2*radius, 2*radius);
}

void moveBall(){
  // move ball
  posx += velx;
  posy += vely;
  
}

void checkWallsCollision(){
  // check top and the two side walls only
  // reverse direction if collide
  if(posx > width - radius){
    posx = width - radius;
    velx = -1*velx;
  }
    
  if(posx < radius){
    posx = radius;
    velx = -1*velx;
  }
    
  if(posy < radius){
    posy = radius;
    vely = -1*vely;
  }
}

void checkInclineCollision(){
  // check incline collision and reverse direction
  // use coordinate rotation trick, see lecture video for more details. 
  
  // (dx, dy) is relative position of ball with respect to (gx,gy)
  float dx = posx - gx;
  float dy = posy - gy;
  
  
  // compute cosine, sine of rot angle.
  float cosine = cos(rot);
  float sine = sin(rot);
  
  
  // rotate (dx,dy) to new coordinate (dx_,dy_)
  // rotate (velx, vely) to (velx_,vely_)
  // see lecture video for the formulas
  float dx_ = cosine * dx + sine * dy;
  float dy_ = cosine * dy - sine * dx;
  float velx_ = cosine * velx + sine * vely;
  float vely_ = -sine * velx + cosine * vely ;
  
  
  // once rotated, it is easy to see when to bounce
  // and how to bounce(negate vertical velocity in rotated coordinate)
  if (dy_ > -radius) {
    dy_ = -radius;
    vely_ = -1.0*vely_;  
  }

    // rotate everything back to restore the original 
    // coordinate axis.
    dx = cosine * dx_ - sine * dy_;
    dy = cosine * dy_ + sine * dx_;
    velx = cosine * velx_ - sine * vely_;
    vely = cosine * vely_ + sine * velx_;
    
    posx = gx + dx;
    posy = gy + dy;

}
