//I don't know what is wrong with the base coin code, but I think that this should output heads 85% of the time.

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
    if (Math.random() > .15)
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
