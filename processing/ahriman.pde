Pfont f;

void setup()
{
  size(1000,500);
  background(0,0);
  f = createFont("courier", 32, true);
  textFont(f, 32); 
  fill(255);
  stroke(255, 255, 255);
  z = 40;
  l = z/2 + z/sqrt(2);
  radius = 0;
  tick = 0;
  odd = true;
  r = 10;
  j = 0;
}


void createSquare(x, y) {
  n = 4;
  centre = new PVector(x,y);
  points = [];
  points[0] = new PVector(centre.x - z/2, centre.y - z/2);
  points[1] = new PVector(centre.x + z/2, centre.y - z/2);
  points[2] = new PVector(centre.x + z/2, centre.y + z/2);
  points[3] = new PVector(centre.x - z/2, centre.y + z/2);
  
  // draw edges
  /*
  i = 0;
  for (i = 0; i < n; i++) {
    line(points[i].x, points[i].y, points[(i + 1) % n].x, points[(i + 1) % n].y);
  }
  */
  
  // Coordinates of contact points counterclockwise from top
  cpoints = [];
  cpoints[0] = new PVector(centre.x, centre.y - z/2);
  cpoints[1] = new PVector(centre.x - z/2, centre.y);
  cpoints[2] = new PVector(centre.x, centre.y + z/2);
  cpoints[3] = new PVector(centre.x + z/2, centre.y);
  
  
  // coordinates of ray intersections 
  i = 0;
  ipoints = [];
  for (angle = PI/4; angle < TWO_PI; angle += PI/2) {
    ipoints[i] = new PVector(centre.x + cos(angle)*r, centre.y - sin(angle)*r);
    //ellipse(ipoints[i].x, ipoints[i].y, 2, 2);
    i++;
  }
  
  for (i = 0; i < 4; i++) {
    line(cpoints[i].x, cpoints[i].y, ipoints[i].x, ipoints[i].y);
    line(cpoints[i].x, cpoints[i].y, ipoints[(i + 1) % 4].x, ipoints[(i + 1) % 4].y);
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
  
  // draw edges
  /*
  i = 0;
  for (i = 0; i < n; i++) {
    line(points[i].x, points[i].y, points[(i + 1) % n].x, points[(i + 1) % n].y);
  }
  */
  
  
  k = z/2 + z/(2*sqrt(2));
  cpoints = [];
  
  // Coordinates of contactpoints counterclockwise from right

  cpoints[0] = new PVector(centre.x + l, centre.y);
  cpoints[1] = new PVector(centre.x + k, centre.y - k);
  cpoints[2] = new PVector(centre.x, centre.y - l);
  cpoints[3] = new PVector(centre.x - k, centre.y - k);
  cpoints[4] = new PVector(centre.x - l, centre.y);
  cpoints[5] = new PVector(centre.x - k, centre.y + k);
  cpoints[6] = new PVector(centre.x, centre.y + l);
  cpoints[7] = new PVector(centre.x + k, centre.y + k);

  // display contact points
  /*
  fill(255);
  i = 0;
  for (i = 0; i < n; i++) {
    ellipse(cpoints[i].x, cpoints[i].y, 2, 2);
  }
  */
  

  // coordinates of ray intersections 
  f = l / (k/2);
  i = 0;
  ipoints = [];
  for (angle = -PI/8; angle <= TWO_PI; angle += PI/4) {
    ipoints[i] = new PVector(centre.x + cos(angle)*(r*f), centre.y - sin(angle)*(r*f));
    //ellipse(ipoints[i].x, ipoints[i].y, 2, 2);
    i++;
  }
  
  
  // stars!
  
  i = 0;
  for (i = 0; i < 8; i++) {
    line(cpoints[i].x, cpoints[i].y, ipoints[i].x, ipoints[i].y);
    line(cpoints[i].x, cpoints[i].y, ipoints[(i + 1) % 8].x, ipoints[(i + 1) % 8].y);
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

void draw() {
  //j += 0.01;
  //r = sin(j)*z;
  background(0,0);
  createGrid();
  //createPolygon(width/2, height/2);
  
  //text(sqrt(2)/2, width/2, height/2);
  tick++;
  
}


