class Enemy extends Character {
  Enemy(float x, float y, int level) {
    super(x, y, level);
  }



  void display() {
    fill(255);
    ellipse(x, y, size, size);
    displayText();
  }



  void move() {
    y += 1;
  }

  void setStatas(int level) {
    bullet_type = 1;//1:enemy 2:player
    if (level == 1) {
      hp = 3;
      size = 50;
      st = 3;
      bullet_speed = 5;
    } else if (level == 2) {
      hp = 5;
      size = 70;
      st = 5;
      bullet_speed = 7;
    } else {
      hp = 8;
      size = 100;
      st = 3;
      bullet_speed = 10;
    }
  }

  void addEnemy() {
    float xx = random(size, width - size);
    float yy = random(size, 100);
    Enemy newEnemy = new Enemy(xx, yy, 1);
    enemies.add(newEnemy);
  }

  void genEnemy() {
    if (frameCount % 100== 0) {
      addEnemy();
    }
  }

  void updata(Bullet b, Character c) {
    if (b.isHit(player) == 1) {
      hp -= player.st;
    }
  }


  boolean isDie() {
    return hp < 1;
  }


  boolean isOut() {
    return y > height;
  }

  void shot() {
    int randomNum = int(random(40, 100));
    if (frameCount % randomNum == 0) {
      Bullet newBullet = new Bullet(this);
      bullets.add(newBullet);
    }
  }
}
