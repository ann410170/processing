float time = 0;
float nt = 400;
float tt = 1;
float tx;
void setup(){
  //fullScreen(SPAN);
  size(1200,600);
  surface.setResizable(true);
  stroke(200);
  strokeWeight(1.5);
}
void draw(){
  noCursor();
  float x=100;
  background(0);
  tx = map(mouseX,0,width,0.006,0.02);
  if (keyPressed == true) {
  nt = lerp(nt,5,0.01);
  tt = lerp(tt,5,0.03);
  } else{
  nt = lerp(nt,400,0.01);
  tt = lerp(tt,1,0.01);
  }
  while(x<width-100){
    point(x, height/4+height*(noise(x/nt, time))*0.5);
    x=x+tt;
  }
  time += tx;
  //println(mouseX);
}
