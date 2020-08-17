import processing.sound.*;
Amplitude amp;
AudioIn in;
int bands = 512;
float[] spectrum = new float[bands];

float len_m=0;
float len_mm;

void setup() {
  //fullScreen();
  size(1200,600);
   amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
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
void mainDraw() {
  //println(amp.analyze());
  for (int i = 1; i < 1000; i++) {
    IntList sequence = new IntList();
    int n = i;
    do {
      sequence.append(n);
      n = collatz(n);
    } while (n != 1);
    sequence.append(1);
    sequence.reverse();
    float len = height/2000.0; //*size / 2000
    float angle = PI/100; //*100
    resetMatrix();
    translate(width/2, height/2);
    for (int j = 0; j < sequence.size(); j++) {
      int value = sequence.get(j);
      if (value % 2 == 0) {
        rotate(angle);
        //translate(len*8,len*0.1);
      } else {
        
        rotate(-angle* len_m*0.1); //*0.1 / 10 / 5000 / random
      }
      strokeWeight(1);
      stroke(255, 2);
      translate(-len*amp.analyze()*1000,0); //*1000
      line(0, 0, -len* len_mm, -len* len_mm);
      translate(len*amp.analyze()*1000,0); //*1000
    }
    // Visualize the list
  }
  }

void lenMove() {
  len_m++;
  len_mm = len_m %5 *amp.analyze();
  //println("len_m= " + len_m);
}
