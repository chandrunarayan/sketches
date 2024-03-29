// Adapted by Chandru Narayan
// For the Bush School CPJava Final Project
// Fall 2021 - Spring 2022

// Credits:
// The Nature of Code
// Daniel Shiffman
//

// Pathfinding Flowfield w/ Genetic Algorithms

// A class to describe a population of "creatures"

class Population {

  float mutationRate;          // Mutation rate
  Rocket[] population;         // Array to hold the current population
  ArrayList<Rocket> darwin;    // ArrayList which we will use for our "mating pool"
  int generations;             // Number of generations
  int winCount;                // Track number of creatures reaching target
  int order;                   // Keep track of the order of creature's finishing the maze
  int earliestGen;             // First generation to reach target
  int shortestDist;            // Shortest distance approached to Target for all populations
  boolean targetMet;           // True and remains true when target has been reached the first time



  // Initialize the population
  Population(float m, int num) {
    mutationRate = m;
    population = new Rocket[num];
    darwin = new ArrayList<Rocket>();
    generations = 0;
    earliestGen = 0;
    shortestDist = width;
    targetMet = false;
    //make a new set of creatures
    for (int i = 0; i < population.length; i++) {
      PVector position = new PVector(start.r.x+start.r.width/2, start.r.y+start.r.height/2);
      population[i] = new Rocket(position, new DNA(dnasize));
    }
    order = 1;  // The first one to finish will be #1
    winCount = 0;
  }

  void live (ArrayList<Obstacle> o) {
    // For every creature



    float record = 100000;
    int closest = 0;

    for (int i = 0; i < population.length; i++) {
      // If it finishes, mark it down as done!
      if ((population[i].finished())) {
        if (!targetMet) earliestGen = generations;
        targetMet = true;
        population[i].setFinish(order);
        order++;
      }
      // Run it
      population[i].run(o);

      if (population[i].recordDist < record) {// && !population[i].dead) {
        record = population[i].recordDist;
        closest = i;
      }
    }

    //population[closest].highlight();
    // Drawing one example of the DNA
    if (debug) {
      population[closest].dna.debugDraw();
    }
  }

  // Did anything finish?
  boolean targetReached() {
    boolean result = false;
    for (int i = 0; i < population.length; i++) {
      if (population[i].recordDist < shortestDist) shortestDist = (int)population[i].recordDist;
      if (population[i].finished()) {
        winCount++;
        result = true;
        break;
      }
    }
    return result;
  }

  // Calculate fitness for each creature
  void calcFitness() {
    for (int i = 0; i < population.length; i++) {
      population[i].calcFitness();
    }
    order = 1;  // Hmmm, awkward place for this, we have to reset this for the next generation
  }

  // Generate a mating pool
  void naturalSelection() {
    // Clear the ArrayList
    darwin.clear();

    // Calculate total fitness of whole population
    float totalFitness = getTotalFitness();
    float avgFitness = totalFitness/population.length;

    // Calculate normalized fitness for each member of the population
    // Based on normalized fitness, each member will get added to the mating pool a certain number of times a la roulette wheel
    // A higher fitness = more entries to mating pool = more likely to be picked as a parent
    // A lower fitness = fewer entries to mating pool = less likely to be picked as a parent
    int count = 0;
    for (int i = 0; i < population.length; i++) {
      float fitness = population[i].getFitness();
      if (fitness > avgFitness) {
        count++;
        float fitnessNormal = fitness / totalFitness;
        int n = (int) (fitnessNormal * 50000);  // Arbitrary multiplier, consider mapping fix
        for (int j = 0; j < n; j++) {
          darwin.add(population[i]);
        }
      }
    }
    //println("Total: " + count + " " + population.length);
  }

  // Making the next generation
  void generate() {
    // Refill the population with children from the mating pool
    for (int i = 0; i < population.length; i++) {
      int m = int(random(darwin.size()));
      int d = int(random(darwin.size()));
      // Pick two parents
      Rocket mom = darwin.get(m);
      Rocket dad = darwin.get(d);
      // Get their genes
      DNA momgenes = mom.getDNA();
      DNA dadgenes = dad.getDNA();
      // Mate their genes
      DNA child = momgenes.crossover(dadgenes);
      // Mutate their genes
      child.mutate(mutationRate);
      // Fill the new population with the new child
      PVector position = new PVector(start.r.x+start.r.width/2, start.r.y+start.r.height/2);
      population[i] = new Rocket(position, child);
    }
    //winCount = 0;
    generations++;
  }

  int getGenerations() {
    return generations;
  }

  //compute total fitness for the population
  float getTotalFitness() {
    float total = 0;
    for (int i = 0; i < population.length; i++) {
      total += population[i].getFitness();
    }
    return total;
  }
}
