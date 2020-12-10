class Drop {
  // egenskaber
  float xPos;
  float yPos;
  int dropColor;
  float dropRadius;
  int dropSpeed;
  int dropSpeedX;
  int direction;

  // konstruktør
  Drop(float x, float y, int col, float rad, int speed) {
    xPos = x;
    yPos = y;
    dropColor = col;
    dropRadius = rad;
    dropSpeed = speed;
    direction = 1;
    dropSpeedX = 0;
  }
  Drop(float x, float y, int col, float rad, int speed, int speedX) {
    xPos = x;
    yPos = y;
    dropColor = col;
    dropRadius = rad;
    dropSpeed = speed;
    dropSpeedX = speedX;
  }
  // metoder

  void move() {
    yPos=yPos+dropSpeed;
  }

  void moveX() {
    xPos=xPos+(dropSpeedX*direction);
  }
  void display() {
    fill(dropColor, 100, 100);
    circle(xPos, yPos, dropRadius);
  }
  //suicide()
  void suicide() {
    xPos=width*10;
    yPos=height*10;
  }

  boolean interSect(Drop drop) {
    boolean inRange = false;
    float mDist = dist(xPos, yPos, drop.xPos, drop.yPos);
    if (mDist < (dropRadius+drop.dropRadius)) {
      print(" in range ");
      inRange = true;
      direction=direction*-1;
    }
    return inRange;
  }
}
