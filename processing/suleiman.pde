Pfont f;

void setup()
{
  size(1000,1000);
  background(0,0);
  f = createFont("courier", 32, true);
  textFont(f, 32); 
  fill(255);
  stroke(255, 255, 255);
  z = 20;
  l = z/2 + z/sqrt(2);
  radius = 0;
  tick = 0;
  odd = true;
}


void createSquare(x, y) {
  n = 4;
  centre = new PVector(x,y);
  points = [];
  points[0] = new PVector(centre.x - z/2, centre.y - z/2);
  points[1] = new PVector(centre.x + z/2, centre.y - z/2);
  points[2] = new PVector(centre.x + z/2, centre.y + z/2);
  points[3] = new PVector(centre.x - z/2, centre.y + z/2);
    
  i = 0;
  for (i = 0; i < n; i++) {
    line(points[i].x, points[i].y, points[(i + 1) % n].x, points[(i + 1) % n].y);
  }
  
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
  
  i = 0;
  for (i = 0; i < n; i++) {
    line(points[i].x, points[i].y, points[(i + 1) % n].x, points[(i + 1) % n].y);
  }
  
}

void createPolygon(x, y) {
  if (odd) {
    createSquare(x, y);
  } else {
    createOctagon(x, y);
  }
  odd = !odd;
}

void createGrid() {
  // make sure grid always starts with the same polygon type
  odd = false;
  for (y = 0; y < height; y = y + z/2 + l) {
    oldodd = odd;
    for(x = 0; x < width; x = x + z/2 + l) {
      createPolygon(x, y);
    }
    // make sure to switch polygon type
    odd = !oldodd;
  }
}

void draw(){
  background(0,0);
  createGrid();
  //createPolygon(width/2, height/2);
  
  //text(sqrt(2)/2, width/2, height/2);
  tick++;
  
}


