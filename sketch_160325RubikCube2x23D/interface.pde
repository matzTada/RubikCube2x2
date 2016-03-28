import controlP5.*;

ControlP5 cp5;

ControlFont font;

void p5Setup() {
  font = new ControlFont(createFont("Arial", height/5/5, true));

  cp5 = new ControlP5(this);

  cp5.addButton("button_judge")
    .setPosition(width - height/5, 0 * height/5)
      .setSize(height/5, height/5)
        .setCaptionLabel("Judge")
          .getCaptionLabel().setFont(font).toUpperCase(false) //this line is important for set text size
              ;
  cp5.addButton("button_random")
    .setPosition(width - height/5, 1 * height/5)
      .setSize(height/5, height/5)
        .setCaptionLabel("Random")
          .getCaptionLabel().setFont(font).toUpperCase(false) //this line is important for set text size
              ;
  cp5.addButton("button_solve")
    .setPosition(width - height/5, 2 * height/5)
      .setSize(height/5, height/5)
        .setCaptionLabel("Solve")
          .getCaptionLabel().setFont(font).toUpperCase(false) //this line is important for set text size
              ;
  cp5.addButton("button_reset")
    .setPosition(width - height/5, 3 * height/5)
      .setSize(height/5, height/5)
        .setCaptionLabel("Reset")
          .getCaptionLabel().setFont(font).toUpperCase(false) //this line is important for set text size
              ;
  cp5.addButton("button_demo")
    .setPosition(width - height/5, 4 * height/5)
      .setSize(height/5, height/5)
        .setCaptionLabel("DEMO")
          .getCaptionLabel().setFont(font).toUpperCase(false) //this line is important for set text size
              ;
}

public void button_judge() {
  println("judge return = " + judge(surfaces));
}

public void button_random() {
  println("random");
  for (int i = 0; i < 10; i++) surfaces = executeRotateByNumber((int)random(0, 10), surfaces);
}    

public void button_solve() {
  println("solve");
  solve(7, surfaces);
}

public void button_reset() {   
  println("reset");
  surfaces = (boolean [][]) firstSurfaces.clone();
}

public void button_demo() {
  println("demo");
  int [] tempSequence = solve(7, surfaces);
  println(tempSequence);
  if (tempSequence == null) {
    println("cannnot solve!! tempSequence is null!! null null");
  } else {
    demoFlag = true;
    demoNow = 0;
    solveSequence.clear();
    println("demo");
    for (int temp : tempSequence) solveSequence.add(temp);
    print("solveSequence: ");
    for (int temp : solveSequence) print(temp + " ");
    println("");
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

