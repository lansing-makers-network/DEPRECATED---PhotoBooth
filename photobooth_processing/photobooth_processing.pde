
import processing.video.*;
Capture cam2;
Capture cam1;
PGraphics left;
PGraphics right;

void setup() {
    size(640, 480);
    left = createGraphics(640, 480);
    right = createGraphics(640, 480);    
    String[] cameras = Capture.list();
    
    if (cameras.length == 0) {
      println("There are no cameras available.");
      exit();
    } else {  
      println("Cameras:");
      
      for (int i = 0; i < cameras.length; i++) {
        println(i+": "+cameras[i]);
      }
      cam1 = new Capture(this, cameras[65]);
      cam2 = new Capture(this, cameras[23]);
      cam2.start();
      cam1.start();
    }
}

void draw() {
  if (cam1.available() == true && cam2.available() == true) {
    cam1.read();
    cam2.read();
    
    //Cyan Image
    left.beginDraw();
    left.image(cam1, 0, 0);
    left.tint(50, 190, 190);
    left.endDraw();
    
    //Red Image
    right.beginDraw();
    right.image(cam2, 0, 0);
    right.tint(255,50, 50);
    right.endDraw();
    
    
    image(right, 0, 0);
    
    blend(left, 0, 0, right.width, right.height, 0, 0, left.width, left.height, SCREEN);
  }
 

  
  
  
}
