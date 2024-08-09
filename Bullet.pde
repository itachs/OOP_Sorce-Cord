class Bullet {
  float x, y;
  int bullet_speed, size;
  int bullet_type;
  Bullet(Character c) {
    x = c.x;
    y = c.y;
    bullet_speed = c.bullet_speed;
    size = c.bullet_size;
    bullet_type = c.bullet_type;
  }

  void display() {
    ellipse(x, y, size, size);
  }

  void move() {
    y -= bullet_speed;
  }

  boolean isOut() {
    return y < 0;
  }
  

  //enemyがはなったbulletがplayerに当たったら1を返す
  //そうでなかったら2を返す
  int isHit(Character c) {
    float distance = dist(c.x, c.y, x, y);
    

    if (bullet_type == 1) {//1:enemy, 2:player

      if (distance < c.size/2) {
       
        return 1;
      } else {
        return -1;
      }
    } else {
      
      if (distance < c.size/2) {
       
        return 2;
      } else {
        return -1;
      }
    }
    
  }

  void destroy() {
    bullets.remove(this);
  }
}