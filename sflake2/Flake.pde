class Flake {
  float x, y, d;

  Flake(float x_, float y_) {
    x = x_;
    y = y_;
    d = dia;
  }

  void show() {
    noFill();
    stroke(255);
    ellipse(x, y, dia, dia);
  }

  void move() {
    x -= spd;
    y += (int)(Math.random()*(spread+1))-spread/2;
  }

  boolean stopped() {
    boolean res = false;
    if (x <= dia) {
      res = true;
    }
    return res;
  }

  boolean collided() {
    boolean ret = false;
    for (Flake f : flakes) {
      if (this != f) {
        if (dist(f.x, f.y, x, y) <= dia) {
          ret = true;
          continue;
        }
      }
    }
    return ret;
  }
}
