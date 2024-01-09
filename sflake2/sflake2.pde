float dia = 8;
float spd = 3;
float spread = 6;
int spokes = 6;
Flake cur;  //current flake
ArrayList<Flake> flakes;

void setup() {
  size(800, 800);
  flakes = new ArrayList<Flake> ();
  createAddFlake();
}

void draw() {
  boolean aggregate = false;
  translate(width/2, height/2);
  background(0);

  while (!cur.stopped() && !cur.collided()) {
    cur.move();
    aggregate = true;
  }
  
  showFlakes();

  createAddFlake();
  saveFrame("frames/####.tif");
    
  if (!aggregate) {
    //saveFrame("frames/####.tif");
    flakes.clear();
  }
}

void showFlakes() {
  for (int i = 0; i < spokes; i++) {
    rotate(PI/(spokes/2));
    pushMatrix();
    for (Flake f : flakes) {
      f.show();
    }
    scale(1, -1);
    for (Flake f : flakes) {
      f.show();
    }    
    popMatrix();
  }
}

void createAddFlake() {
  cur = new Flake(width/2-dia, 0);
  flakes.add(cur);
}
