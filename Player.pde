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
      size = 10;
      st = 1;
      bullet_speed = 10;
    } else if (level == 2) {
      size = 15;
      st = 2;
      bullet_speed = 20;
    } else {
      size = 20;
      st = 3;
      bullet_speed = 40;
    }
  }
  
  void updata(Bullet b, Character e){
    if(b.isHit(e) == 1){
      hp -= e.st;
    }
  }



  void shot() {
    Bullet newBullet = new Bullet(this);
    bullets.add(newBullet);
  }
}
