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

void rubikSetup() {
  for (int i = 0; i < surfaceColor.length; i++) { //initialization
    surfaceColor[i] = 0;
  }
}

void rubikLoop() {
  if (demoFlag) {
    if (solveSequence == null) {
      println("Muri-Safari Park!!");
    } else {
      delay(1000);
      println("demo execute:" + solveSequence.get(demoNow));
      surfaces = executeRotateByNumber(solveSequence.get(demoNow), surfaces);
      demoNow++;
      if (demoNow >= solveSequence.size()) {
        println("demo solved");
        demoFlag = false;
      }
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
  }
}

void fillByNumber(PShape ps, int number) {
  switch(number) {
  case 0: 
    ps.fill(255, 0, 0); 
    break;
  case 1: 
    ps.fill(0, 255, 0); 
    break;
  case 2: 
    ps.fill(0, 0, 255); 
    break;
  case 3: 
    ps.fill(255, 255, 0); 
    break;
  case 4: 
    ps.fill(255, 0, 255); 
    break;
  case 5: 
    ps.fill(0, 255, 255); 
    break;
  }
}

void keyPressed() {
  switch(key) {
  case 'j': 
    button_judge();
    break;
  case 'p':
    button_random();    
    break;
  case ENTER:
    button_solve();
    break;
  case DELETE:
    button_reset();
    break;
  case BACKSPACE:
    button_demo();
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

void mouseDragged() {
  pastMouseX = mouseX;
  pastMouseY = mouseY;
}

