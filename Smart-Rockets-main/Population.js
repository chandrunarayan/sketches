class Population {
  constructor() {
    this.MUTATION_RATE = MUTATION_RATE;
    this.POPULATION_SIZE = POPULATION_SIZE;
    this.population = new Array(this.POPULATION_SIZE);
    for (let i = 0; i < this.POPULATION_SIZE; i++) {
      this.population[i] = new Rocket();
    }
  }

  run(count) {
    for (let i = 0; i < this.POPULATION_SIZE; i++) {
      this.population[i].update(count);
      this.population[i].show();
    }
  }

  calculateFitness() {
    for (let rocket of this.population) {
      rocket.calculateFitness();
    }
  }

  normalize() {
    let sum = 0;
    for (let rocket of this.population) {
      sum += Math.exp(rocket.fitness);
    }

    for (let rocket of this.population) {
      rocket.fitness = Math.exp(rocket.fitness) / sum;
    }
  }

  static weightedChoice(population) {
    let choice = population[Math.floor(Math.random() * population.length)];
    let r = Math.random();
    while (r > choice.fitness) {
      choice = population[Math.floor(Math.random() * population.length)];
      r = Math.random();
    }
    return choice;
  }

  reproduce() {
    let tempPool = [];

    for (let i = 0; i < this.POPULATION_SIZE; i++) {
      let p1 = Population.weightedChoice(this.population);
      let p2 = Population.weightedChoice(this.population);

      let child = p1.crossOver(p2);
      child.mutate(this.MUTATION_RATE);
      tempPool.push(child);
    }
    this.population = tempPool;
    generation++;
  }
}
