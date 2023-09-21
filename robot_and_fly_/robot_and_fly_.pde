//Valentine Ezenwelu 
// W2A2Q2
int headWidth;
int headHeight;
int headTop;
int headLeft;
int leftEyeX;
int eyeY; 
int rightEyeX;
int eyeWidth;
int eyeBallWidth;
int mouthX; 
int mouthY;
int mouthX2;
int mouthStrokeWeight;
int flyWidth =20;
int flyHeight =20;
int flyX;
int flyY;
int blueVal;


void setup(){
size(800,800);//canvas
headWidth = width*2/3;
headHeight = height/3;
headTop = (height - headHeight)/4;
headLeft= (width - headWidth)/2;
leftEyeX = (headTop + headWidth/3);
eyeY = (headLeft + headHeight/2);
rightEyeX = (headTop + headWidth*2/3);
eyeWidth = (width/10);
eyeBallWidth = (eyeWidth/2);
mouthX = (headTop+ headWidth/3);
mouthY = ( headLeft + headHeight*4/5);
mouthX2 = (headTop + headWidth*2/3);
mouthStrokeWeight = (headHeight/33);
blueVal = 0;

  flyX = width/2;
  flyY = height/2;
}


void drawRobot(){
fill (#09EA65);//green
rect (headLeft, headTop, headWidth, headHeight);//robot head

fill (#FAF8F7);//white
circle (leftEyeX, eyeY, eyeWidth);//left eye
circle (rightEyeX, eyeY, eyeWidth);//right eye

fill (#050100);//black
circle (leftEyeX, eyeY, eyeBallWidth);//left eyeball
circle (rightEyeX, eyeY, eyeBallWidth);//right eyeball

stroke (0);// black
strokeWeight (mouthStrokeWeight);
line (mouthX, mouthY, mouthX2, mouthY);//mouth
}
//draw fly
void drawFly() {
  stroke(0);
  strokeWeight(1);
  fill(125);//make the fly grey
  
  //caculate small random movement
  int xdif = (int)random(-10,10);
  int ydif = (int)random(-10,10);
  
  //make sure fly stays on canvas
  flyX = max(0, flyX + xdif);
  flyY = max(0, flyY +ydif);
  flyX = min(flyX, width);
  flyY = min(flyY, height);
  
  
  //draw fly body
  ellipse(flyX, flyY, flyWidth, flyHeight);
  
  //fly eyes
  fill(0);//black eyes
  stroke(255);
  ellipse(flyX-flyWidth/3, flyY-flyHeight/2,5,5);
  ellipse(flyX+flyWidth/3, flyY-flyHeight/2, 5,5);
  
  //fly wings
  fill(200);//lighter coloured wings 
  noStroke();//no outline
  ellipse(flyX-flyWidth/2, flyY, 10,5);
  ellipse(flyX+flyWidth/2,flyY,10,5);
}

void draw(){
  blueVal+=1;
  blueVal = blueVal%256;
background(100,100,blueVal);
  drawRobot();
  drawFly();
}
