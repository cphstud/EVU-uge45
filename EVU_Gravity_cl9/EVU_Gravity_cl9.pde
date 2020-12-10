Drop drop;
Catcher catcher;
Drop[] drops;
float maxRad, maxSpeed, mouseRad;
int unit, numOfDrops, dropFrequency, dropCounter;

void setup() {
  size(800, 600);
  numOfDrops=100;
  mouseRad = 8;
  maxRad = 70;
  maxSpeed = 4;
  dropFrequency = 30;
  dropCounter=10;
  drops = new Drop[numOfDrops];
  initArr();
  colorMode(HSB);
}

void draw() {
  background(255);
  if (frameCount%dropFrequency == 0) {
    dropCounter++;
  }
  catcher.setPos(mouseX, mouseY);
  catcher.display();
  for (int i = 0; i<dropCounter; i++) {
    if (catcher.interSect(drops[i])) {
      println("done ..");
    } 
    for (int j=0; j<dropCounter; j++) {
      if (j!=i) {
        drops[i].interSect(drops[j]);
      }
    }
    drops[i].move();
    drops[i].display();
  }
}

void initArr() {
  catcher = new Catcher();
  for (int i=0; i<numOfDrops; i++) {
    float rad=random(maxRad);
    int speed=int(random(1, maxSpeed));
    int col=int(random(255));
    float xPos=random(1, width-maxRad);
    float yPos=0;
    drop = new Drop(xPos, yPos, col, rad, speed);
    drops[i]=drop;
  }
}
