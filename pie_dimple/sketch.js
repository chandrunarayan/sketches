class Bubble {
  constructor(xloc, yloc, colr, sze, xspd, yspd) {
    this.x = xloc;
    this.y = yloc;
    this.c = colr;
    this.s = sze;
    this.xspd = xspd;
    this.yspd = yspd;
    this.xdir = 1;
    this.ydir = 1;
  }
  
  display() {
    fill(this.c);
    ellipse(this.x, this.y, this.s, this.s);
  }

  move2() {
    push();
    // translate(this.x, this.y);
    // rotate(this.a);
    this.x += value * this.xspd * this.xdir;
    this.y += value * this.yspd * this.ydir;
    if (this.x + this.s / 2 > width || this.x - this.s / 2 < 0) {
      this.xdir *= -1;
    }
    if (this.y + this.s / 2 > height || this.y - this.s / 2 < 0) {
      this.ydir *= -1;
    }    
    pop();
  }
 }
let bubb1, bubb2, bubb3;
let ba = [];
let sz = 40;
let numB = 10;
let intensity_slider;
let value_text;
let value;
let bubble_button;
let sz2 = 90;

function setup() {
  createCanvas(600, 400);
  intensity_slider = createSlider(1, 5, 1, 1);
  value = intensity_slider.value();
  value_text = createP('the intensity is: ' + value);
  let p = createP('Try to click on all of the buttons to pop them once you do that you WIN!');
  bubble_button = createButton('New Bubble');
  bubble_button.mousePressed(createbubble);
  delete_bubble = createButton('get rid of the big bubbles');
  delete_bubble.mousePressed(deletebubble);
  for (let i = 0; i < numB; i++) {
    ba.push(new Bubble(width / 2, height / 2, randColor(), sz, random(value), random(value)));
  }
}

function draw() {
  background(220);
  value = intensity_slider.value();
  value_text.html('the intensity is: ' + nf(value, 1, 2));
  for (let i = 0; i < ba.length; i++) {
     ba[i].move2();
     ba[i].display();
  }
}

function randColor() {
  return color(random(255), random(255), random(255));
}

function createbubble() {
  ba.push(new Bubble(width / 2, height / 2, color('cyan'), sz2, random(value), random(value)));
}

function deletebubble() {
  for (let i = ba.length - 1; i >= 0; i--) {
    if (ba[i].s >= sz2) {
      ba.splice(i, 1);
    }
  }
}