int sum;

void setup()
{
  size(300, 300);
  noLoop();
}
void draw()
{
  background(59, 139, 237);
  sum = 0;
  for (int x = 25; x <= 300; x+=100) {
    for (int y = 25; y <= 300; y+=100) {
      Die godfather = new Die(x, y);
      godfather.roll();
      godfather.show();
    }
  }
  //fill(255,255,255);
  text("Total: " + sum, 120, 285);
}
void mousePressed()
{
  redraw();
}
