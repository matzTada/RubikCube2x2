PShape cube;
float c;
int pastMouseX, pastMouseY;

void setup() {
  size(800, 600, P3D);    
  c = height / 5;

  frameRate(15);

  rubikSetup();
  //  createCube();
  pastMouseX = mouseX;
  pastMouseY = mouseY;

  p5Setup();
}

void draw() {
  background(0);

  rubikLoop();

  //2D development view
  pushMatrix();
  drawRubikSheet(0, 0, width/ 3, height/3);
  popMatrix();

  //3D axis start
  pushMatrix();
  translate(width/2, height/2);

  rotateX(-(pastMouseY - 0.5 * height) / (0.5 * height)  * PI);
  rotateY((pastMouseX - 0.5 * width) / (0.5 * width)  * PI);

  //axis
  stroke(255, 0, 0);  
  line(0, 0, 0, 300, 0, 0);
  stroke(0, 255, 0);
  line(0, 0, 0, 0, 300, 0);
  stroke(0, 0, 255);
  line(0, 0, 0, 0, 0, 300);
  noStroke();

  drawRubikCube();

  popMatrix();
  //  println(frameRate);
}

