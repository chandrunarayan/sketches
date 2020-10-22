
Point[] scatter = new Point[1];  //declare and initialize a Point array scatter with one member                 //declare a variable of type Point
boolean firstPt = true;
float slope = 0, yint = 0, corr = 0;
String myLine = "", myCorr = "";

void setup() {
  size(600, 600);
}

void draw() {
  background(255);
  for (int i = 0; !firstPt && i < scatter.length; ++i) {
    stroke(0);
    Point pt = scatter[i];
    pt.display();
    stroke(255, 0, 0);
    if (!firstPt) {
      stroke(255, 0, 0);
      drawLine();
    }
  }
}

void drawLine() {
  float x1 = 0;
  float y1 = slope * x1 + yint;
  float x2 = 10;
  float y2 = slope * x2 + yint;

  x1 = map(x1, 0, 10, 0, width);
  y1 = map(y1, 0, 10, height, 0);
  x2 = map(x2, 0, 10, 0, width);
  y2 = map(y2, 0, 10, height, 0);

  line(x1, y1, x2, y2);
  text(myLine, 10, 10);
  text(myCorr, 10, 25);
}

void regress() {

  Point lpt;
  float sumX = 0, sumY = 0, xBar = 0, yBar = 0;
  float num = 0, den = 0, den2 = 0;
  
  int nScatter = scatter.length; 

  for (int i = 0; i < nScatter; ++i) {
    lpt = scatter[i];
    sumX += lpt.pX;
    sumY += lpt.pY;
  }
  xBar = sumX/nScatter;
  yBar = sumY/nScatter;

  for (int i = 0; i < nScatter; ++i) {
    lpt = scatter[i];
    num += (lpt.pX - xBar) * (lpt.pY - yBar);
    den += (lpt.pX - xBar) * (lpt.pX - xBar);
    den2 += (lpt.pY - yBar) * (lpt.pY - yBar);
  }

  slope = num/den;
  yint = yBar - slope * xBar;
  corr = num / (float)Math.sqrt(den * den2);

  //  System.out.println("slope =" + slope + "," + "yint =" + yint);
  if (nScatter > 1) {
    System.out.printf("line: y = %.2fx + %.2f\n", slope, yint);
    System.out.printf("corr: c = %.2f\n", corr);
    myLine = String.format("line: y = %.2fx + %.2f\n", slope, yint);
    myCorr = String.format("corr: c = %.2f\n", corr);
  }
}

void mousePressed() {
  float mapX = map(mouseX, 0, width, 0, 10);
  float mapY = map(mouseY, 0, height, 10, 0);
  //System.out.println(mapX + "," + mapY);
  Point pt = new Point(mapX, mapY);
  if (firstPt) {
    scatter[0] = pt;
    firstPt = false;
  } else {
    scatter = (Point[]) append(scatter, pt);
    regress();
  }
  //System.out.println(pt.pX + "," + pt.pY);
}

/* https://saylordotorg.github.io/text_introductory-statistics/s14-04-the-least-squares-regression-l.html */
