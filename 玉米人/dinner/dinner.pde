watermelon[]watermelons;
PImage cornman, potato, back, watermelon;
int num=1000, cur=0, count=0, hp=30;
int dif=250;//difficult
float speed=6;
int potatoX []=new int [1000];
float potatoY[]=new float [1000];
boolean isLife[]=new boolean [1000];
boolean start = false;

void setup() {
  size(850, 700,P2D);
  watermelons=new watermelon[num];
  cornman=loadImage("cornman.png");
  potato=loadImage("uplay.png");
  back=loadImage("back.jpg");
  watermelon=loadImage("watermelon.png");

  for (int i=0; i<1000; i++) {
    watermelons[i]=new watermelon();
  }
  for (int i=0; i<1000; i++) {
    potatoX [i]=(int)random(770);
    potatoY[i]=-(int)random(500)*dif;
    isLife[i]=true;
  }
}

void draw() {
  if (start==false) {
    background(255);
    fill(0);
    textSize(30);
    text("Use watermelon to clean the windows and get password", 0, 320);
    textSize(80);
    text("Press any key to start", 0, 500);
    textSize(60);
    text("kill 50  patato to win", 0, 430);
  }
  if (keyPressed) {
    start=true;
  }
  if (start==true) {
    if (count<100&&hp>0) {
      image(back, 0, 0, 850, 700);
      fill(0, 255, 255);
      textSize(30);
      text("Kill:"+count, 10, 680);         
      text("Blood:"+hp, 650, 680);   
      image(cornman, mouseX-50, 550, 100, 100);  
      for (int i=0; i<num; i++) {
        watermelons[i].fly();
        watermelons[i].display();
        if (isLife[i]) {
          image(potato, potatoX [i], potatoY [i], 100, 100);
          potatoY[i]+=speed;         
          if (potatoY[i]>700) {
            potatoY[i]=0;
            potatoX [i]=(int)random(770);
            hp--;                             
          }
        }
      }  
      for (int i=0; i<1000; i++) {
        for (int j=0; j<1000; j++) {
          if (isLife[j]&&watermelons[i].on&&watermelons[i].watermelonX<potatoX[j]+50&&watermelons[i].watermelonX>potatoX[j]-50&&watermelons[i].watermelonY<potatoY[j]+50&&watermelons[i].watermelonY>potatoY[j]-50)
          {
            count++;
            isLife[j]=false;           
            watermelons[i].on=false;
          }
        }
      }
    }
    
    
    
    else if (count==100) {
      background(255);
      image(cornman, 10, 20, 500, 500);
      fill(0);
      textSize(50);
      text("You are winner!", 450, 300);
      text("Password = ", 0, 590);
    }
    
    
    if (hp<=0) {
      background(255);
      image(potato, 10, 20, 500, 500);
      fill(0);
      textSize(50);
      text("You lose..", 450, 300);
      text("again....?", 550, 690);
      if (mousePressed==true&&mouseX>545&&mouseX<800&&mouseY>640&&mouseX<700) {
        
        count=0;
        hp=30;
        for (int i=0; i<1000; i++) {
          isLife[i]=true;
          potatoX[i]=(int)random(770);
          potatoY[i]=-(int)random(500)*dif;
        }
      }
    }
  }
}


void mousePressed() {
  watermelons[cur].start(mouseX, 510);
  cur++;
  if (cur==num)
    cur=0;
}