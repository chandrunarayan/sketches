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
String target;
int popmax;
float mutationRate;
Population population;
float firstWeight = 0.4;
boolean running = true;  // is script running or paused

void setup() {
  size(1400, 360);
  f = createFont("Courier", 16, true);
  //target = "Hello - my name is Catey - How do you do?";
  target = "l'm not awake. l've not had my tea, and yet you bring me Fink-Nottles. ls this a time for any kind of Nottle? The gentleman did say it was urgent, sir. Yes, well, he lives in the country. He gets overstimulated when he's in London. Tell him l'll see him at the Drones at 12:00.Very good, sir.";
  popmax = 5000;
  mutationRate = 0.001;

  // Create a populationation with a target phrase, mutation rate, and populationation max
  population = new Population(target, mutationRate, popmax);
  //displayInfo();
  //noLoop();
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
    float timePassed = millis()/1000.0;
    println("Alphabot Evolution took "+timePassed+" seconds");
    println(population.generations/timePassed   +" Alphabot generations were created per second.");
    println(population.bestBotColor+" colored Alphabot guessed the target phrase");
    println("Final phrase guess: "+population.bestBotPhrase);
    noLoop();
  }
}

void displayInfo() {
  background(255);
  // Display current status of populationation
  //String answer = population.getBest();
  String answer = population.bestBotPhrase;
  textFont(f);
  textAlign(LEFT);


  textSize(24);
  text("Best phrase:", 20, 30);
  textSize(40);
  fill(colorToHex(population.bestBotColor));
  text(answer, 20, 80);

  fill(0);
  textSize(18);
  int totalBots = population.totColor1+population.totColor2+population.totColor3;
  text("total generations:" + population.getGenerations(), 20, 100);
  text("Alphabots colored "+botColors[0]+":  " + nf(100.0*population.totColor1/totalBots, 2, 1) + "%", 20, 120);
  text("Alphabots colored "+botColors[1]+":     " + nf(100.0*population.totColor2/totalBots, 2, 1) + "%", 20, 140);
  text("Alphabots colored "+botColors[2]+":   " + nf(100.0*population.totColor3/totalBots, 2, 1) + "%", 20, 160);
  text("average fitness:       \t" + nf(population.getAverageFitness(), 0, 2), 20, 180);
  text("total population:      \t" + popmax, 20, 200);
  text("mutation rate:         \t" + int(mutationRate * 100) + "%", 20, 220);

  fill(0);
  textSize(10);
  text("All phrases:\n" + population.allPhrases(), 500, 10);
}

public int colorToHex(String scolor) {
  int hexColor = #000000;
  String c = scolor.toLowerCase();
  if (c.equals("red"))
     hexColor = #FF0000;
  else if (c.equals("green"))
     hexColor = #00FF00;
  else if (c.equals("blue"))
     hexColor = #0000FF;
  else if (c.equals("yellow"))
     hexColor = #FFFF00;
  else if (c.equals("cyan"))
     hexColor = #00FFFF;
  else if (c.equals("magenta"))
     hexColor = #FF00FF;
  else if (c.equals("white"))
     hexColor = #FFFFFF;
  else
     hexColor = #000000;

  return hexColor;
}

public void keyPressed() {                                                                                         //simulation controls
  if (keyCode == 32) //spacebar to toggle running
    running = !running;
  if (running) noLoop();
  else {
    float timePassed = millis()/1000.0;
    println("\nAlphabot Evolution at Key Press took "+timePassed+" seconds");
    println(population.generations/timePassed   +" Alphabot generations were created per second.");
    println(population.bestBotColor+" colored Alphabot guessed phrase at Key Press");
    println("Best phrase guess at Key Press: "+population.bestBotPhrase);
    loop();
  }
}
