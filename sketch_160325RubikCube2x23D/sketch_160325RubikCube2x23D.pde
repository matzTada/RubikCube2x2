// Press 'w' to start wiggling, space to restore
// original positions.

PShape cube;
float c = 150;

int pastMouseX, pastMouseY;

void setup() {
  size(1200, 900, P3D);    

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

  pushMatrix();
  drawRubikSheet(0, 0, width/ 3, height/3);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  //  rotateX(frameCount * 0.01f);
  //  rotateY(frameCount * 0.01f);
  //  rotateZ(frameCount * 0.01f);

  rotateX(-(pastMouseY - 0.5 * height) / (0.5 * height) * 0.5 * PI);
  rotateY((pastMouseX - 0.5 * width) / (0.5 * width) * 0.5 * PI);

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
  //  createCube();
  //  shape(cube);

  //  println(frameRate);
}

void drawRubikSheet(int x, int y, int w, int h) {
  myRect(0.0 / 8.0 * (float)w, 2.0 / 6.0 *  (float)h, w, h, 0);
  myRect(1.0 / 8.0 * (float)w, 2.0 / 6.0 *  (float)h, w, h, 1);
  myRect(0.0 / 8.0 * (float)w, 3.0 / 6.0 *  (float)h, w, h, 2);
  myRect(1.0 / 8.0 * (float)w, 3.0 / 6.0 *  (float)h, w, h, 3);

  myRect(2.0 / 8.0 * (float)w, 2.0 / 6.0 *  (float)h, w, h, 4);
  myRect(3.0 / 8.0 * (float)w, 2.0 / 6.0 *  (float)h, w, h, 5);
  myRect(2.0 / 8.0 * (float)w, 3.0 / 6.0 *  (float)h, w, h, 6);
  myRect(3.0 / 8.0 * (float)w, 3.0 / 6.0 *  (float)h, w, h, 7);

  myRect(4.0 / 8.0 * (float)w, 2.0 / 6.0 *  (float)h, w, h, 8);
  myRect(5.0 / 8.0 * (float)w, 2.0 / 6.0 *  (float)h, w, h, 9);
  myRect(4.0 / 8.0 * (float)w, 3.0 / 6.0 *  (float)h, w, h, 10);
  myRect(5.0 / 8.0 * (float)w, 3.0 / 6.0 *  (float)h, w, h, 11);

  myRect(6.0 / 8.0 * (float)w, 2.0 / 6.0 *  (float)h, w, h, 12);
  myRect(7.0 / 8.0 * (float)w, 2.0 / 6.0 *  (float)h, w, h, 13);
  myRect(6.0 / 8.0 * (float)w, 3.0 / 6.0 *  (float)h, w, h, 14);
  myRect(7.0 / 8.0 * (float)w, 3.0 / 6.0 *  (float)h, w, h, 15);

  myRect(2.0 / 8.0 * (float)w, 0.0 / 6.0 *  (float)h, w, h, 16);
  myRect(3.0 / 8.0 * (float)w, 0.0 / 6.0 *  (float)h, w, h, 17);
  myRect(2.0 / 8.0 * (float)w, 1.0 / 6.0 *  (float)h, w, h, 18);
  myRect(3.0 / 8.0 * (float)w, 1.0 / 6.0 *  (float)h, w, h, 19);

  myRect(2.0 / 8.0 * (float)w, 4.0 / 6.0 *  (float)h, w, h, 20);
  myRect(3.0 / 8.0 * (float)w, 4.0 / 6.0 *  (float)h, w, h, 21);
  myRect(2.0 / 8.0 * (float)w, 5.0 / 6.0 *  (float)h, w, h, 22);
  myRect(3.0 / 8.0 * (float)w, 5.0 / 6.0 *  (float)h, w, h, 23);
}

