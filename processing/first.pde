Pfont f;

void setup()
{
  size(600,200);
  background(0,0);
  f = createFont("courier", 32, true);
  textFont(f, 32); 
  fill(255);
  stroke(255, 255, 255);
  radius = 0;
  tick = 0;
}



class Triangle {
  
  PVector centre;
  PVector one;
  PVector two;
  PVector three;
  
  int r = 1;
  
  Triangle(x, y, r) {
    
    centre = new PVector(x,y);
    
    one = new PVector(centre.x, centre.y + r);
    two = new PVector(cos(TWO_PI/3 + PI/2)*r, sin(TWO_PI/3 + PI/2)*r);
    three = new PVector(cos(PI/2 - TWO_PI/3)*r, sin(PI/2 - TWO_PI/3)*r);
    two.add(centre);
    three.add(centre);
    
    /*
    x2 = cos(TWO_PI/3 + PI/2)*r + x;
    y2 = sin(TWO_PI/3 + PI/2)*r + y;
    
    x3 = cos(PI/2 - TWO_PI/3)*r + x;
    y3 = sin(PI/2 - TWO_PI/3)*r + y;
    */
    return true;
  }
  
  void draw() {

    
    line(one.x,one.y,two.x,two.y);
    line(two.x,two.y,three.x,three.y);
    line(three.x,three.y,one.x,one.y);
  }
  
}


void draw(){
  
  tick++;
  
  background(0,0);
  textAlign(CENTER, CENTER);
  //text("Binary Sunset", width/2, height/2);
  text(cos(PI/3), width/2, height/2);
  
  //radius = sin(tick/150)*100;
  //Triangle t = new Triangle(300, 100, radius);
  //t.draw();
  
  //text('Binary Sunset', width/2, height/2);
  // bezier(30, 20,  80, 5,  80, 75,  30, 75);
  
}


