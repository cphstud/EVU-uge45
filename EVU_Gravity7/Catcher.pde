class Catcher {
  // egenskaber
  float xPos;
  float yPos;
  int catColor;
  float catRadius;
  // konstruktør
  
  Catcher(float catRad) {
    catRadius=catRad;
    xPos = width/2;
    yPos = height-catRad;
    catColor = 100;
  }
  // metoder
  
  void display() {
    fill(catColor,100,100);
    circle(xPos,yPos,catRadius);
  }
  
  void setPos(float x, float y) {
    xPos=x;
    yPos=y;
  }
  
  void intersect(Drop drop) {
    float mDist = dist(xPos,yPos,drop.xPos,drop.yPos);
    if (mDist < (catRadius + drop.dropRadius)) {
      // så intersection
      if (catRadius < drop.dropRadius) {
        catRadius = catRadius - 1;
      } else {
        catRadius = catRadius + 1;  
        // skyder dråber væk
        drop.xPos=1000;
      }
    }
    
  }
}
