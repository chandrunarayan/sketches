class Die //models one single dice cube
{
  //member variable declarations here
  int myX, myY, dieSize, faceValue;

  Die(int x, int y) //constructor
  {
    //variable initializations here
    myX = x;
    myY = y;
    dieSize = 40;
    faceValue = 0;
  }
  void roll()
  {
    faceValue  = (int)(Math.random()*6)+1;
    sum += faceValue;
  }
  void show()
  {
    square(myX, myY, dieSize);
    if (faceValue == 1) {
      fill(0);
      ellipse(myX+20, myY+20, 5, 5);
    } else if (faceValue == 2) {
      fill(0);
      ellipse(myX+12, myY+12, 5, 5);
      ellipse(myX+28, myY+28, 5, 5);
    } else if (faceValue == 3) {
      fill(0);
      ellipse(myX+10, myY+10, 5, 5);
      ellipse(myX+20, myY+20, 5, 5);
      ellipse(myX+30, myY+30, 5, 5);
    } else if (faceValue == 4) {
      fill(0);
      ellipse(myX+10, myY+10, 5, 5);
      ellipse(myX+30, myY+10, 5, 5);
      ellipse(myX+10, myY+30, 5, 5);
      ellipse(myX+30, myY+30, 5, 5);
    } else if (faceValue == 5) {
      fill(0);
      ellipse(myX+10, myY+10, 5, 5);
      ellipse(myX+30, myY+10, 5, 5);
      ellipse(myX+10, myY+30, 5, 5);
      ellipse(myX+30, myY+30, 5, 5);
      ellipse(myX+20, myY+20, 5, 5);
    } else if (faceValue == 6) {
      {
        fill(0);
        ellipse(myX+10, myY+20, 5, 5);
        ellipse(myX+30, myY+20, 5, 5);
        ellipse(myX+10, myY+30, 5, 5);
        ellipse(myX+30, myY+30, 5, 5);
        ellipse(myX+10, myY+10, 5, 5);
        ellipse(myX+30, myY+10, 5, 5);
      }
    }
  }
}
