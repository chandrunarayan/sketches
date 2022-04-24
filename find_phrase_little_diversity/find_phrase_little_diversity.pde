// Lesson plan Chandru Narayan
// For the Bush School CPJava Final Project
// Fall 2020 - Spring 2021

// Genetic Algorithm, Evolving Monkeys

// Demonstration of using a genetic algorithm to type out a phrase

// setup()
//  # Step 1: The Population 
//    # Create an empty population (an array or ArrayList)
//    # Fill it with DNA encoded objects (pick random values to start)

// draw()
//  # Step 1: Selection 
//    # Create an empty mating pool (an empty ArrayList)
//    # For every member of the population, evaluate its fitness based on some criteria / function, 
//      and add it to the mating pool in a manner consistant with its fitness, i.e. the more fit it 
//      is the more times it appears in the mating pool, in order to be more likely picked for reproduction.

//  # Step 2: Reproduction Create a new empty population
//    # Fill the new population by executing the following steps:
//       1. Pick two "parent" objects from the mating pool.
//       2. Crossover -- create a "child" object by mating these two parents.
//       3. Mutation -- mutate the child's DNA based on a given probability.
//       4. Add the child object to the new population.
//    # Replace the old population with the new population
//  
//   # Rinse and repeat

PFont f;
int popmax = 5000;
float mutationRate = 0.001;
float diversity = 0.01;
Population population;
//String target = "To be, or not to be, that is the question!";
//String target = "We all come in different ships, but we're in the same boat now - Dr. ML King";
String target = "Alone we can do so little; together we can do so much.";

void setup() {
  size(1800, 360);
  f = createFont("Courier", 16, true);
  popmax = 5000;
  mutationRate = 0.001;
  
  // Create a populationation with a target phrase, mutation rate, and populationation max
  population = new Population(target, mutationRate, popmax, diversity);
}

void draw() {
  // Generate mating pool
  population.naturalSelection();
  //Create next generation
  population.generate();
  // Calculate fitness
  population.calcFitness();
  displayInfo();

  // If we found the target phrase, stop
  if (population.finished()) {
    println(millis()/1000.0);
    noLoop();
  }
}

void displayInfo() {
  background(255);
  // Display current status of populationation
  String answer = population.getBest();
  textFont(f);
  textAlign(LEFT);
  fill(0);
  
  
  textSize(24);
  text("Best phrase:",20,30);
  textSize(40);
  text(answer, 20, 100);

  textSize(18);
  text("total generations:     " + population.getGenerations(), 20, 160);
  text("average fitness:       " + nf(population.getAverageFitness(), 0, 2), 20, 180);
  text("total population:      " + popmax, 20, 200);
  text("mutation rate:         " + (mutationRate * 100) + "%", 20, 220);
  text("diversity:             " + (diversity * 100) + "%", 20, 240);
 
  textSize(10);
  text("All phrases:\n" + population.allPhrases(), 500, 10);
}
