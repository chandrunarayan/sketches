// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com
// Adapted for P5JS by Chandru Narayan
// Bush School
// Example: Bubble objects

let bubbles = []; // A Bubble Array
let maxBubb = 200;
let maxRad = 30;
let maxSpd = 2;
let numColor = 4;

function randomColor() {
  return color(random(255), random(255), random(255), random(255));
}

function redColor() {
  return color(random(255), 0, 0, random(100));
}

function greenColor() {
  return color(0, random(255), 0, random(100));
}

function blueColor() {
  return color(0, 0, random(255), random(100));
}

function blackColor() {
  return color(0, 0, 0, random(50));
}

function setup() {
  createCanvas(800, 500);
  for (let i = 0, theColor; i < maxBubb; i++) {
    if (i > maxBubb * (numColor - 1) / numColor) {
      theColor = blackColor();
    } else if (i > maxBubb * (numColor - 2) / numColor) {
      theColor = blueColor();
    } else if (i > maxBubb * (numColor - 3) / numColor) {
      theColor = greenColor();
    } else {
      theColor = redColor();
    }
    bubbles[i] = new Bubble(theColor, random(5, maxRad), maxRad, maxRad, random(maxSpd), random(maxSpd));
  }
}

function draw() {
  background(255);
  for (i = 0; i < maxBubb; i++) {
    theBubb = bubbles[i];
    theBubb.move();
    theBubb.display();
  }
}

function Bubble(tempC, tempRad, tempXpos, tempYpos, tempXspd, tempYspd) { // The Constructor is defined with arguments.
  this.c = tempC;
  this.rad = tempRad;
  this.xpos = tempXpos;
  this.ypos = tempYpos;
  this.xspd = tempXspd;
  this.yspd = tempYspd;
  this.xdir = 1;
  this.ydir = 1;
  this.live = true;

  this.display = function() {
    stroke(0);
    fill(this.c);
    ellipseMode(RADIUS);
    ellipse(this.xpos, this.ypos, this.rad);
  }

  this.move = function() {
    this.xpos += this.xspd * this.xdir;
    this.ypos += this.yspd * this.ydir;

    if (this.xpos > width - this.rad || this.xpos < this.rad) {
      this.xdir *= -1;
    }
    if (this.ypos > height - this.rad || this.ypos < this.rad) {
      this.ydir *= -1;
    }
  }

  this.jitter = function() {
    this.xpos += random(-this.xspd, this.xspd);
    this.ypos += random(-this.yspd, this.yspd);

    if (this.xpos > width - this.rad) {
      this.xpos = width;
    } else if (this.ypos > height - this.rad) {
      this.ypos = 0;
    }
  }

  this.getCol = function() {
    bCol = splitTokens(bubbles[i].c.toString(), '(,');
    if (bCol[1] > 0) { //red color
      theCol = "red";
    } else if (bCol[2] > 0) { //green color
      theCol = "green";
    } else if (bCol[3] > 0) { //blue color
      theCol = "blue";
    } else { //black color
      theCol = "black";
    }
    return theCol;
  }

  this.goHome = function(xpos, ypos) {
    if (this.xspd > 0 || this.yspd > 0) {
      this.xpos = xpos;
      this.ypos = ypos;
    }
  }

  this.kill = function() {
    this.c = color("yellow");
    this.xspd = 0;
    this.yspd = 0;
    this.live = false;
  }

  this.revive = function() {
    this.xspd = maxSpd;
    this.yspd = maxSpd;
    this.live = true;
  }

}

function mouseReleased() {
  for (i = 0; i < maxBubb; i++) {
    theBubb = bubbles[i];
    if (theBubb.live) {
      theCol = theBubb.getCol();
      if (theCol === "red") { //red color
        theBubb.goHome(maxRad, maxRad);
      } else if (theCol === "green") { //red color
        theBubb.goHome(width - maxRad, maxRad);
      } else if (theCol === "blue") { //red color
        theBubb.goHome(width - maxRad, height - maxRad);
      } else { //black color
        theBubb.goHome(maxRad, height - maxRad);
      }
    }
  }
}

function mousePressed() {
  for (i = 0; i < maxBubb; i++) {
    theBubb = bubbles[i];
    d = dist(mouseX, mouseY, theBubb.xpos, theBubb.ypos)
    if (d <= theBubb.rad) {
      if (theBubb.live) {
        theBubb.kill();
      } else {
        theBubb.revive();
      }
    }
  }
}