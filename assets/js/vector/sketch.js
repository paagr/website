let walker;

function setup() {
  createCanvas(window.innerWidth, window.innerHeight);
  walker = new Walker((window.innerWidth / 2), (window.innerHeight / 2));
}

function draw() {
  background(0);
  walker.update();
  walker.show();
}