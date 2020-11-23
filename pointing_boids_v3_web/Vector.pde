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
  float x, y;

  Vector(float x_, float y_) {
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

  //static method sub
  static Vector sub(Vector v1_, Vector v2_) {
    Vector v3_ = new Vector(v1_.x - v2_.x, v1_.y - v2_.y);
    return v3_;
  }

  void mul(float s_) {
    x *= s_;
    y *= s_;
  }

  //static method mul
  static Vector mul(Vector v_, float s_) {
    Vector vr_ = new Vector(v_.x * s_, v_.y * s_);
    return vr_;
  }

  void div(float s_) {
    if (s_ != 0.0) {
      x /= s_;
      y /= s_;
    }
  }

  //static method div
  static Vector div(Vector v_, float s_) {
    Vector vr_ = new Vector(v_.x, v_.y);
    if (s_ != 0.0) {
      vr_.x /= s_;
      vr_.y /= s_;
    }
    return vr_;
  }

  float getMag() {
    return (float) Math.sqrt(x*x + y*y);
  }

  void setMag(float s) {
    norm();
    mul(s);
  }

  void norm() {
    float m = getMag();
    if (m != 0) {
      div(m);
    }
  }

  void limit(float l) {
    float m = getMag();
    if (m > l) {
      setMag(l);
    }
  }  

  float angle(Vector v_) {
    return (float)(Math.atan2(v_.y, v_.x));
  }

  //static method randVec returns a Vector with x and y 
  //in range -1.0 to 0.999
  static Vector randVec() {
    float vx_ = (float)(((int)(Math.random()*3)-1)*Math.random());
    float vy_ = (float)(((int)(Math.random()*3)-1)*Math.random());
    Vector v_ = new Vector(vx_, vy_);
    return v_;
  }

  //static method randVec returns a Vector with x and y 
  //in range -1.0 to 0.999 scaled by arg
  static Vector randVec(float s_) {
    float vx_ = (float)(((int)(Math.random()*3)-1)*Math.random());
    float vy_ = (float)(((int)(Math.random()*3)-1)*Math.random());
    Vector v_ = new Vector(vx_, vy_);
    v_.setMag(s_);
    return v_;
  }

  //static method randVal returns a float in range 0 to 0.999
  static float randVal() {
    float v_ = (float)Math.random();
    return v_;
  }

  //static method randVal returns a float in range 0 to 0.999 scaled by arg
  static float randVal(float s_) {
    float v_ = (float)(Math.random()*s_);
    return v_;
  }
}