void myRect(float x, float y, int w, int h, int cellNumber) {
  switch(surfaceColor[cellNumber]) {
  case 0: 
    fill(255, 0, 0); 
    break;
  case 1: 
    fill(0, 255, 0); 
    break;
  case 2: 
    fill(0, 0, 255); 
    break;
  case 3: 
    fill(255, 255, 0); 
    break;
  case 4: 
    fill(255, 0, 255); 
    break;
  case 5: 
    fill(0, 255, 255); 
    break;
  }
  rect(x, y, 1.0 / 8.0 * (float)w, 1.0 / 6.0 *  (float)h);
};

void drawRubikCube() {
  stroke(255);
  strokeWeight(5);

  // Front face 1
  beginShape(QUADS);
  fillByNumber(surfaceColor[4]);
  //  face.fill(255);
  vertex(-c, -c, +c);
  vertex(0, -c, +c);
  vertex(0, 0, +c);
  vertex(-c, 0, +c);
  endShape(CLOSE);

  // Front face 2
  beginShape(QUADS);
  fillByNumber( surfaceColor[5]);
  //  face.fill(255);
  vertex(0, -c, +c);
  vertex(c, -c, +c);
  vertex(c, 0, +c);
  vertex(0, 0, +c);
  endShape(CLOSE);

  // Front face 3
  beginShape(QUADS);
  fillByNumber( surfaceColor[6]);
  //  face.fill(255);
  vertex(-c, 0, +c);
  vertex(0, 0, +c);
  vertex(0, +c, +c);
  vertex(-c, +c, +c);
  endShape(CLOSE);

  // Front face 4
  beginShape(QUADS);
  fillByNumber( surfaceColor[7]);
  //  face.fill(255);
  vertex(0, 0, +c);
  vertex(+c, 0, +c);
  vertex(+c, +c, +c);
  vertex(0, +c, +c);
  endShape(CLOSE);

  // Back face 1
  beginShape(QUADS);
  fillByNumber( surfaceColor[13]);
  //  face.fill(255);
  vertex(-c, -c, -c);
  vertex(0, -c, -c);
  vertex(0, 0, -c);
  vertex(-c, 0, -c);
  endShape(CLOSE);

  // Back face 2
  beginShape(QUADS);
  fillByNumber( surfaceColor[12]);
  //  face.fill(255);
  vertex(0, -c, -c);
  vertex(c, -c, -c);
  vertex(c, 0, -c);
  vertex(0, 0, -c);
  endShape(CLOSE);

  // Back face 3
  beginShape(QUADS);
  fillByNumber( surfaceColor[15]);
  // face.fill(255);
  vertex(-c, 0, -c);
  vertex(0, 0, -c);
  vertex(0, +c, -c);
  vertex(-c, +c, -c);
  endShape(CLOSE);

  // Back face 4
  beginShape(QUADS);
  fillByNumber( surfaceColor[14]);
  //  face.fill(255);
  vertex(0, 0, -c);
  vertex(+c, 0, -c);
  vertex(+c, +c, -c);
  vertex(0, +c, -c);
  endShape(CLOSE);

  // Right face 1
  beginShape(QUADS);
  fillByNumber( surfaceColor[8]);
  //  face.fill(255);
  vertex(+c, -c, +c);
  vertex(+c, -c, 0);
  vertex(+c, 0, 0);
  vertex(+c, 0, +c);
  endShape(CLOSE);

  // Right face 2
  beginShape(QUADS);
  fillByNumber( surfaceColor[9]);
  //  face.fill(255);
  vertex(+c, -c, 0);
  vertex(+c, -c, -c);
  vertex(+c, 0, -c);
  vertex(+c, 0, 0);
  endShape(CLOSE);

  // Right face 3
  beginShape(QUADS);
  fillByNumber( surfaceColor[10]);
  // face.fill(255);
  vertex(+c, 0, +c);
  vertex(+c, 0, 0);
  vertex(+c, +c, 0);
  vertex(+c, +c, +c);
  endShape(CLOSE);

  // Right face 4
  beginShape(QUADS);
  fillByNumber( surfaceColor[11]);
  //face.fill(255);
  vertex(+c, 0, 0);
  vertex(+c, 0, -c);
  vertex(+c, +c, -c);
  vertex(+c, +c, 0);
  endShape(CLOSE);

  // left face 1
  beginShape(QUADS);
  fillByNumber( surfaceColor[1]);
  //  face.fill(255);
  vertex(-c, -c, +c);
  vertex(-c, -c, 0);
  vertex(-c, 0, 0);
  vertex(-c, 0, +c);
  endShape(CLOSE);

  // Left face 2
  beginShape(QUADS);
  fillByNumber( surfaceColor[0]);
  // face.fill(255);
  vertex(-c, -c, 0);
  vertex(-c, -c, -c);
  vertex(-c, 0, -c);
  vertex(-c, 0, 0);
  endShape(CLOSE);

  // Left face 3
  beginShape(QUADS);
  fillByNumber( surfaceColor[3]);
  //  face.fill(255);
  vertex(-c, 0, +c);
  vertex(-c, 0, 0);
  vertex(-c, +c, 0);
  vertex(-c, +c, +c);
  endShape(CLOSE);

  // Left face 4
  beginShape(QUADS);
  fillByNumber( surfaceColor[2]);
  //face.fill(255);
  vertex(-c, 0, 0);
  vertex(-c, 0, -c);
  vertex(-c, +c, -c);
  vertex(-c, +c, 0);
  endShape(CLOSE);

  // Top face 1
  beginShape(QUADS);
  fillByNumber( surfaceColor[16]);
  // face.fill(255);
  vertex(-c, -c, -c);
  vertex(0, -c, -c);
  vertex(0, -c, 0);
  vertex(-c, -c, 0);
  endShape(CLOSE);

  // Top face 2
  beginShape(QUADS);
  fillByNumber( surfaceColor[17]);
  //  face.fill(255);
  vertex(0, -c, -c);
  vertex(+c, -c, -c);
  vertex(+c, -c, 0);
  vertex(0, -c, 0);
  endShape(CLOSE);

  // Top face 3
  beginShape(QUADS);
  fillByNumber( surfaceColor[18]);
  //  face.fill(255);
  vertex(-c, -c, 0);
  vertex(0, -c, 0);
  vertex(0, -c, +c);
  vertex(-c, -c, +c);
  endShape(CLOSE);

  // Top face 4
  beginShape(QUADS);
  fillByNumber( surfaceColor[19]);
  // face.fill(255);
  vertex(0, -c, 0);
  vertex(+c, -c, 0);
  vertex(+c, -c, +c);
  vertex(0, -c, +c);
  endShape(CLOSE);

  // Bottom face 1
  beginShape(QUADS);
  fillByNumber( surfaceColor[22]);
  //  face.fill(255);
  vertex(-c, +c, -c);
  vertex(0, +c, -c);
  vertex(0, +c, 0);
  vertex(-c, +c, 0);
  endShape(CLOSE);

  // Bottom face 2
  beginShape(QUADS);
  fillByNumber( surfaceColor[23]);
  //  face.fill(255);
  vertex(0, +c, -c);
  vertex(+c, +c, -c);
  vertex(+c, +c, 0);
  vertex(0, +c, 0);
  endShape(CLOSE);

  // Bottom face 3
  beginShape(QUADS);
  fillByNumber( surfaceColor[20]);
  // face.fill(255);
  vertex(-c, +c, 0);
  vertex(0, +c, 0);
  vertex(0, +c, +c);
  vertex(-c, +c, +c);
  endShape(CLOSE);

  // Bottom face 4
  beginShape(QUADS);
  fillByNumber( surfaceColor[21]);
  //  face.fill(255);
  vertex(0, +c, 0);
  vertex(+c, +c, 0);
  vertex(+c, +c, +c);
  vertex(0, +c, +c);
  endShape(CLOSE);
}
