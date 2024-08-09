ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();

Player player;
Enemy enemy;
Bullet[] b;



/*
球が敵に触れたら消えるようにすることができた。
 当たり判定は、まだプレイヤーが放った球が的に触れたときのみにしか判定できない
 敵からの攻撃も作れていない
 */
void mousePressed() {
  player.shot();
}

void setup() {
  size(400, 600);

  player = new Player(200, 550, 1);
  enemy = new Enemy(300, 200, 1);
  b = new Bullet[100];
  for (int i = 0; i < b.length; i++) {
    b[i] = new Bullet(player);
  }
}


void draw() {
  background(255);
  player.display();
  player.move();
  enemy.genEnemy();





  for (int i = bullets.size() - 1; i >= 0; i--) {
    Bullet b = bullets.get(i);
    b.move();
    b.display();
  
    for (int j = enemies.size() - 1; j >= 0; j--) {
      player.updata(b, enemies.get(j));
    }
    
        
    for (int j = enemies.size() - 1; j >= 0; j--) {
      enemy.updata(b, enemy);
    }

    if (b.isOut()) {
      b.destroy();
    }
  }

  for (int i = enemies.size() - 1; i >= 0; i--) {
    Enemy enemy = enemies.get(i);
    enemy.move();
    enemy.display();
    enemy.shot();
    


    if (enemy.isOut() || enemy.isDie()) {
      enemies.remove(i);
    }
  }
}
