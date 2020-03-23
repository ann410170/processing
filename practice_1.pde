int num=4000;
float t, t1, t2;

void setup() {
  size(800, 800);
  strokeWeight(1);
}

float x1(float t) {
  float nt=cos(t*80.0)*30;
  return 200+(50+nt)*cos(t*6.28);
}

float x2(float t) {
  float nt=cos(t*80.0)*30;
  return 600-(50+nt)*cos(t*6.28*2.0);
}

float y1(float t) {
  float nt=sin(t*80.0)*50;
  return height/2+(50+nt)*sin(t*6.28);
}

float y2(float t) {
  float nt=sin(t*80.0)*50;
  return height/2+(50+nt)*sin(t*6.28*2.0);
}

void draw() {
  t=((1.0*frameCount)/600.0)%3;
  t1=((1.0*frameCount)/750.0)%5;
  t2=((1.0*frameCount)/500.0)%5;
  background(10);
  stroke(150);
  strokeWeight(1.5);
  pushMatrix();
  ellipse(x1(t+0.2), y1(t1+0.2), 10, 10);
  popMatrix();
  pushMatrix();
  ellipse(x2(t2), y2(t1), 10, 10);
  popMatrix();
  
  float delay=0.2;
  noFill();
  beginShape();
    for (int j=0; j<num; j++) {
    float be=(1.0*j/num);
    float x=0;
    float y=0;
    x=lerp(x2(t2-delay*be), (x1(t+delay*be)), be);
    y=lerp(y2(t1-delay*be), (y1(t1+delay*be)), be);
    vertex(x, y);
    }
  endShape();
}
