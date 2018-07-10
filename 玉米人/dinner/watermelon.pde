class watermelon {
  float watermelonX,watermelonY,watermelonR=50;
  boolean on=false;
  int r=(int)random(255);
  int g=(int)random(150);
  int b=(int)random(70);


  void start(float x, float y) {
    watermelonX=x-25;
    watermelonY=y;
    on=true;
  }


  void fly() {
    if (on==true) {
      watermelonY-=10;
      if (watermelonY<0)
        on=false;
    }
  }

  void display() {
    if (on==true) {
      fill(r, g, 90);
      noStroke();
      image(watermelon, watermelonX, watermelonY, watermelonR, watermelonR);
    }
  }
}