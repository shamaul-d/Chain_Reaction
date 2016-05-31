class Ball {

  final static int MOVING = 0;
  final static int GROWING = 1;
  final static int SHRINKING = 2;
  final static int DEAD = 3;

  //other constants necessary?

  float x;
  float y;
  float rad;
  color c;
  float dx;
  float dy;
  int state;


  Ball() {
    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color( r, g, b );

    rad = 30;

    x = random( (width - r) + r/2 );
    y = random( (height - r) + r/2 );

    dx = random(10) - 5;
    dy = random(10) - 5;

    state = MOVING;
  }


  void move() {
    x = x + dx;
    y = y + dy;
    bounce();
  }


 boolean isTouching( Ball other ) {
  if (sqrt(sq(other.x-this.x)+sq(other.y-this.y)) < rad) {
       return true;
  }
  else {
    return false;
  }
 }
 void bounce() {
  if (x > width) {
    dx = -dx;
  }
  else if (x < 0) {
    dx = -dx;
  }
  else if (y > height) {
    dy = -dy;
  }
  else if (y < 0) {
    dy = -dy;
  }
  else {
   return;
  }
 }

 void draw() {
   fill(c);
   ellipse(x,y,rad,rad);
 }

 void process() {
   if (state == MOVING) {
     move();
   }
   else if (state == GROWING) {
     dx = 0;
     dy = 0;
     if(rad < 100){
        rad++;
     }
     else{
        state = SHRINKING;
     }
   }
   else if (state == SHRINKING) {
     if(rad > 0){
          rad--;
     }
     else{
        state = DEAD;
     }
   }
   else {

   }
 }

}//end class Ball