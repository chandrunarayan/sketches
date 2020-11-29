// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Vehicle {

  // All the usual stuff
  Vector position;
  Vector velocity;
  Vector acceleration;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed

    // Constructor initialize all values
  Vehicle(float x, float y) {
    position = new Vector(x, y);
    r = 12;
    maxspeed = 3;
    maxforce = 0.2;
    acceleration = new Vector(0, 0);
    velocity = new Vector(0, 0);
  }

  void applyForce(Vector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }
  
  void applyBehaviors(ArrayList<Vehicle> vehicles) {
     Vector separateForce = separate(vehicles);
     Vector seekForce = seek(new Vector(mouseX,mouseY));
     separateForce.mul((double)2);
     seekForce.mul((double)1);
     applyForce(separateForce);
     applyForce(seekForce); 
  }
  
    // A method that calculates a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  Vector seek(Vector target) {
    Vector desired = Vector.sub(target,position);  // A vector pointing from the position to the target
    
    // Normalize desired and scale to maximum speed
    desired.norm();
    desired.mul(maxspeed);
    // Steering = Desired minus velocity
    Vector steer = Vector.sub(desired,velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    
    return steer;
  }

  // Separation
  // Method checks for nearby vehicles and steers away
  Vector separate (ArrayList<Vehicle> vehicles) {
    float desiredseparation = r*2;
    Vector sum = new Vector();
    int count = 0;
    // For every boid in the system, check if it's too close
    for (Vehicle other : vehicles) {
      double d = Vector.dis(position, other.position);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        Vector diff = Vector.sub(position, other.position);
        diff.norm();
        diff.div(d);        // Weight by distance
        sum.add(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      sum.div(count);
      // Our desired vector is the average scaled to maximum speed
      sum.norm();
      sum.mul(maxspeed);
      // Implement Reynolds: Steering = Desired - Velocity
      sum.sub(velocity);
      sum.limit(maxforce);
    }
    return sum;
  }


  // Method to update position
  void update() {
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    position.add(velocity);
    // Reset accelertion to 0 each cycle
    acceleration.mul(0);
  }

  void display() {
    fill(175);
    stroke(0);
    pushMatrix();
    translate((float)position.x, (float)position.y);
    ellipse(0, 0, r, r);
    popMatrix();
  }

}
