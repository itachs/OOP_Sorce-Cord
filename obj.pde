ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();


Player player;
Enemy enemy;
Score score;
Gameover gameover;
Start start;
Item[] item;
Bullet[] b;

int killedEnemy;
int scene;
int enemyLevel;



void mousePressed() {
  player.shot();
}

void setup() {
  size(400, 600);
  rectMode(CENTER);

  killedEnemy = 0;
  scene = 0;

  player = new Player(200, 550, 1);
  enemy = new Enemy(300, 200, 1);
  score = new Score();
  start = new Start();
  gameover = new Gameover();
  item = new Item[2];

  for (int i = 0; i < item.length; i++) {
    item[i] = new Item(-(500 + 500 * i));
  }
}



void draw() {
  background(255);

  if (scene == 0) {//scene start
    start.display();

    enemyLevel = start.getLevel();
    if (enemyLevel != 0) {


      scene = 1;
    }
  } else {// play scene
    stroke(2);
    gameover.display();
    player.display();
    player.move();
    enemy.genEnemy();

    score.display();
    score.move();







    for (int i = 0; i < 2; i++) {
      item[i].display();
      item[i].move();
      item[i].isHit();
    }







    for (int i = bullets.size() - 1; i >= 0; i--) {
      Bullet b = bullets.get(i);
      b.move();
      b.display();

      for (int j = enemies.size() - 1; j >= 0; j--) {
        player.updata(b, enemies.get(j));
      }


      for (int j = enemies.size() - 1; j >= 0; j--) {
        enemies.get(j).updata(b);
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
        if (!gameover.isPlayerAlive && !gameover.over) {
          killedEnemy++;
        }

        enemies.remove(i);
      }
    }
  }
}