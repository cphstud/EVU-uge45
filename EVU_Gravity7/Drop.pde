class Drop {
  //egenskaber
  float xPos;
  float yPos;
  int dropColor;
  int dropRadius;
  int dropSpeedY;
  int strokeValue;

  //konstruktør

  Drop(float x, float y, int col, int rad, int speedY) {
    xPos=x;
    yPos=y;
    dropColor=col;
    dropRadius=rad;
    dropSpeedY=speedY;
    strokeValue=5;
  }


  //metoder

  void display() {
    fill(dropColor,100,100);
    circle(xPos, yPos, dropRadius);
  }

  void move() {
    yPos = yPos+dropSpeedY;
  }

  void move(int newSpeed) {
    yPos = yPos+newSpeed;
  }
}
