int [] r1P = {12, 13, 2, 3, 0, 1, 6, 7, 4, 5, 10, 11, 8, 9, 14, 15, 17, 19, 16, 18, 20, 21, 22, 23};
int [] r1N = {4, 5, 2, 3, 8, 9, 6, 7, 12, 13, 10, 11, 0, 1, 14, 15, 18, 16, 19, 17, 20, 21, 22, 23};
int [] r1T = {8, 9, 2, 3, 12, 13, 6, 7, 0, 1, 10, 11, 4, 5, 14, 15, 19, 18, 17, 16, 20, 21, 22, 23};
int [] r2P = {0, 1, 14, 15, 4, 5, 2, 3, 8, 9, 6, 7, 12, 13, 10, 11, 16, 17, 18, 19, 22, 20, 23, 21};
int [] r2N = {0, 1, 6, 7, 4, 5, 10, 11, 8, 9, 14, 15, 12, 13, 2, 3, 16, 17, 18, 19, 21, 23, 20, 22};
int [] r2T = {0, 1, 10, 11, 4, 5, 14, 15, 8, 9, 2, 3, 12, 13, 6, 7, 16, 17, 18, 19, 23, 22, 21, 20};
int [] r3P = {2, 0, 3, 1, 16, 5, 18, 7, 8, 9, 10, 11, 12, 22, 14, 20, 15, 17, 13, 19, 4, 21, 6, 23};
int [] r3N = {1, 3, 0, 2, 20, 5, 22, 7, 8, 9, 10, 11, 12, 18, 14, 16, 4, 17, 6, 19, 15, 21, 13, 23};
int [] r3T = {3, 2, 1, 0, 15, 5, 13, 7, 8, 9, 10, 11, 12, 6, 14, 4, 20, 17, 22, 19, 16, 21, 18, 23};
int [] r4P = {0, 1, 2, 3, 4, 17, 6, 19, 9, 11, 8, 10, 23, 13, 21, 15, 16, 14, 18, 12, 20, 5, 22, 7};
int [] r4N = {0, 1, 2, 3, 4, 21, 6, 23, 10, 8, 11, 9, 19, 13, 17, 15, 16, 5, 18, 7, 20, 14, 22, 12};
int [] r4T = {0, 1, 2, 3, 4, 14, 6, 12, 11, 10, 9, 8, 7, 13, 5, 15, 16, 21, 18, 23, 20, 17, 22, 19};

boolean judge(boolean tempSurfaces[][]) {
  boolean tempANDLAYER = true;  
  for (int j = 0; j < 5; j++) {
    boolean tempAND = true;
    for (int i = 0; i < 24; i += 4) {
      boolean tempXNOR = !(tempSurfaces[j][i] ^ tempSurfaces[j][i+1]) & !(tempSurfaces[j][i+1]^tempSurfaces[j][i+2]) 
        & !(tempSurfaces[j][i+2]^tempSurfaces[j][i+3]) & !(tempSurfaces[j][i]^tempSurfaces[j][i+3]);
      tempAND &= tempXNOR;
    }
    tempANDLAYER &= tempAND;
  }
  return tempANDLAYER;
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

int [] solve(int depth, boolean[][] targetSurfaces) { //I want to do Widht Prioritized Search
  long startMillis = millis();
  int [] executeSequence = new int [depth];
  for (int i = 0; i < depth; i++) {
    executeSequence[i] =  0;
  }
  executeSequence[0] = -1;

  long power = 1;
  for (int i = 0; i < depth; i++) power *= 12;

  for (long j = 0; j < power; j++) {
    //count up executeSequence
    executeSequence[0] += 1;
    for (int i = 0; i < depth - 1; i++) {
      if (executeSequence[i] >= 12) { //like Duodecimal (12 shinsu)
        executeSequence[i] = 0;
        executeSequence[i + 1] += 1;
      } else break;
    }

    if (executeSequence[depth - 1] >= 12) return null;

    //skip sequence
    boolean skipFlag = false;
    for (int i = 0; i < depth - 1; i++) {
      if (
        ((0 <= executeSequence[i] && executeSequence[i] <= 2) && (0 <= executeSequence[i + 1] && executeSequence[i + 1] <= 2))
        || ((3 <= executeSequence[i] && executeSequence[i] <= 5) && (3 <= executeSequence[i + 1] && executeSequence[i + 1] <= 5))
        || ((6 <= executeSequence[i] && executeSequence[i] <= 8) && (6 <= executeSequence[i + 1] && executeSequence[i + 1] <= 8))
        || ((9 <= executeSequence[i] && executeSequence[i] <= 11) && (9 <= executeSequence[i + 1] && executeSequence[i + 1] <= 11))
        ) {
        skipFlag = true;
        break;
      }
    }
    if (skipFlag) continue;
    else {
      print("start solve j: " + j + " ");
      for (int i = 0; i < depth; i++) {
        print(executeSequence[i] + " ");
      }
      println("");

      boolean [][] processedSurfaces = targetSurfaces;
      for (int i = 0; i < executeSequence.length; i++) {
        processedSurfaces = executeRotateByNumber(executeSequence[i], processedSurfaces);
        if (judge(processedSurfaces)) {
          println(" ===== solved!! ===== " + (i + 1) + " steps");
          println("time to solve: " + (millis() - startMillis) + "ms");
          print("Let's do it!! as following: ");
          int [] returnSequence = new int [i + 1];
          for (int k = 0; k < i + 1; k++) {
            print(executeSequence[k] + " ");
            returnSequence[k] = executeSequence[k];
          }
          println("");
          return returnSequence;
        }
      }
    }
  }

  println("Oh, cannot solve... when depth = " + depth);
  return null;
}
