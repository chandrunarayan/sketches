void setup()
{
  noLoop();
  size(300, 300);

}
void draw()
{
  background(59, 139, 237);
  int sum = 0;
  for (int x = 25; x <= 300; x+=100) {
    for (int y = 25; y <= 300; y+=100) {
      fill(255);
      Die godfather;
      godfather = new Die(x, y);
      godfather.roll();
      godfather.show();
      sum = sum + godfather.faceValue;
    }
  }
  text("Total: " + sum, 120, 285);
}
void mousePressed()
{
  redraw();
}
