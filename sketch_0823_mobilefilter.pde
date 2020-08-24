import processing.video.Capture;
import spout.*;
import ddf.minim.*;

Minim minim;
AudioInput in;
Capture Cam1, Cam2;
int xMove = 0;
int yMove = 0;
int r, g, b, rc, gc, bc;
float s;

Spout spout;
void setup() {
  size(640, 480, P3D);
  spout = new Spout(this);
  spout.createSender("Spout Processing");
  final String[] cams = Capture.list();
  printArray(cams);

  ( Cam1   = new Capture(this, cams[11])  ).start();
  ( Cam2 = new Capture(this, cams[13]) ).start();
   minim = new Minim(this);
  
  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();
}

void captureEvent(final Capture c) {
  c.read();
}

void draw() {
  //background(0,10);
  //cam1();
  cam2();
  for(int i = 0; i < in.bufferSize() - 1; i++)
  {s=in.mix.get(i);}
  //spout.sendTexture();
}

void cam1(){
  imageX(Cam1);
}
void cam2(){
  //if(frameCount%4==0){
  //imageX(Cam1);
  //}else if(frameCount%4==1){
  imageX(Cam2);
//}
  //filter(THRESHOLD);
  //filter(BLUR,2);
  
  
}
void imageX(Capture img){
  //xMove=int(random(width));
  xMove+= random(10);
  if(xMove>=width){xMove=0;}

  loadPixels(); 
  
  // Since we are going to access the image's pixels too  
  img.loadPixels();
  for (int x = 0; x < img.width; x++) {
  for (int y = 0; y < img.height; y+=1 ) {
    // Calculate the 1D pixel location
     
    int loc = x + y*img.width;
    // Get the R,G,B values from image
    float r = red   (img.pixels[loc]);
    float g = green (img.pixels[loc]);
    float b = blue  (img.pixels[loc]);
    float yMove = map((1000*s),0,50,300,height-200);
    //println(s);
    //float distance = dist(x,y,xMove,yMove);
  
    //float adjustBrightness = (200-distance)/(200) ;  
    //r *= adjustBrightness;
    //g *= adjustBrightness;
    //b *= adjustBrightness;
    
    //r = constrain(r,0,255);
    //g = constrain(g,0,255);
    //b = constrain(b,0,255);
  
    color c = color(r*1,g*1,b*1);
    pixels[loc] = c;
      
  }
}
updatePixels();
}
