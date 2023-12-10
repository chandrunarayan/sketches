//Bubble[] bubs;
ArrayList <Bubble> bubs;
Bubble aBub;
int nob = 20;
float minSz = 30;
float maxSz = 40;
float spFact = 0.001;
float filtLoc = +100;

void setup() {
  size(300, 800);
  bubs = new ArrayList <Bubble> ();
}

void draw() {
  background(255);
  stroke(0);
  line(0, filtLoc, width, filtLoc);
  textSize(20);
  fill(0);
  text("live bubbles: " + bubs.size(), 70, 30);
  noFill();
  noStroke();
  for (int i=0; i<bubs.size(); i++) {
    bubs.get(i).move();
    bubs.get(i).show();
    bubs.get(i).mark_hits(bubs);
  }
  remove_hits();
}

void remove_hits() {
  for (int i = 0; i < bubs.size(); i++) {
    Bubble aBub = bubs.get(i);
    if (aBub.hit) {
      bubs.remove(i);
    }
  }
}

void mousePressed() {
  for (int i=0; i<nob; i++) {
    float xloc = (float) Math.random()*width;
    float yloc = (float) Math.random()*height + filtLoc;
    aBub = new Bubble(xloc, yloc);
    bubs.add(aBub);
  }
}
