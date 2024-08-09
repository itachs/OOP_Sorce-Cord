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
      bullet_speed = -5;
      bullet_size = 7;
      println(1);
    } else if (level == 2) {
      hp = 5;
      size = 70;
      st = 5;
      bullet_speed = -7;
      bullet_size = 15;
      println(2);
    } else {
      hp = 8;
      size = 100;
      st = 3;
      bullet_speed = -10;
      bullet_size = 22;
      println(3);
    }
  }

  void addEnemy() {
    float xx = random(size, width - size);
    float yy = random(size, 100);
    Enemy newEnemy = new Enemy(xx, yy, enemyLevel);
    enemies.add(newEnemy);
  }

  void genEnemy() {
    if (frameCount % 100== 0) {
      addEnemy();
    }
  }

  void updata(Bullet b) {
    if (b.isHit(player) == 1) {
      print("playerに当てた");
      b.destroy();
      player.hp -= st;
    }
  }


  boolean isDie() {
    
    
    if(hp < 1){
      return true;
    }else{
      return false;
    }
  }


  boolean isOut() {


    if(y > height){
      gameover.over = true;
      return true;
    }else{
      return false;
    }
  }

  void shot() {
    int randomNum = int(random(40, 100));
    if (frameCount % randomNum == 0) {
      Bullet newBullet = new Bullet(this);
      bullets.add(newBullet);
    }
  }
}