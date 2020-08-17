float len_m=0;
void setup() {
  size(1200, 600);
}
void draw() {
  background(0);
  thread("lenMove");
  mainDraw();
}
int collatz(int n) {
  // even
  if (n % 2 == 0) {
    return n / 2;
    // odd
  } else {
    return (n * 3 + 1)/int(random(2, 5));
  }
}
void mainDraw(){
  for (int i = 1; i < 1000; i++) {
    IntList sequence = new IntList();
    int n = i;
    do {
      sequence.append(n);
      n = collatz(n);
    } while (n != 1);
    sequence.append(1);
    sequence.reverse();
    float len = height/100.0;
    float angle = PI/3; //0.15
    resetMatrix();
    translate(width/2, height/2);
    for (int j = 0; j < sequence.size(); j++) {
      int value = sequence.get(j);
      if (value % 2 == 0) {
        rotate(angle);
      } else {
        rotate(-angle);
      }
      strokeWeight(2);
      stroke(255, 2);

      line(0, 0, -len* len_m, -len*5);
      translate(0, -len*5);
    }
    // Visualize the list
  }
}
void lenMove() {
    len_m++;
    println("len_m= " + len_m);
}
