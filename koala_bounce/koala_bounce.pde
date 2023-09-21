//Valentine Ezenwelu

//Koala

int centerX;//x center of head 
int centerY;//y center of head
int Size;// size of head 
int noseX;// x center of nose
int noseY;// y center of nose
int noseSizeX;// x size of nose 
int noseSizeY;// y height of nose 
int noseHoleA1;//x nose hole1
int noseHoleB1;//y nose hole1
int noseHoleA2;//x nose hole2
int noseHoleB2;//y nose hole2
int noseHoleSize;//nose hole size
int eyeX1;//x eye 1
int eyeY1;//y eye 1
int eyeSize;//eye size
int eyeX2;//x eye 2
int eyeY2;//y eye 2
int mouthX1;//x1 mouth
int mouthX2;//x2 mouth  
int mouthY;//Y for mouth
int earX1;//x ear1
int earX2;//x ear2
int earY;//y ear
int earSize; //ear size
int earHoleSize;//earhole
final int MIN_SIZE = 100;
final int MAX_SIZE = 400;
  
void setup(){
  size(500,500);//canvas
}

void draw(){
  background(255);//white
  calcDimensions();//variables function
  setSizeXandY();//center function
  drawKoala();//draw codes function
  
}

void setSizeXandY(){
  centerX=mouseX;
  centerY=mouseY;
  Size = MIN_SIZE +(MAX_SIZE - MIN_SIZE)*(mouseY-0)/width;//size
  

}

void calcDimensions(){
  //centerX = mouseX;
  //centerY = mouseY;
  noseX = centerX;// x center of nose
  noseY = centerY;// y center of nose
  noseSizeX = Size*1/4;// x size of nose 
  noseSizeY = Size/2;// y height of nose 
  noseHoleA1 = noseX-noseSizeX/4;//x nose hole1
  noseHoleB1 = noseY+noseSizeY/4;//y nose hole1
  noseHoleA2 = noseX+noseSizeX/4;//x nose hole2
  noseHoleB2 = noseY+noseSizeY/4;//y nose hole2
  noseHoleSize = Size/15;//nose hole size
  eyeX1 = centerX - Size/4;//x eye 1
  eyeY1 = centerY - Size/8;//y eye 1
  eyeSize = Size/8;//eye size
  eyeX2 = centerX + Size/4;//x eye 2
  eyeY2 = centerY - Size/8;//y eye 2
  mouthX1 = centerX - Size/4;//x1 mouth
  mouthX2 = centerX + Size/4;//x2 mouth
  mouthY = centerY + Size/3;//y mouth
  earX1 = centerX - Size/2;//x ear1
  earX2 = centerX + Size/2;//x ear2
  earY = centerY - Size/2;//y ear
  earSize = Size/2;//ear size
  earHoleSize = Size/3;// earhole size
}

void drawKoala(){
  
  fill(#6C6C6B);//gray
  circle(earX1, earY, earSize);//ear 1
  circle(earX2, earY, earSize);//ear 2

  fill(#1C81EA);//blue
  circle(earX1, earY, earHoleSize);//earhole 1
  circle(earX2, earY, earHoleSize);//earhole 2

  fill(#6C6C6B);//gray
  circle(centerX, centerY, Size);//head 

  fill(0);//black
  ellipse(noseX,noseY,noseSizeX,noseSizeY);//NOSE 

  fill(#FFFFFF);//white
  circle(noseHoleA1,noseHoleB1,noseHoleSize);//nosehole1
  circle(noseHoleA2,noseHoleB2,noseHoleSize);//nosehole2

  fill(0);//black
  circle(eyeX1,eyeY1,eyeSize);//eye 1
  circle(eyeX2, eyeY2, eyeSize);//eye 2

  stroke(0);//black
  strokeWeight(6);//thinkness of mouth
  line(mouthX1,mouthY,mouthX2,mouthY);//mouth
}
