public class Point {
  float pX;
  float pY;

  public Point(float x_, float y_) {
    pX = x_;
    pY = y_;
  }

  void display() {
    float mapX = map(this.pX, 0, 10, 0, width);
    float mapY = map(this.pY, 0, 10, height, 0);
    noStroke();
    fill(0);
    ellipse(mapX, mapY, 8, 8);
    stroke(255, 0, 0);
  }
}
