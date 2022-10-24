//I'm not sure why this isnt working. Everything seems right.

void setup() {
  size(500, 300);
  textAlign(CENTER);
  noLoop();
}
void draw() {
  for (int x =  50; x  < 500; x = x +60) {
    Coin Bob = new Coin(50, 150);
    bob.show();
  }
}

class Coin {

  boolean heads;
  int myX, myY;

  Coin(int x, int y) {
    flip();
    myX = x;
    myY = y;
  }
  void flip() {
    if (Math.random() < .5)
    {
      heads = true;
    } else
    {
      heads = false;
    }
  }
  void show() {
    noStroke();
    fill(255);
    ellipse(myX, myY, 50, 50);
    fill(0);
    if (heads == true)
    {
      text("heads", myX, myY);
    } else
    {
      text("tails", myX, myY);
    }
  }
