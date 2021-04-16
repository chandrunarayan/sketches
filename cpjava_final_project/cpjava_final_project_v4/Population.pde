// Adapted by Chandru Narayan
// For the Bush School CPJava Final Project
// Fall 2020 - Spring 2021

// Credits:
// The Nature of Code
// Daniel Shiffman
//

// Genetic Algorithm, Evolving alphabots!

// Demonstration of using a genetic algorithm to type out a phrase

// A class to describe a population of virtual organisms
// In this case, each organism is an Alphabot

class Population {

  float mutationRate;           // Mutation rate
  Alphabot[] population;             // Array to hold the current population
  ArrayList<Alphabot> matingPool;    // ArrayList which we will use for our "mating pool"
  String target;                // Target phrase
  String bestBotPhrase;           // Best Alphabot Phrase for each population
  String bestBotColor;         // Bot Color of Best Alphabot
  int generations;              // Number of generations
  boolean finished;             // Are we finished evolving?
  boolean running;              // sketch is running or paused?
  int perfectScore;
  int totColor1, totColor2, totColor3;

  Population(String p, float m, int num) {
    target = p;
    mutationRate = m;
    population = new Alphabot[num];
    for (int i = 0; i < population.length; i++) {
      population[i] = new Alphabot(target);
    }
    matingPool = new ArrayList<Alphabot>();
    finished = false;
    generations = 0;
    
    perfectScore = 1;
    getBest();
  }

  // Generate a mating pool
  void naturalSelection() {
    // Clear the ArrayList
    matingPool.clear();

    float maxFitness = 0;
    for (int i = 0; i < population.length; i++) {
      if (population[i].fitness > maxFitness) {
        maxFitness = population[i].fitness;
      }
    }

    // Based on fitness, each member will get added to the mating pool a certain number of times
    // a higher fitness = more entries to mating pool = more likely to be picked as a parent
    // a lower fitness = fewer entries to mating pool = less likely to be picked as a parent
    for (int i = 0; i < population.length; i++) {
      
      float fitness = map(population[i].fitness,0,maxFitness,0,1);
      int n = int(fitness * 100);      // Arbitrary multiplier, we can also use monte carlo method
      for (int j = 0; j < n; j++) {    // and pick two random numbers
        matingPool.add(population[i]);
      }
    }
  }

  // Create a new generation
  void generate() {
    // Refill the population with children from the mating pool
    for (int i = 0; i < population.length; i++) {
      int a = int(random(matingPool.size()));
      int b = int(random(matingPool.size()));
      Alphabot partnerA = matingPool.get(a);
      Alphabot partnerB = matingPool.get(b);
      Alphabot child = partnerA.crossover(partnerB);
      child.dna.mutate(mutationRate);
      child.updatePhrase();
      child.updateFitness();
      population[i] = child;
    }
    getBest();
    generations++;
  }
  
  // Compute the current "most fit" member of the population
  void getBest() {
    float worldrecord = 0.0;
    int index = 0;
    for (int i = 0; i < population.length; i++) {
      
      if (population[i].botColor.equals(botColors[0])) totColor1++;
      else if (population[i].botColor.equals(botColors[1])) totColor2++;
      else totColor3++;
      
      if (population[i].fitness > worldrecord) {
        index = i;
        worldrecord = population[i].fitness;
      }
    }
    
    if (worldrecord == perfectScore ) finished = true;
    bestBotPhrase = population[index].getPhrase();
    bestBotColor = population[index].botColor;
  }

  boolean finished() {
    return finished;
  }

  int getGenerations() {
    return generations;
  }

  // Compute average fitness for the population
  float getAverageFitness() {
    float total = 0;
    for (int i = 0; i < population.length; i++) {
      total += population[i].fitness;
    }
    return total / (population.length);
  }

  String allPhrases() {
    String everything = "";
    
    int displayLimit = min(population.length,50);
    
    
    for (int i = 0; i < displayLimit; i++) {
      everything += population[i].getPhrase() + "\n";
    }
    return everything;
  }
}
