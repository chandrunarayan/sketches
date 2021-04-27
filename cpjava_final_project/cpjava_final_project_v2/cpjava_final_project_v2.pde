// Adapted by Chandru Narayan
// For the Bush School CPJava Final Project
// Fall 2020 - Spring 2021

// Credits:
// The Nature of Code
// Daniel Shiffman
//

// Genetic Algorithm, Evolving alphabots!

// Demonstration of using a genetic algorithm to type out a phrase

// setup()
//  # Step 1: The Population 
//    # Create an empty population (an array or ArrayList)
//    # Fill it with DNA encoded objects (pick random values to start)

// draw()
//  # Step 1: Selection of the Fittest
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
//   # Repeat for each Population (Generation)


PFont f;
String target;
int popmax;
float mutationRate;
Population population;

void setup() {
  size(1400, 360);
  f = createFont("Courier", 16, true);
  target = "Hello - my name is Chandru - How do you do?";
  //target = "I'm not awake. I've not had my tea, and yet you bring me Fink-Nottles. ls this a time for any kind of Nottle? The gentleman did say it was urgent, sir. Yes, well, he lives in the country Jeeves. He gets overstimulated when he's in London. Tell him l'll see him at the Drones at 12:00.Very good, sir.";
  popmax = 1000;
  mutationRate = 0.005;

  // Create a populationation with a target phrase, mutation rate, and population max
  population = new Population(target, mutationRate, popmax);
}

void draw() {
  // Generate mating pool
  population.naturalSelection();
  //Create next generation
  population.generate();
  //Display stats
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
  text("mutation rate:         " + nf(mutationRate * 100, 0, 2) + "%", 20, 220);
 
  textSize(10);
  text("All phrases:\n" + population.allPhrases(), 500, 10);
}
