// Ball Bounce Off An Angle
// Adapted from Keith Peters' Algorithm 
// from his book Foundation Actionscript 3.0 Animation: Making Things Move

class Ground {
  float x1, y1, x2, y2;  
  float x, y, len, rot;

  // Constructor
  Ground(float x1_, float y1_, float x2_, float y2_) {
    x1 = x1_;
    y1 = y1_;
    x2 = x2_;
    y2 = y2_;
    x = (x1+x2)/2;
    y = (y1+y2)/2;
    len = dist(x1, y1, x2, y2);
    rot = atan2((y2-y1), (x2-x1));
  }
}

class Ball{
  float posx, posy;
  float radius;
  float velx, vely;
  float gravity = 0.05;
  
  Ball(float x, float y, float r){
    posx = x;
    posy = y;
    radius = r;
    velx = .5;
    vely = 0; 
  }
  void display(){
  // fill and draw ellipse(ball) at (posx,posy)
  fill(0,0,255);
  ellipse(posx, posy, 2*radius, 2*radius);
}
  void move(){
  // move ball
  // gravity
  vely = vely + gravity;
 
   
  posx = posx + velx;
  posy = posy + vely;
  
  
}
  void checkWallsCollision(){
  // check top and the two side walls only
  // reverse direction if collide
  if(posx > width - radius){
    posx = width - radius;
    velx = -0.8*velx;
  }
  if(posx < radius){
    posx = radius;
    // changes direction + damping: velocity reduces by 20%.
    velx = -0.8*velx; 
  }
    
  
}
void checkInclineCollision(Ground g){
  // check incline collision and reverse direction
  // use coordinate rotation trick, see lecture video for more details. 
  
  // (dx, dy) is relative position of ball with respect to (gx,gy)
  float dx = posx - g.x;
  float dy = posy - g.y;
  
  
  // compute cosine, sine of rot angle.
  float cosine = cos(g.rot);
  float sine = sin(g.rot);
  
  
  // rotate (dx,dy) to new coordinate (dx_,dy_)
  // rotate (velx, vely) to (velx_,vely_)
  // see lecture video for the formulas
  float dx_ = cosine * dx + sine * dy;
  float dy_ = cosine * dy - sine * dx;
  float velx_ = cosine * velx + sine * vely;
  float vely_ = -sine * velx + cosine * vely ;
  
  
  // once rotated, it is easy to see when to bounce
  // and how to bounce(negate vertical velocity in rotated coordinate)
  if (dy_ > -radius && posx >= g.x1 && posx < g.x2){
    dy_ = -radius;
    vely_ = -0.6*vely_;  
  }

    // rotate everything back to restore the original 
    // coordinate axis.
    dx = cosine * dx_ - sine * dy_;
    dy = cosine * dy_ + sine * dx_;
    velx = cosine * velx_ - sine * vely_;
    vely = cosine * vely_ + sine * velx_;
    posx = g.x + dx;
    posy = g.y + dy;

}
  
  
  
}

Ball b;

int segments = 20;
Ground[] ground = new Ground[segments];


void setup(){
  size(800,600);
  b = new Ball(random(50,100), 60, 10);
  // center of segment = midpoint of (0,400) and (width, height)
  float[] peakHeights = new float[segments+1];
  for (int i=0; i<peakHeights.length; i++){
    peakHeights[i] = random(height-60, height-20);
  }

  /* Float value required for segment width (segs)
   calculations so the ground spans the entire 
   display window, regardless of segment number. */
  float segs = segments;
  for (int i=0; i<segments; i++){
    ground[i]  = new Ground(width/segs*i, peakHeights[i], width/segs*(i+1), peakHeights[i+1]);
  }  

}
  
void draw(){
  background(255);
  // fill and draw triangle(inclined ramp): (0,400), (width,height), (0, height)
  b.display();
  b.move();
  b.checkWallsCollision();  
  for (int i=0; i<segments; i++){
    b.checkInclineCollision(ground[i]);
  }
  fill(255,0,0);
  beginShape();
  for (int i=0; i<segments; i++){
    vertex(ground[i].x1, ground[i].y1);
    vertex(ground[i].x2, ground[i].y2);
  }
  vertex(ground[segments-1].x2, height);
  vertex(ground[0].x1, height);
  endShape(CLOSE);
  
  textSize(32);
  textAlign(CENTER);
  text("Press SPACE to reset.", width/2, 100);
  
}

void keyPressed(){
  if(key == ' '){
    setup();
    
  }
  
}
