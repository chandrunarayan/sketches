class Ball {
  double posx, posy;
  double radius;
  double velx, vely;
  double gravity = 0.05;

  Ball(float x, float y, float r) {
    posx = x;
    posy = y;
    radius = r;
    velx = .5;
    vely = 0;
  }
  void move() {
    // move ball
    // gravity
    vely = vely + gravity;


    posx = posx + velx;
    posy = posy + vely;
  }
  void checkWallsCollision() {
    // check top and the two side walls only
    // reverse direction if collide
    if (posx > Cfg.pWidth - radius) {
      posx = Cfg.pWidth - radius;
      velx = -0.8*velx;
    }
    if (posx < radius) {
      posx = radius;
      // changes direction + damping: velocity reduces by 20%.
      velx = -0.8*velx;
    }
  }
  void checkInclineCollision(TerrainSeg g) {
    // check incline collision and reverse direction 

    // (dx, dy) is relative position of ball with respect to (gx,gy)
    double dx = posx - g.mid.x;
    double dy = posy - g.mid.y;


    // compute cosine, sine of rot angle.
    double cosine = Math.cos(g.rot);
    double sine = Math.sin(g.rot);


    // rotate (dx,dy) to new coordinate (dx_,dy_)
    // rotate (velx, vely) to (velx_,vely_)
    // see lecture video for the formulas
    double dx_ = cosine * dx + sine * dy;
    double dy_ = cosine * dy - sine * dx;
    double velx_ = cosine * velx + sine * vely;
    double vely_ = -sine * velx + cosine * vely ;


    // once rotated, it is easy to see when to bounce
    // and how to bounce(negate vertical velocity in rotated coordinate)
    if (dy_ > -radius && posx > g.beg.x && posx < g.end.x) {
      dy_ = -radius;
      vely_ = -0.6*vely_;
    }

    // rotate everything back to restore the original 
    // coordinate axis.
    dx = cosine * dx_ - sine * dy_;
    dy = cosine * dy_ + sine * dx_;
    velx = cosine * velx_ - sine * vely_;
    vely = cosine * vely_ + sine * velx_;
    posx = g.mid.x + dx;
    posy = g.mid.y + dy;
  }
}
