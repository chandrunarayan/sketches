int total;

void setup()
{
  size(525,600);
  noLoop();
}
void draw()
{
  background(0,0,0);
  total = 0;
  for (int y = 25; y < 500; y +=60){
    for (int x = 25; x < 500; x +=60){
      Die newDice = new Die(x,y);
      newDice.roll();
      newDice.show();
    }
  }
  fill(255,255,255);
  text("Your scored " + total + " points!", 200, 550);
}
void mousePressed()
{
  redraw();
}
