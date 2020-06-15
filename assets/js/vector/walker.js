const { Linter } = require("eslint");

class Walker {
  constructor(x,y){
    this.pos = createVector(x, y);
  }
  
  update() {
    this.vel = createVector(random(-4,4),random(-4,4));
    this.pos.add(this.vel);
  }

  show() {
    stroke(0, 255, 0);
    strokeWeight(2);
    fill(0, 255, 0, 100);
    ellipse(this.pos.x, this.pos.y, 16);
  }
}