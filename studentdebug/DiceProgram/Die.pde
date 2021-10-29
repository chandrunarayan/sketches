class Die //models one single dice cube
{
  int myX, myY;
  int face;

  Die(int x, int y) //constructor
  {
    myX = x;
    myY = y;
    //roll();
  }
  void roll()
  {
    face = (int) (Math.random()*6)+1;
    total += face;
  }
  void show()
  {
    int dotSize = 7;
    rect (myX, myY, 50, 50);
    fill(0, 0, 0);
    if (face == 1 || face == 3 || face == 5) {
      ellipse(myX+25, myY+25, dotSize, dotSize);
    }
    if (face == 4 || face == 5 || face == 6) {
      ellipse(myX+10, myY+10, dotSize, dotSize);
      ellipse(myX+10, myY+40, dotSize, dotSize);
      ellipse(myX+40, myY+40, dotSize, dotSize);
      ellipse(myX+40, myY+10, dotSize, dotSize);
    }
    if (face == 2 || face == 3 || face == 6) {
      ellipse(myX+10, myY+10, dotSize, dotSize);
      ellipse(myX+40, myY+40, dotSize, dotSize);
    }
    if (face == 6) {
      ellipse(myX+25, myY+10, dotSize, dotSize);
      ellipse(myX+25, myY+40, dotSize, dotSize);
    }
    fill(255, 255, 255);
    text(face, 100, 100);
  }
}
