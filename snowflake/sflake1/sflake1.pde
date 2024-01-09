float dia = 10;
float spd = 3;
Flake cur;  //current flake
ArrayList<Flake> flakes;

void setup() {
  size(200, 200);
  flakes = new ArrayList<Flake> ();
  createAddFlake();
}

void draw() {
  background(0);

  if (!cur.stopped() && !cur.collided()) {
    cur.move();
  } else {
    createAddFlake();
  }

  showFlakes();
}

void showFlakes() {
  for (Flake f : flakes) {
    f.show();
  }
}

void createAddFlake() {
  cur = new Flake(width+dia, (float)height/2);
  flakes.add(cur);
}
