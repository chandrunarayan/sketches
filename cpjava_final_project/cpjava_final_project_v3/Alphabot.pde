// Adapted by Chandru Narayan
// For the Bush School CPJava Final Project
// Fall 2020 - Spring 2021

// Credits:
// The Nature of Code
// Daniel Shiffman
//

// Genetic Algorithm, Evolving alphabots!

// Demonstration of using a genetic algorithm to type out a phrase


class Alphabot {
  DNA dna;         //Alphabot's dna expressed in genes
  String phrase;   //Alphabot's phrase phenome
  float fitness;   //Alphabot's fitness improves with natural selection

  

  Alphabot(String target) {
     dna = new DNA(target.length());
     phrase = getPhrase();
     fitness = getFitness(target);
  }
  
  // Crossover
  Alphabot crossover(Alphabot partner) {
    // A new child
    Alphabot child = new Alphabot(target);
    
    int midpoint = int(random(dna.genes.length)); // Pick a midpoint
    
    // Half from one, half from the other
    for (int i = 0; i < dna.genes.length; i++) {
      if (i > midpoint) child.dna.genes[i] = dna.genes[i];
      else              child.dna.genes[i] = partner.dna.genes[i];
    }
    return child;
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
