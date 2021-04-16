// Adapted by Chandru Narayan
// For the Bush School CPJava Final Project
// Fall 2020 - Spring 2021

// Credits:
// The Nature of Code
// Daniel Shiffman
//

// Genetic Algorithm, Evolving alphabots!

// Demonstration of using a genetic algorithm to type out a phrase

// A class to describe a psuedo-DNA, i.e. genotype
//   Here, a virtual organism's DNA is an array of characters.
//   Functionality:
//      -- convert DNA into a string  //phenotype
//      -- calculate DNA's "fitness"  //used in selection
//      -- mate DNA with another set of DNA  //replication 
//      -- mutate DNA


class DNA {

  // The genetic sequence
  char[] genes;
  
  // Constructor (makes a random DNA)
  DNA(int len) {
    genes = new char[len];
    for (int i = 0; i < genes.length; i++) {
      genes[i] = (char) random(32,128);  // Pick from range of chars
    }
  }
  
  // Converts character array to a String
  String getPhrase() {
    return new String(genes);
  }
  
  // Based on a mutation probability, picks a new random character
  void mutate(float mutationRate) {
    for (int i = 0; i < genes.length; i++) {
      if (random(1) < mutationRate) {
        genes[i] = (char) random(32,128);
      }
    }
  }
}
