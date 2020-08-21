import processing.video.Capture;
Capture Cam1, Cam2;
int xMove = 0;
void setup() {
  size(640, 480);

  final String[] cams = Capture.list();
  printArray(cams);

  ( Cam1   = new Capture(this, cams[11])  ).start();
  ( Cam2 = new Capture(this, cams[13]) ).start();
}

void captureEvent(final Capture c) {
  c.read();
}

void draw() {
  background(0);
  image(Cam1);
  //tint(225, 153, 204, 150);
  //image(Cam2,0,0);
}

void image(Capture img){
  xMove++;
  if(xMove>=width){xMove=0;}
  loadPixels(); 
  
  // Since we are going to access the image's pixels too  
  img.loadPixels();
  for (int x = 0; x < img.width; x++) {
  for (int y = 0; y < img.height; y++ ) {
    // Calculate the 1D pixel location
    
    int loc = xMove + y*img.width;
    // Get the R,G,B values from image
    float r = red   (img.pixels[loc]);
    float g = green (img.pixels[loc]);
    float b = blue  (img.pixels[loc]);
    // Calculate an amount to change brightness 
    // based on proximity to the mouse
    //float distance = dist(x,y,mouseX,mouseY);
    //float adjustBrightness = (100-distance)/200 ;  
    //r *= adjustBrightness;
    //g *= adjustBrightness;
    //b *= adjustBrightness;
    //// Constrain RGB to between 0-255
    //r = constrain(r,0,255);
    //g = constrain(g,0,255);
    //b = constrain(b,0,255);
    // Make a new color and set pixel in the window
    color c = color(random(r),random(g),random(b));
    pixels[loc] = c;
  }
}
updatePixels();
}
