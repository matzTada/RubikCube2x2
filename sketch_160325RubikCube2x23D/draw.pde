void myRect(float x, float y, int w, int h, int number, String str) { //draw rect by cellNumber
  fillByNumber(number);
  strokeWeight(height/200);
  rect(x, y, 1.0 / 8.0 * (float)w, 1.0 / 6.0 *  (float)h);
  fill(255, 150);
  textAlign(CENTER, CENTER);
  textSize(height/20);
  text(str, x + 1.0 / 8.0 * (float)w / 2, y + 1.0 / 6.0 *  (float)h / 2);
}

void drawRubikSheet(int x, int y, int w, int h) { // 2D draw. Development view of cube
  //Left
  myRect(0.0 / 8.0 * (float)w, 2.0 / 6.0 *  (float)h, w, h, surfaceColor[0], "L");
  myRect(1.0 / 8.0 * (float)w, 2.0 / 6.0 *  (float)h, w, h, surfaceColor[1], "L");
  myRect(0.0 / 8.0 * (float)w, 3.0 / 6.0 *  (float)h, w, h, surfaceColor[2], "L");
  myRect(1.0 / 8.0 * (float)w, 3.0 / 6.0 *  (float)h, w, h, surfaceColor[3], "L");

  //Front
  myRect(2.0 / 8.0 * (float)w, 2.0 / 6.0 *  (float)h, w, h, surfaceColor[4], "F");
  myRect(3.0 / 8.0 * (float)w, 2.0 / 6.0 *  (float)h, w, h, surfaceColor[5], "F");
  myRect(2.0 / 8.0 * (float)w, 3.0 / 6.0 *  (float)h, w, h, surfaceColor[6], "F");
  myRect(3.0 / 8.0 * (float)w, 3.0 / 6.0 *  (float)h, w, h, surfaceColor[7], "F");

  //Right
  myRect(4.0 / 8.0 * (float)w, 2.0 / 6.0 *  (float)h, w, h, surfaceColor[8], "R");
  myRect(5.0 / 8.0 * (float)w, 2.0 / 6.0 *  (float)h, w, h, surfaceColor[9], "R");
  myRect(4.0 / 8.0 * (float)w, 3.0 / 6.0 *  (float)h, w, h, surfaceColor[10], "R");
  myRect(5.0 / 8.0 * (float)w, 3.0 / 6.0 *  (float)h, w, h, surfaceColor[11], "R");

  //Back
  myRect(6.0 / 8.0 * (float)w, 2.0 / 6.0 *  (float)h, w, h, surfaceColor[12], "B");
  myRect(7.0 / 8.0 * (float)w, 2.0 / 6.0 *  (float)h, w, h, surfaceColor[13], "B");
  myRect(6.0 / 8.0 * (float)w, 3.0 / 6.0 *  (float)h, w, h, surfaceColor[14], "B");
  myRect(7.0 / 8.0 * (float)w, 3.0 / 6.0 *  (float)h, w, h, surfaceColor[15], "B");

  //Top
  myRect(2.0 / 8.0 * (float)w, 0.0 / 6.0 *  (float)h, w, h, surfaceColor[16], "T");
  myRect(3.0 / 8.0 * (float)w, 0.0 / 6.0 *  (float)h, w, h, surfaceColor[17], "T");
  myRect(2.0 / 8.0 * (float)w, 1.0 / 6.0 *  (float)h, w, h, surfaceColor[18], "T");
  myRect(3.0 / 8.0 * (float)w, 1.0 / 6.0 *  (float)h, w, h, surfaceColor[19], "T");

  //Bottom
  myRect(2.0 / 8.0 * (float)w, 4.0 / 6.0 *  (float)h, w, h, surfaceColor[20], "B");
  myRect(3.0 / 8.0 * (float)w, 4.0 / 6.0 *  (float)h, w, h, surfaceColor[21], "B");
  myRect(2.0 / 8.0 * (float)w, 5.0 / 6.0 *  (float)h, w, h, surfaceColor[22], "B");
  myRect(3.0 / 8.0 * (float)w, 5.0 / 6.0 *  (float)h, w, h, surfaceColor[23], "B");

  //text
  noStroke();
  myRect(8.0 / 8.0 * (float)w, 2.0 / 6.0 *  (float)h, w, h, 7, "1");
  myRect(8.0 / 8.0 * (float)w, 3.0 / 6.0 *  (float)h, w, h, 7, "2");
  myRect(2.0 / 8.0 * (float)w, 6.0 / 6.0 *  (float)h, w, h, 7, "3");
  myRect(3.0 / 8.0 * (float)w, 6.0 / 6.0 *  (float)h, w, h, 7, "4");
}

void fillByNumber(int number) {
  //  println(number);
  switch(number) {
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
  default: 
    fill(0, 0, 0);
    break;
  }
}

void drawRubikCube() { //draw rubik cube
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

