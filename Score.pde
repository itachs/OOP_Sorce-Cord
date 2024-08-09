class Score{
  int x;
  int y;
  int size;
  int score;
  Score(){
    size = 100;
    x = width - 50;
    y = 30;
    score = 0;
  }
  
  void display(){
    fill(0);
    textSize(25);
    score = killedEnemy;
    text(score, x, y);
    fill(255);
  }
  
  void move(){
    
  }
    
}