// Ball Bounce Off An Angle
// Adapted from Keith Peters' Algorithm 
// from his book Foundation Actionscript 3.0 Animation: Making Things Move

Ball b;
// center, rotation and length of inclined segment.
float gx, gy, rot, len;

void setup(){
  size(600,600);
  b = new Ball(width/2, height/2, 40);
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
  
  b.display();
  b.move();
  b.checkWallsCollision();  
  b.checkInclineCollision();

}
