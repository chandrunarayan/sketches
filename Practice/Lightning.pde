int startX = 0;
int startY = 200;
int endX = 0;
int endY = 200;

void setup() {
  size(400 , 400);
  background(1, 1, 1);
  strokeWeight(5);
}
void draw() {
  int R = (int)(Math.random()*256);
  int G = (int)(Math.random()*256);
  int B = (int)(Math.random()*256);
  stroke(R, G, B);

  while (endY < height) {
    endX = startX + (int)(Math.random()*10);
    endY = startY + (int)(Math.random()*18-9);
    line(startY, startX, endY, endX);
    startX = endX;
    startY = endY;
  }
}

void keyPressed() {
  if (key == 'c') {
    clear();
  }
  if (key == ' ') {
    startX = 0;
    startY = 200;
    endX = 0;
    endY = 200;
  }
}
