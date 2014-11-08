Pfont f;

void setup()
{
  size(1000,1000);
  background(0,0);
  f = createFont("courier", 32, true);
  textFont(f, 32); 
  fill(255);
  stroke(255, 255, 255);
  z = 200;
  l = z/2 + z/sqrt(2);
  radius = 0;
  tick = 0;
  odd = true;
}

void createOctagon(x, y) {
  n = 8;
  centre = new PVector(x,y);
  points = [];
  
  points[0] = new PVector(centre.x - z/2, centre.y - l);
  points[1] = new PVector(centre.x + z/2, centre.y - l);
  points[2] = new PVector(centre.x + l, centre.y - z/2);
  points[3] = new PVector(centre.x + l, centre.y + z/2);
  points[4] = new PVector(centre.x + z/2, centre.y + l);
  points[5] = new PVector(centre.x - z/2, centre.y + l);
  points[6] = new PVector(centre.x - l, centre.y + z/2);
  points[7] = new PVector(centre.x - l, centre.y - z/2);
  
  
  cpoints = [];
  

  cpoints[2] = new PVector(centre.x, centre.y - l);
  cpoints[3] = new PVector(centre.x, centre.y + l);
  cpoints[4] = new PVector(centre.x + l, centre.y);
  cpoints[5] = new PVector(centre.x - l, centre.y)
  
  foreach(points in cpoints) {
    
  }
  
  
  i = 0;
  for (i = 0; i < n; i++) {
    line(points[i].x, points[i].y, points[(i + 1) % n].x, points[(i + 1) % n].y);
  }
  
}

void draw(){

  createOctagon(width/2, height/2);
  
  //text(sqrt(2)/2, width/2, height/2);
  tick++;
  
}


