class Player extends Character {
  int n = 0;

  Player(int x, int y, int level) {
    super(x, y, level);
  }




  void display() {
    ellipse(x, y, size, size);
    displayText();
  }

  void displayText() {
    fill(0);
    textSize(16);
    text(hp, x- 5, y + 30);
    fill(255);
  }

  void move() {
    x = mouseX;
  }

  void setStatas(int level) {
    bullet_type = 2;//1:enemy 2:player
    if (level == 1) {
      hp = 50;
      size = 10;
      st = 1;
      bullet_speed = 10;
      bullet_size = 7;
    } else if (level == 2) {
      hp = 100;
      size = 15;
      st = 2;
      bullet_speed = 20;
      bullet_size = 10;
    } else {
      hp = 200;
      size = 20;
      st = 3;
      bullet_speed = 40;
      bullet_size = 13;
    }
  }
  
  void updata(Bullet b, Enemy e){
    if(b.isHit(e) == 2){
      print("enemyに当てた");
      b.destroy();
      e.hp -= st;
    }
  }
  
  boolean isDie(){
    if(hp < 1){
      return true;
    }else{
      return false;
    }
  }
  
  void levelUp(){
    level ++;
    setStatas(level);
  }



  void shot() {
    Bullet newBullet = new Bullet(this);
    bullets.add(newBullet);
  }
}