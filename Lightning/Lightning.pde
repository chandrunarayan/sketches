float x, y, prevX, prevY;
float inc = 3;
float r, g, b, a;

void setup() {
  size(400, 600);
  x = width/2;
  y = 0;
  r = (int)(Math.random()*256);
  g = (int)(Math.random()*256);
  b = (int)(Math.random()*256);
  a = (int)(Math.random()*256);
}

void draw() {
}

void create_lightning() {
  //background(255);
  stroke(r, g, b, a);
  while (y<600) {

    prevX = x;
    prevY = y;

    x += inc*((int)(Math.random()*11)-5);
    y += inc*(int)(Math.random()*8);
    line(prevX, prevY, x, y);
    fill(125, 200, 0, 200);
  }
}

void changeColor() {
  r = (int)(Math.random()*256);
  g = (int)(Math.random()*256);
  b = (int)(Math.random()*256);
  a = (int)(Math.random()*256);
}
void mousePressed() {
  changeColor();
  create_lightning();
  setup();
}