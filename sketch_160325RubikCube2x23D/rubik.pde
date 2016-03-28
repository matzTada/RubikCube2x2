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
boolean pastJudge = false;
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

boolean[][] rotateCube(int [] sequence, boolean[][] tempSurfaces) { //smarter way
  boolean [][] returnSurfaces = new boolean[5][24];
  for (int j = 0; j < 5; j++) {
    for (int i = 0; i < 24; i++) {
      returnSurfaces[j][i] = tempSurfaces[j][sequence[i]];
    }
  }
  return returnSurfaces;
}

boolean[][] executeRotateByNumber(int commandNumber, boolean[][] tempSurfaces) {
  switch(commandNumber) {
  case 0: 
    return rotateCube(r1P, tempSurfaces); 
  case 1: 
    return rotateCube(r1N, tempSurfaces); 
  case 2: 
    return rotateCube(r1T, tempSurfaces); 
  case 3: 
    return rotateCube(r2P, tempSurfaces); 
  case 4: 
    return rotateCube(r2N, tempSurfaces); 
  case 5: 
    return rotateCube(r2T, tempSurfaces); 
  case 6: 
    return rotateCube(r3P, tempSurfaces); 
  case 7: 
    return rotateCube(r3N, tempSurfaces); 
  case 8: 
    return rotateCube(r3T, tempSurfaces); 
  case 9: 
    return rotateCube(r4P, tempSurfaces); 
  case 10: 
    return rotateCube(r4N, tempSurfaces); 
  case 11: 
    return rotateCube(r4T, tempSurfaces);
  default:
    return new boolean[5][24];
  }
}
