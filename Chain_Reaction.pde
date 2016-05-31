Ball[] balls;

boolean reactionStarted;


void setup() {
  size(600, 600);
  reactionStarted = false;
  balls = new Ball[25];
  for (int i=0; i < balls.length; i++ )
    balls[i] = new Ball();
  balls[0].state = Ball.DEAD;
}


void draw() {
  background(0);

  for (int i=0; i < balls.length; i++ ) {
    balls[i].draw();
    balls[i].process();
    if(reactionStarted == true){
       for(int x=0; x < balls.length;x++){
          if(balls[i].state != Ball.DEAD && balls[x].rad != 30 && balls[i].isTouching(balls[x])){
                  balls[i].state = Ball.GROWING;
          }
       }
  }
}
}


void mouseClicked() {
  if (!reactionStarted ) {
    int b = 0;
    while(b < balls.length){
      if(sqrt(sq(balls[b].x - mouseX)+sq(balls[b].y - mouseY))<=30){
         balls[b].state = Ball.GROWING;
      }
      b++;
    }
    reactionStarted = true;
  }
}