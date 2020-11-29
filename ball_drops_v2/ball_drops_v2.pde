//
// Created by Chandru Narayan
// for Bush School CPJava course
// Fall 2020
//
// 11-29-2020 ball_drops version v2
// Change Vector class to double
// Balls drop in gravity on to a jagged terrain
// Hit 'r' to reset
//

//

Ball b;

int segments = 20;
TerrainSeg[] terrsg = new TerrainSeg[segments];

void setup() {
  size(800, 600);
  setupCfg();
  b = new Ball(random(50, 100), 60, 10);
  // center of segment = midpoint of (0,400) and (width, height)
  float[] peakHeights = new float[segments+1];
  for (int i=0; i<peakHeights.length; i++) {
    peakHeights[i] = random(height-60, height-20);
  }

  /* Float value required for segment width (segs)
   calculations so the ground spans the entire 
   display window, regardless of segment number. */
  //float segs = segments;
  //for (int i=0; i<segments; i++){
  //  ground[i]  = new Ground(width/segs*i, peakHeights[i], width/segs*(i+1), peakHeights[i+1]);
  //}  


  /* Double value required for segment width (segs)
   calculations so the ground spans the entire 
   display window, regardless of segment number. */
  double segs = segments;
  for (int i=0; i<segments; i++) {
    terrsg[i]  = new TerrainSeg(width/segs*i, peakHeights[i], width/segs*(i+1), peakHeights[i+1]);
  }
}

void draw() {
  background(255);
  updateCfg();
  // fill and draw triangle(inclined ramp): (0,400), (width,height), (0, height)
  display(b);
  b.move();
  b.checkWallsCollision();  
  for (int i=0; i<segments; i++) {
    b.checkInclineCollision(terrsg[i]);
  }
  fill(255, 0, 0);
  beginShape();
  for (int i=0; i<segments; i++) {
    vertex((float)terrsg[i].beg.x, (float)terrsg[i].beg.y);
    vertex((float)terrsg[i].end.x, (float)terrsg[i].end.y);
  }
  vertex((float)terrsg[segments-1].end.x, (float)height);
  vertex((float)terrsg[0].beg.x, (float)height);
  endShape(CLOSE);

  textSize(32);
  textAlign(CENTER);
  text("Press SPACE to reset.", width/2, 100);
}

void display(Ball b_) {
  // fill and draw ellipse(ball) at (posx,posy)
  fill(0, 0, 255);
  ellipse((float)b_.posx, (float)b_.posy, (float)(2*b_.radius), (float)(2*b_.radius));
}

void setupCfg() {
  Cfg.pWidth = width;
  Cfg.pHeight = height;
  Cfg.pMouseX = 0;
  Cfg.pMouseY = 0;
}

void updateCfg() {
  Cfg.pMouseX = mouseX;
  Cfg.pMouseY = mouseY;
  Cfg.pMousePressed = mousePressed;
  Cfg.pKeyPressed = keyPressed;
  Cfg.pKey = key;
}

void keyPressed() {
  if (key == 'r') {
    setup();
  }
}
