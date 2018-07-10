void setup(){
  size(400,400,P2D);
  QAQ = loadImage("Background.jpg");
  OAO = loadImage("XD.png");
}

PImage QAQ;//背景
PImage OAO;//咻蹦
int x,y;

void draw(){
  background(QAQ);
  image(OAO, x, y+220);
  
  if(keyPressed){
    if(x>=0 && key == 'a' || key == 'A'){
      x-=5;}
    if(x<=220 && key == 'd' || key == 'D'){
      x+=5;}
    }
  
}