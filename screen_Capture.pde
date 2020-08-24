import java.awt.Robot;
import java.awt.image.BufferedImage;
import java.awt.Rectangle;
 
Robot robot;
 
void setup() {
  size(640, 740);
  try {
    robot = new Robot();
  } 
  catch (Exception e) {
    println(e.getMessage());
  }
}
 
void draw() {
  noCursor();
  background(0);
  Rectangle r = new Rectangle(0, 0, 640, 740);
  BufferedImage img1 = robot.createScreenCapture(r);
  PImage img2 = new PImage(img1);
  image(img2, 0, 0);
  filter (INVERT);
}
