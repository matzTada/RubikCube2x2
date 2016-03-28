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
