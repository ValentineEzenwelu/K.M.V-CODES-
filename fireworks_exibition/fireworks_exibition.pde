/* Ezenwelu Valentine
 Fireworks exibition*/
 // variable declearation
float fireworksX;//x cordinate of firework
float fireworksY;// y cordinate of firework
float oldfireworksX;// old firework x cordinate
float oldfireworksY;// oild fireworkY cordinate
float fireworksYSpeed;// speed of fire work
float targetX;// taget of fire work x cordinate
float targetY;// target of fire work y cordinate 
float explosion;// explosion 
 
int numLines;// number of lines
int duration;// explosion duration
boolean fireworkLaunched;// launch of fire works
boolean fireworkExplosion;// explosion of fireworks
boolean fireworkVanish;// vanishing of fireworks
color lineColors;//colour of lines
color explosionColor;// colour of explosion 

void setup() {
  size(1000, 1000);// canvas
  fireworkReleased();// realeased function
}

void draw() {
  background(0);// black
    fireWorkLaunching();// lunch function
    fireworkExplosion();// explosion function
     vanishingFirework();// vanishing function
    
 
}
// relasing the firework from the bottom of the canvas tio the top 
void fireworkReleased() {// realeased function
  fireworksX = oldfireworksX = random(50, width-100);
  fireworksY = oldfireworksY = height;
  targetX = random(width);// width is at random
  targetY = random(0,height/4);
  fireworksYSpeed = random(3,8);
  numLines = int(random(6, 15));
  duration = int(random(width/18,width / 4));
  for (int i = 0; i < numLines; i++) {
    lineColors = color(random(255), random(255), random(255));// random colour
  }
  fireworkLaunched = true;
  fireworkExplosion = false;
  fireworkVanish = false;
}
//causing the fire works to release
void releasedAct() {
  oldfireworksX = fireworksX;
  oldfireworksY = fireworksY;
  if (fireworksY > targetY) {
    fireworksY -= fireworksYSpeed;
  } else {
    explodeFirework();
  }
}
// fire works explosion function
void explodeFirework() {
  explosion = 0;
  fireworkLaunched = false;
  fireworkExplosion = true;
  fireworkVanish = false;
  explosionColor = lineColors; 
}
// causing the fireworks to explode
void explosionAct() {
  if (explosion < duration) {
    explosion += 1;
  } else {
    vanishFirework();
  }
}
// firework vanishing function
void vanishFirework() {
  fireworkLaunched = false;
  fireworkExplosion = false;
  fireworkVanish = true;
}
// launch function for fireworks
 void fireWorkLaunching(){
 if (fireworkLaunched) {
    releasedAct();
    strokeWeight(1);
    stroke(255);

    fill(random(255), random(255), random(255));
    ellipse(fireworksX, fireworksY, 10, 10);
    line(fireworksX, fireworksY, fireworksX, fireworksY + 15);
  }
}
// function for fireworks explosion
void fireworkExplosion(){
  if (fireworkExplosion) {
    explosionAct();
    strokeWeight(4);
    stroke(explosionColor);
    for (int i = 0; i < numLines; i++) {
      float angle = i * TWO_PI / numLines;
      float lineX = fireworksX + cos(angle) * explosion;
      float lineY = fireworksY + sin(angle) * explosion;
      float lineX2 = fireworksX + cos(angle) * explosion*1/2;
      float lineY2 = fireworksY + sin(angle) * explosion*1/2;
      line(lineX, lineY, lineX2,lineY2);
    }
  }
} 
 //function for fireworks vanishing
  void vanishingFirework(){
  if ((!fireworkLaunched) && (!fireworkExplosion) && (fireworkVanish)) {
   
  }

  if ((!fireworkLaunched) && (!fireworkExplosion) && (fireworkVanish)) {
    fireworkReleased();
  }
 }
