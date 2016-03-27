boolean firstSurfaces[][] = {
  {
    false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true
  }
  , 
  {
    false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, true, true, true
  }
  , 
  {
    false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, true, true, true, true, true, true, true
  }
  , 
  {
    false, false, false, false, false, false, false, false, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true
  }
  , 
  {
    false, false, false, false, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true
  }
};
int surfaceColor[] = new int[24];
boolean surfaces[][] = {
  {
    false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true
  }
  , 
  {
    false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, true, true, true
  }
  , 
  {
    false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, true, true, true, true, true, true, true
  }
  , 
  {
    false, false, false, false, false, false, false, false, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true
  }
  , 
  {
    false, false, false, false, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true
  }
};

boolean demoFlag = false;
ArrayList<Integer> solveSequence = new ArrayList<Integer>();
int demoNow = 0;

void setup() {
  size(800, 600);

  boolean a = true, b = false, c = false;

  println("a = " + a);
  println("b = " + b);
  println("c = " + c);
  println("a & b = " + (a & b));
  println("a | b = " + (a | b));
  println("!(a ^ b) = " + !(a ^ b));
  println("!(b ^ c) = " + !(b ^ c));
  println("a | b & c = " + (a | b & c));
  println("a ^ b ^ c = " + (a ^ b ^ c));

  //for (int j = 0; j < 5; j++) { //print surface
  //  for (int i = 0; i < 24; i++) {
  //    print(surfaces[j][i] + " ");
  //  }
  //  println("");
  //}
}

void draw() {
  background(255);
  if (demoFlag) {
    delay(1000);
    println("demo execute:" + solveSequence.get(demoNow));
    surfaces = executeRotateByNumber(solveSequence.get(demoNow), surfaces);
    demoNow++;
    if (demoNow >= solveSequence.size()) {
      println("demo solved");
      demoFlag = false;
    }
  }

  for (int i = 0; i < surfaceColor.length; i++) { //initialization
    surfaceColor[i] = 0;
  }

  for (int j = 0; j < 5; j++) {
    for (int i = 0; i < surfaceColor.length; i++) { //sum up sheet
      if (surfaces[j][i]) {
        surfaceColor[i]++;
      }
      //print(surfaceColor[i] + " ");
    }
    //println("");
  }

  //for (int i = 0; i < surfaceColor.length; i++) { //print
  // print(surfaceColor[i] + " ");
  //}
  //println("");

  //display 2 dimention
  myRect(0.0 / 8.0 * (float)width, 2.0 / 6.0 *  (float)height, 0);
  myRect(1.0 / 8.0 * (float)width, 2.0 / 6.0 *  (float)height, 1);
  myRect(0.0 / 8.0 * (float)width, 3.0 / 6.0 *  (float)height, 2);
  myRect(1.0 / 8.0 * (float)width, 3.0 / 6.0 *  (float)height, 3);

  myRect(2.0 / 8.0 * (float)width, 2.0 / 6.0 *  (float)height, 4);
  myRect(3.0 / 8.0 * (float)width, 2.0 / 6.0 *  (float)height, 5);
  myRect(2.0 / 8.0 * (float)width, 3.0 / 6.0 *  (float)height, 6);
  myRect(3.0 / 8.0 * (float)width, 3.0 / 6.0 *  (float)height, 7);

  myRect(4.0 / 8.0 * (float)width, 2.0 / 6.0 *  (float)height, 8);
  myRect(5.0 / 8.0 * (float)width, 2.0 / 6.0 *  (float)height, 9);
  myRect(4.0 / 8.0 * (float)width, 3.0 / 6.0 *  (float)height, 10);
  myRect(5.0 / 8.0 * (float)width, 3.0 / 6.0 *  (float)height, 11);

  myRect(6.0 / 8.0 * (float)width, 2.0 / 6.0 *  (float)height, 12);
  myRect(7.0 / 8.0 * (float)width, 2.0 / 6.0 *  (float)height, 13);
  myRect(6.0 / 8.0 * (float)width, 3.0 / 6.0 *  (float)height, 14);
  myRect(7.0 / 8.0 * (float)width, 3.0 / 6.0 *  (float)height, 15);

  myRect(2.0 / 8.0 * (float)width, 0.0 / 6.0 *  (float)height, 16);
  myRect(3.0 / 8.0 * (float)width, 0.0 / 6.0 *  (float)height, 17);
  myRect(2.0 / 8.0 * (float)width, 1.0 / 6.0 *  (float)height, 18);
  myRect(3.0 / 8.0 * (float)width, 1.0 / 6.0 *  (float)height, 19);

  myRect(2.0 / 8.0 * (float)width, 4.0 / 6.0 *  (float)height, 20);
  myRect(3.0 / 8.0 * (float)width, 4.0 / 6.0 *  (float)height, 21);
  myRect(2.0 / 8.0 * (float)width, 5.0 / 6.0 *  (float)height, 22);
  myRect(3.0 / 8.0 * (float)width, 5.0 / 6.0 *  (float)height, 23);
}

void keyPressed() {
  switch(key) {
  case 'j': 
    println("judge return = " + judge(surfaces)); 
    break;
  case 'p':
    println("random");
    for (int i = 0; i < 10; i++) surfaces = executeRotateByNumber((int)random(0, 12), surfaces);
    break;
  case ENTER:
    println("solve");
    solve(7, surfaces);
    break;
  case DELETE:
    println("reset");
    surfaces = (boolean [][]) firstSurfaces.clone();
    break;
  case BACKSPACE:
    println("demo");
    demoFlag = true;
    demoNow = 0;
    solveSequence.clear();
    int [] tempSequence = solve(7, surfaces);
    println("demo");
    for (int temp : tempSequence) solveSequence.add(temp);
    print("solveSequence: ");
    for (int temp : solveSequence) print(temp + " ");
    println("");
    break;
  case 'q':
    surfaces = rotateCube(r1P, surfaces);
    break;
  case 'a':
    surfaces = rotateCube(r1N, surfaces);
    break;
  case 'z':
    surfaces = rotateCube(r1T, surfaces);
    break;
  case 'w':
    surfaces = rotateCube(r2P, surfaces);
    break;
  case 's':
    surfaces = rotateCube(r2N, surfaces);
    break;
  case 'x':
    surfaces = rotateCube(r2T, surfaces);
    break;
  case 'e':
    surfaces = rotateCube(r3P, surfaces);
    break;
  case 'd':
    surfaces = rotateCube(r3N, surfaces);
    break;
  case 'c':
    surfaces = rotateCube(r3T, surfaces);
    break;
  case 'r':
    surfaces = rotateCube(r4P, surfaces);
    break;
  case 'f':
    surfaces = rotateCube(r4N, surfaces);
    break;
  case 'v':
    surfaces = rotateCube(r4T, surfaces);
    break;
  }
}

void mouseClicked() {
  rotateCube(r1P, surfaces);
}

void myRect(float startX, float startY, int cellNumber) {
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
  rect(startX, startY, 1.0 / 8.0 * (float)width, 1.0 / 6.0 *  (float)height);
};

