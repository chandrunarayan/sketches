class Ball{
  float posx, posy;
  float radius;
  float velx, vely;
  
  Ball(float x, float y, float r){
    posx = x;
    posy = y;
    radius = r;
    velx = random(3,7);
    vely = random(3,7); 
  }
  void display(){
  // fill and draw ellipse(ball) at (posx,posy)
  fill(0,0,255);
  ellipse(posx, posy, 2*radius, 2*radius);
}
  void move(){
  // move ball
  posx += velx;
  posy += vely;
}
  void checkWallsCollision(){
  // check top and the two side walls only
  // reverse direction if collide
  if(posx > width - radius || posx < radius)
    velx = -1*velx;
    
  if(posy < radius)
    vely = -1*vely;
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
    vely_ = -1.0*vely_;  
  }

    // rotate everything back to restore the original 
    // coordinate axis.
    dx = cosine * dx_ - sine * dy_;
    dy = cosine * dy_ + sine * dx_;
    velx = cosine * velx_ - sine * vely_;
    vely = cosine * vely_ + sine * velx_;

}
  
  
  
}
