import controlP5.*;

ControlP5 cp5;

void p5Setup() {
  cp5 = new ControlP5(this);

  cp5.addButton("button_judge")
    .setPosition(width - height/5, 0 * height/5)
      .setSize(height/5, height/5)
        ;
  cp5.addButton("button_random")
    .setPosition(width - height/5, 1 * height/5)
      .setSize(height/5, height/5)
        ;
  cp5.addButton("button_solve")
    .setPosition(width - height/5, 2 * height/5)
      .setSize(height/5, height/5)
        ;
  cp5.addButton("button_reset")
    .setPosition(width - height/5, 3 * height/5)
      .setSize(height/5, height/5)
        ;
  cp5.addButton("button_demo")
    .setPosition(width - height/5, 4 * height/5)
      .setSize(height/5, height/5)
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

