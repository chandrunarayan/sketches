class Rocket {
  constructor() {
    this.position = createVector(width / 2, height);
    this.acceleration = createVector();
    this.velocity = createVector();
    this.genes = [];
    for (let i = 0; i < LIFE_SPAN; i++) {
      let vel = p5.Vector.random2D();
      vel.setMag(0.15);
      this.genes.push(vel);
    }
    this.fitness = null;
    this.stop = false;
  }

  update(count) {
    if (!this.stop) {
      this.acceleration.add(this.genes[count]);

      this.velocity.add(this.acceleration);
      this.position.add(this.velocity);
      if (dist(this.position.x, this.position.y, target.x, target.y) < 10) {
        this.stop = true;
        this.fitness *= 2;
      }
      if (
        this.position.x < obstacle.x + obstacle.width / 2 &&
        this.position.x > obstacle.x - obstacle.width / 2 &&
        this.position.y < obstacle.y + obstacle.height / 2 &&
        this.position.y > obstacle.y - obstacle.height / 2
      ) {
        this.stop = true;
      }
      if (
        this.position.x >= width ||
        this.position.x <= 0 ||
        this.position.y >= height ||
        this.position.y <= 0
      ) {
        this.stop = true;
      }

      this.acceleration.mult(0);
    }
  }
  show() {
    push();
    noStroke();
    fill(255, 200);
    translate(this.position.x, this.position.y);
    rotate(this.velocity.heading());
    rectMode(CENTER);
    rect(0, 0, 50, 10);
    pop();
  }

  calculateFitness() {
    let d = dist(this.position.x, this.position.y, target.x, target.y);
    this.fitness = 1 / d;
    // if (this.stop) {
    //   this.fitness * 100;
    // }
  }
  crossOver(other) {
    let middle = Math.floor(Math.random() * this.genes.length);
    let child = new Rocket();
    for (let i = 0; i < this.genes.length; i++) {
      if (i < middle) {
        child.genes[i] = this.genes[i];
      } else {
        child.genes[i] = other.genes[i];
      }
    }
    return child;
  }

  mutate(MUTATION_RATE) {
    for (let i = 0; i < this.genes.length; i++) {
      if (Math.random() < MUTATION_RATE) {
        this.genes[i] = p5.Vector.random2D();
        this.genes[i].setMag(0.15);
      }
    }
  }
}
