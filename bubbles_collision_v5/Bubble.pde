class Bubble {
  float x, y;
  float r, g, b;
  float sz, sp;
  boolean hit;

  Bubble() {
    x = (float)Math.random()*width;
    y = height+20;
    r = (float)(Math.random()*256);
    g = (float)(Math.random()*256);
    b = (float)(Math.random()*256);
    sz = (float)(Math.random()*maxSz)+minSz;
    //sz = maxSz;
    sp = sz * sz * spFact;
    hit = false;
  }

  Bubble(float x_, float y_) {
    this();
    x = x_;
    y = y_;
  }

  void move() {
    x += (int)(Math.random()*5)-2;
    if (escaped()) {
      y = height+maxSz;
    } else if (!reached()) {
      y -= sp;
    } else if (red()) {
      y -= sp;
    } else {
      y -= 0;
    }
  }

  void show() {
    fill(r, g, b);
    ellipse(x, y, sz, sz);
  }

  boolean red() {
    boolean res;
    //res = r/2 > (g+b)/2;
    res = r>g && r>b;
    return res;
  }

  boolean reached() {
    boolean res;
    res = y <= filtLoc+sz/2;
    return res;
  }

  boolean escaped() {
    boolean res;
    res = y <= -sz/2;
    return res;
  }

  void mark_hits(ArrayList <Bubble> b_) {
    for (int i = 0; i < b_.size(); i++) {
      Bubble aBub = b_.get(i);
      if (aBub.x <= aBub.sz/2 || aBub.x >= width-aBub.sz/2) {
        aBub.hit = true;
      }
      for (int j = 0; j < b_.size(); j++) {
        Bubble sBub = b_.get(j);
        if (aBub != sBub) {
          if (dist(aBub.x, aBub.y, sBub.x, sBub.y) <= (aBub.sz/2 + sBub.sz/2)) {
            aBub.hit = true;
            sBub.hit = true;
          }
        }
      }
    }
  }
}
