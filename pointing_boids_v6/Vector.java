//
// Created by Chandru Narayan
// for Bush School CPJava course
// Fall 2020
//
// A Vector Java class library.
// Used as a learning tool
// Closely follows the Processing PVector
// Except it is implemented in pure Java 
// such that private, protected keywords
// may be used
//

class Vector {
  double x, y;

  Vector() {
    x = 0.0;
    y = 0.0;
  }
  
  Vector(double x_, double y_) {
    x = x_;
    y = y_;
  }

  void add(Vector v_) {
    x += v_.x;
    y += v_.y;
  }

  //static method add  
  static Vector add(Vector v1_, Vector v2_) {
    Vector v3_ = new Vector(v1_.x + v2_.x, v1_.y + v2_.y);
    return v3_;
  }

  void sub(Vector v_) {
    x -= v_.x;
    y -= v_.y;
  }
  
  //static method mid
  static Vector mid(Vector v1_, Vector v2_) {
    Vector v3_ = new Vector((v1_.x + v2_.x)/2, (v1_.y + v2_.y)/2);
    return v3_;
  }

  //static method dist
  static double dist(Vector v1_, Vector v2_) {
    double d_ = Math.sqrt((v1_.x - v2_.x)*(v1_.x - v2_.x) + (v1_.y - v2_.y)*(v1_.y - v2_.y));
    return d_;
  }

  //static method sub
  static Vector sub(Vector v1_, Vector v2_) {
    Vector v3_ = new Vector(v1_.x - v2_.x, v1_.y - v2_.y);
    return v3_;
  }

  void mult(double s_) {
    x *= s_;
    y *= s_;
  }

  //static method mult
  static Vector mult(Vector v_, double s_) {
    Vector vr_ = new Vector(v_.x * s_, v_.y * s_);
    return vr_;
  }

  void div(double s_) {
    if (s_ != 0.0) {
      x /= s_;
      y /= s_;
    }
  }

  //static method div
  static Vector div(Vector v_, double s_) {
    Vector vr_ = new Vector(v_.x, v_.y);
    if (s_ != 0.0) {
      vr_.x /= s_;
      vr_.y /= s_;
    }
    return vr_;
  }

  double getMag() {
    return (double)(Math.sqrt(x*x + y*y));
  }

  void setMag(double s) {
    normalize();
    mult(s);
  }

  void normalize() {
    double m = getMag();
    if (m != 0) {
      div(m);
    }
  }

  void limit(double l) {
    double m = getMag();
    if (m > l) {
      setMag(l);
    }
  }  
  //static function angle between 2 vectors
  static double angleBetween(Vector v1_,Vector v2_) {
    return (double)(Math.atan2((v2_.y-v1_.y),(v2_.x-v1_.x)));
  }
  
  double angle(Vector v_) {
    return (double)(Math.atan2(v_.y, v_.x));
  }
 
  //static method cloneVector
  static Vector cloneVector(Vector v_) {
    Vector vr_ = new Vector(v_.x, v_.y);
    return vr_;
  }

  //static method clone Vector of a given size
  static Vector cloneVectorWithSize(Vector v_, double s_) {
    Vector vr_ = new Vector(v_.x, v_.y);
    vr_.setMag(s_);
    return vr_;
  }

  //Static method to clone vector from the tip of another
  static Vector buildVectorFromRoot(Vector v_, double x_, double y_) {
    return new Vector(x_ - v_.x, y_ - v_.y);
  }
 
  //static method randVec returns a Vector with x and y 
  //in range 0 to 0.999
  static Vector randVec() {
    double vx_ = (double)((Math.random()*(int)(Math.random()*3)-1));
    double vy_ = (double)((Math.random()*(int)(Math.random()*3)-1));   
    Vector v_ = new Vector(vx_, vy_);
    return v_;
  }

  //static method randVec returns a Vector with x and y 
  //in range -1.0 to 0.999 scaled by arg
  static Vector randVec(double s_) {
    Vector v_ = Vector.randVec();
    v_.setMag(s_);
    return v_;
  }

  //static method randVal returns a double in range 0 to 0.999
  static double randVal() {
    double v_ = (double)(Math.random());
    return v_;
  }

  //static method randVal returns a double in range 0 to 0.999 scaled by arg
  static double randVal(double s_) {
    double v_ = (double)(Math.random()*s_);
    return v_;
  }
}
