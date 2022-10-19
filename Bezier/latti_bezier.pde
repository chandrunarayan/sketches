int nrows=8;
int ncols= 8;
float yl;
float xl;
void setup() {
  size(1000, 1000);  //feel free to change the size
  noLoop(); //stops the draw() function from repeating
  yl =height/nrows;
  xl= width/ncols;
}
void draw() {
  background(0,0,0);
  noFill();
  float xa=0;
  float ya=0;
  for (int row=0; row<nrows; row++) {
    for (int col=0; col<ncols; col++) {
      scale((int) xa, (int)ya);
      //xa=col * xl +xl;
      //ya=row * yl +yl;
      xa+=xl;
      System.out.println(""+xa+" "+ya);
    }
    xa=0;
    ya+=yl;
  }
  //scale (250, 250);
  //your code here
}



void scale(int x, int y) {
  stroke(255, 102, 0);
  line(x, y, x+xl-(.10*xl), y+(.20*yl));
  line(x+ (.10*xl), y+(.90*yl), x+xl, y+yl);
  stroke(250, 90, 60);
  bezier(x+xl-(.10*xl), y+(.20*yl), x+(.25*xl), y+(.25*yl), x+(.75*xl), y+(.75*yl), x+ (.10*xl), y+(.90*yl));

  //your code here
}
