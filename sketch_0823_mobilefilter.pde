import processing.video.Capture;
import spout.*;
Capture Cam1, Cam2;
int xMove = 0;
int r, g, b;
float angle;
float jitter;
Spout spout;
void setup() {
  size(640, 480, P3D);
  spout = new Spout(this);
  spout.createSender("Spout Processing");
  final String[] cams = Capture.list();
  printArray(cams);

  ( Cam1   = new Capture(this, cams[11])  ).start();
  ( Cam2 = new Capture(this, cams[13]) ).start();
}

void captureEvent(final Capture c) {
  c.read();
}

void draw() {
  //background(0);
  //thread("cam1");  
  //cam1();
  cam2();
  //spout.sendTexture();
}

void cam1(){
  
  imageX(Cam1);
}
void cam2(){
  
  rotate(c);
  imageX(Cam2);
  rotateX(radians(60));
  //filter(THRESHOLD);
  //filter(BLUR);
  
  
}
void imageX(Capture img){
  //xMove=int(random(width));
  xMove+= random(10);
  if(xMove>=width){xMove=0;}
  loadPixels(); 
  
  // Since we are going to access the image's pixels too  
  img.loadPixels();
  for (int x = 0; x < img.width; x++) {
  for (int y = 0; y < img.height; y++ ) {
    // Calculate the 1D pixel location
     
    int loc = x + y*img.width;
    // Get the R,G,B values from image
    float r = red   (img.pixels[loc]);
    float g = green (img.pixels[loc]);
    float b = blue  (img.pixels[loc]);
    // Calculate an amount to change brightness 
    // based on proximity to the mouse
    //float distance = dist(x,y,xMove,mouseY);
    //float adjustBrightness = (100-distance)/100 ;  
    //r *= adjustBrightness;
    //g *= adjustBrightness;
    //b *= adjustBrightness;
    //// Constrain RGB to between 0-255
    //r = constrain(r,0,255);
    //g = constrain(g,0,255);
    //b = constrain(b,0,255);
    // Make a new color and set pixel in the window
    color c = color(r*1,g*1,b*1);
    pixels[loc] = c;
  }
}
updatePixels();
}
