void setup(){
  size(750,750);
 noStroke();
}
void draw(){
  ellipse(375,588,50,50);
  thing(255,155,255);
}

void thing(int x, int y,int z){
  rect(x,y,z,50,50);
  ellipse(x+50,y+25,50,50);
  ellipse(x,y+25,50,50);
}