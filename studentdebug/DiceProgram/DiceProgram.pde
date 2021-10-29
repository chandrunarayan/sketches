Die greg;
void setup()
{
  size (750, 750);
  noLoop();
  greg=new Die(180, 180);
}
void draw()
{
  background(111, 221, 224);
  greg.roll();
  greg.show();
 // text(dotSum,350, 600);
}
void mousePressed()
{
  redraw();
}
class Die
{
  int myX, myY, mySize, myValue, x, y, totalSum;
  Die(int x, int y)
  {
    myX=x;
    myY=y;
  }

  Die(int x, int y, int s) {
    mySize=s;
  }

  void roll()
  {
  }
  void show()
  {
    for (int y = 100; y <= 500; y +=100 )
    {
      for (int x = 100; x <= 500; x +=100)
      {

        fill (252,93,0); 
        rect(x, y, 50, 50); 
        myValue=((int)(Math.random()*6+1));
        {
          if (myValue==1) {
            fill (1, 1, 1); 
            ellipse (x+25, y+25, 10, 10);
            totalSum+=1;
          } else if (myValue==2) {
            fill (1, 1, 1); 
            ellipse (x+20, y+25, 10, 10); 
            ellipse (x+30, y+25, 10, 10);
            totalSum+=2;
          } else if (myValue==3) {
            fill (1, 1, 1); 
            ellipse (x+15, y+25, 10, 10); 
            ellipse (x+25, y+25, 10, 10); 
            ellipse (x+35, y+25, 10, 10);
            totalSum+=3;
          } else if (myValue==4) {
            fill (1, 1, 1); 
            ellipse (x+20, y+20, 10, 10); 
            ellipse (x+30, y+20, 10, 10); 
            ellipse (x+20, y+30, 10, 10); 
            ellipse (x+30, y+30, 10, 10);
            totalSum+=4;
          } else if (myValue==5) {
            fill (1, 1, 1); 
            ellipse (x+20, y+15, 10, 10); 
            ellipse (x+30, y+15, 10, 10); 
            ellipse (x+25, y+25, 10, 10); 
            ellipse (x+20, y+35, 10, 10); 
            ellipse (x+30, y+35, 10, 10);
            totalSum+=5;
          } else if (myValue==6) {
            fill (1, 1, 1); 
            ellipse (x+15, y+20, 10, 10); 
            ellipse (x+25, y+20, 10, 10); 
            ellipse (x+35, y+20, 10, 10); 
            ellipse (x+15, y+30, 10, 10); 
            ellipse (x+25, y+30, 10, 10); 
            ellipse (x+35, y+30, 10, 10);
            totalSum+=6;
          }
        }
      }
    }
    {
    text(totalSum+ "  total roll", 350, 600);
    }
  }
}
