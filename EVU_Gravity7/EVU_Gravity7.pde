
Catcher catcher;
Drop[] dropArr;

float maxRad, maxSpeed, mouseRad;
float y;
int ySpeed, unit, numberOfDrops, dropPosition;

void setup() {
  size(800, 600);
  numberOfDrops = 50;
  dropArr = new Drop[numberOfDrops];
  mouseRad = 8;
  maxRad=100;
  maxSpeed=4;
  dropPosition=10;
  catcher = new Catcher(10);
  initArr();
  colorMode(HSB);
}

void draw() {

  background(255);
  fill(123);

  if (frameCount%60==0) {
    //initArr();
    //mouseRad=10;
    //smider dråbe efter 1 sekund ca
    if (dropPosition==dropArr.length-1) {
      initArr();
      dropPosition=10;
    }
    dropPosition++;
  }

  catcher.setPos(mouseX, mouseY);
  catcher.display();

  //spillet dør hvis radius er 0
  if (catcher.catRadius < 0) {
    noLoop();
  }

  for (int i=0; i<dropPosition; i++) {
    // spør om rammer mus for hver dråb
    catcher.intersect(dropArr[i]);
    dropArr[i].move();
    dropArr[i].display();
  }
}

void drawMouse(float x, float y) {
  colorMode(RGB);
  fill(120, 100, 100);
  circle(x, y, mouseRad);
  colorMode(HSB);
}

void initArr() {
  //float x, float y, int col, int rad, int speedY
  for (int i = 0; i< dropArr.length; i++) {
    //instantiere hver dråbe (kald konstruktør)
    int tmpRad=int(random(maxRad));
    int tmpSpeed=int(random(1, maxSpeed));
    int tmpCol=int(random(255));
    float tmpX=random(width);
    float tmpY=0.0;

    Drop tmpDrop = new Drop(tmpX, tmpY, tmpCol, tmpRad, tmpSpeed);
    dropArr[i]=tmpDrop;
  }
}
