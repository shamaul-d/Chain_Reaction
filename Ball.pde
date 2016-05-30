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

    rad = 10;

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
  if (other.x - other.dx < this.x + this.dx) {
    if (other.y - other.dy < this.y + this.dy) {
       return true;
    }
    if (other.y + other.dy > this.y - this.dy){
      return true;
    }
    else {
     return false;
    }
  }
    else {
      if (other.y - other.dy < this.y + this.dy) {
         return true;
      }
      if (other.y + other.dy > this.y - this.dy){
        return true;
      }
      else {
       return false;
      }
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

     state = SHRINKING;
   }
   else if (state == SHRINKING) {

     state = DEAD;
   }
   else {

   }
 }

}//end class Ball
