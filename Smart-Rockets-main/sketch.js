let POPULATION_SIZE = 500;
let LIFE_SPAN = 500;
let count = 0;
let population;
let resetBtn;
let target;
let obstacle;
let population_slider;
let lifespan_slider;
let generation;
let speed;
let MUTATION_RATE = 0.01;

function setup() {
  generation = 1;
  resetBtn = createButton("Reset");
  resetBtn.parent(select("#reset-btn"));
  population_slider = createSlider(1, 500, 250);
  lifespan_slider = createSlider(1, 1000, 500);
  population_slider.parent(select("#population-size"));
  lifespan_slider.parent(select("#lifespan-control"));
  resetBtn.elt.onclick = reset;
  speed = createSlider(1, 10, 1);
  speed.parent(select("#speed"));
  let cnv = createCanvas(min(window.innerWidth * 0.9, 500), 500);
  population = new Population();
  cnv.parent(select("#canvas"));
  target = createVector(width / 2, 50);
  obstacle = {
    x: width / 2,
    y: height / 2 + 100,
    width: width / 2,
    height: 20,
  };
}

function reset() {
  population = new Population();
  count = 0;
  generation = 1;
  lifespan_slider.value(500);
  speed.value(1);
}

function draw() {
  background(0);
  POPULATION_SIZE = population_slider.value();
  LIFE_SPAN = lifespan_slider.value();

  for (let i = 0; i < speed.value(); i++) {
    population.run(count);
    count++;
    if (count >= LIFE_SPAN) {
      count = 0;
      population.calculateFitness();
      // population.normalize();
      population.reproduce();
    }

    select("#lifespan").html(count);
    select("#generation").html(generation);
    rectMode(CENTER);
    fill(255, 0, 0);
    ellipse(target.x, target.y, 20, 20);
    fill(255);
    rect(obstacle.x, obstacle.y, obstacle.width, obstacle.height);
  }
}
