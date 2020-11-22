// Boids orient in the direction of movement
// Boids move towards a point where mouse is pressed
// Ability to show Velocity vectors as a line
// Hot 'r' to reset

int numBoid = 50;
int ptSize = 20;
float maxLife = 200000;
float topSpeed = 3.0;
float accelMag = 0.1;

Boid [] boids = new Boid[numBoid];

void setup() {
  size(800, 600);
  for (int i=0; i<boids.length; i++) {
    //boids[i] = new Boid(width/2, height/2, ptSize);
    boids[i] = new Boid();
  }
}

void draw() {
  background(255);
  for (int i=0; i<boids.length; i++) {
    boids[i].checkBorders();
    boids[i].showBoid();
    boids[i].update();
  }
}
