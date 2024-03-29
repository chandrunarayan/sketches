// Adapted by Chandru Narayan
// For the Bush School CPJava Final Project
// Fall 2021 - Spring 2022

// Credits:
// The Nature of Code
// Daniel Shiffman
//

// Pathfinding Flowfield w/ Genetic Algorithms

// This example produces an obstacle course with a start and finish
// Virtual "creatures" are rewarded for making it closer to the finish

// Each creature's DNA is a "flowfield" of PVectors that
// determine steering vectors for each cell on the screen

import java.awt.Rectangle;

int gridscale = 10;              // Scale of grid is 1/24 of screen size

// DNA needs one vector for every spot on the grid 
// (it's like a pixel array, but with vectors instead of colors)
int dnasize;

int lifetime;  // How long should each generation live


Population population;  // Population
int lifecycle;          // Timer for cycle of generation
int recordtime;         // Fastest time to target
int winCount;           // Creatures reaching target
Obstacle target;        // Target position
Obstacle start;         // Start position
int diam = 24;          // Size of target

ArrayList<Obstacle> obstacles;  //an array list to keep track of all the obstacles!

boolean debug = false;

Rectangle newObstacle = null;

void setup() {
  size(640,360);
  dnasize = (width / gridscale) * (height / gridscale); 
  lifetime = width/3;

  // Initialize variables
  lifecycle = 0;
  recordtime = lifetime;
  target = new Obstacle(width-4*diam,height/2-diam/2,diam,diam);
  start = new Obstacle(diam/2,height/2-diam/2,diam,diam);

  // Create a population with a mutation rate, and population max
  int popmax = 1000;
  float mutationRate = 0.005;
  population = new Population(mutationRate,popmax);

  // Create the obstacle course  
  obstacles = new ArrayList<Obstacle>();
  
///*  
  obstacles.add(new Obstacle(width/4,80,10,height-160));
  obstacles.add(new Obstacle(width/2,0,10,height/2-20));
  obstacles.add(new Obstacle(width/2,height-height/2+20,10,height/2-20));
  obstacles.add(new Obstacle(2*width/3,height/2-height/8,10,height/4));
//*/ 
}

void draw() {
  background(255);

 // Draw the target positions
 target.displayTarget();
  
  // Draw the obstacles
  for (Obstacle obs : obstacles) {
    obs.displayObstacle();
  }

 
  // If the generation hasn't ended yet
  if (lifecycle < lifetime) {
    population.live(obstacles);
    if ((population.targetReached()) && (lifecycle < recordtime)) {
      recordtime = lifecycle;
    }
    lifecycle++;
  // Otherwise a new generation
  } else {
    lifecycle = 0;
    population.calcFitness();
    population.naturalSelection();
    population.generate();
  }

   // Display some info
   textAlign(RIGHT);
   fill(0);
   text("Generation #: " + population.getGenerations(),width-10,18);
   text("Lifetime remaining in cycles: " + ((lifetime-lifecycle)),width-10,36);
   text("Closest approach to target: " + population.shortestDist,width-10,54);
   text("Winning Rockets: " + population.winCount,width-10,72);
   text("Earliest Generation to Win: " + population.earliestGen,width-10,90);
   text("Fastest winning time in cycles: " + (population.earliestGen > 0 ? recordtime : 0),width-10,108);
   
   if (newObstacle != null) {
     rect(newObstacle.x,newObstacle.y,newObstacle.width,newObstacle.height); 
   }
   
}

void keyPressed() {
  if (key == 'd') {
    debug = !debug; 
  }
}

void mousePressed() {
  newObstacle = new Rectangle(mouseX,mouseY,0,0);
}

void mouseDragged() {
  newObstacle.width = mouseX-newObstacle.x; 
  newObstacle.height = mouseY-newObstacle.y; 
}

void mouseReleased() {
  obstacles.add(new Obstacle(newObstacle));
  newObstacle = null;
  lifetime = width/3;
  recordtime = lifetime;  
  lifecycle = 0;  
  population.winCount = 0;
  population.generations = 0;
  population.earliestGen = 0;
  population.shortestDist = width;
  population.targetMet = false;
}
