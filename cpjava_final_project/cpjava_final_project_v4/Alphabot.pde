// Adapted by Chandru Narayan
// For the Bush School CPJava Final Project
// Fall 2020 - Spring 2021

// Credits:
// The Nature of Code
// Daniel Shiffman
//

// Genetic Algorithm, Evolving alphabots!

// Demonstration of using a genetic algorithm to type out a phrase

String botColors[] = {"Magenta", "Cyan", "Yellow"};  //Alphabots can come in 3 colors

class Alphabot {
  DNA dna;         //Alphabot's dna expressed in genes
  String phrase;   //Alphabot's phrase phenome
  String botColor;
  float fitness;   //Alphabot's fitness improves with natural selection

  

  Alphabot(String target) {
     dna = new DNA(target.length());
     phrase = getPhrase();
     botColor = botColors[(int)(Math.random()*3)];
     fitness = getFitness(target);
  }
  
  // Crossover
  Alphabot crossover(Alphabot partner) {
    // A new child
    Alphabot child = new Alphabot(target);
    child.botColor = getChildColor();
    //child.botColor = getChildColorWeighted();
    
    int midpoint = int(random(dna.genes.length)); // Pick a midpoint
    
    // Half from one, half from the other
    for (int i = 0; i < dna.genes.length; i++) {
      if (i > midpoint) child.dna.genes[i] = dna.genes[i];
      else              child.dna.genes[i] = partner.dna.genes[i];
    }
    return child;
  }
  
  // Get child color
  String getChildColor() {
    return botColors[(int)(Math.random()*3)];
  }
   
  // Get child color weighted
  String getChildColorWeighted() {
    String retColor;
    float toss = (float) Math.random();
    if (toss < firstWeight)
        retColor = botColors[0];
    else if (toss < 0.5+firstWeight/2)
        retColor = botColors[1];
    else retColor = botColors[2];
    return retColor;
  }
  
  // Converts character array to a String
  String getPhrase() {
    return new String(dna.genes);
  }

  // Converts character array to a String
  void updatePhrase() {
    phrase = getPhrase();
  }  
  
  // Update Fitness based on updated DNA phrase
  void updateFitness() {
      fitness = getFitness(target);
  }
  
  // Fitness function (returns floating point % of "correct" characters)
  float getFitness (String target) {
     int score = 0;
     for (int i = 0; i < dna.genes.length; i++) {
        if (dna.genes[i] == target.charAt(i)) {
          score++;
        }
     }
     
     
     return (float)score / (float)target.length();
  }
}
