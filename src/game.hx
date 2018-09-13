import hxd.Key in K;

class Game extends hxd.App {
    var paddle: h2d.Graphics;
    var paddle2: h2d.Graphics;
    var paddleSize = 250;
    var ball: h2d.Graphics;
    var ballxdirection = 1;
    var ballydirection = 1;
    var maxWidth = 700;
    override function init() {
        //h3d.Engine.backgroundColor = 0xffffff;
        paddle = new h2d.Graphics(s2d);
        paddle.beginFill(0xffffff);
        paddle.drawRect(10, 10, paddleSize, 50);
        paddle.endFill();

        paddle2 = new h2d.Graphics(s2d);
        paddle2.beginFill(0xffffff);
        paddle2.drawRect(10, 900, paddleSize, 50);
        paddle2.endFill();

        ball = new h2d.Graphics(s2d);
        ball.beginFill(0xffffff);
        ball.drawCircle(50,50, 30);
    }

    override function update(dt:Float) {
        if( K.isDown(K.RIGHT) && (paddle.x+paddleSize) + 10 <= maxWidth){
            paddle.x += 10.0;
        }
        if( K.isDown(K.LEFT) && paddle.x - 10 >= 0){
            paddle.x -= 10.0;
        }
        if( K.isDown(K.RIGHT) && (paddle2.x+paddleSize) + 10 <= maxWidth){
            paddle2.x += 10.0;
        }
        if( K.isDown(K.LEFT) && paddle2.x - 10 >= 0){
            paddle2.x -= 10.0;
        }
        var ballx = ball.x;
        var bally = ball.y;
        if(ballxdirection == 1){
            if(ballx + 10 > maxWidth){
                ballxdirection = -1;
                ballx -= 10;
            } else {
                ballx += 10;
            }
        } else {
            if(ballx - 10 < 0){
                ballxdirection = 1;
                ballx += 10;
            } else {
                ballx -= 10;
            }
        }
        if(ballydirection == 1){
            if(bally + 10 > 900){
                ballydirection = -1;
                bally -= 10;
            } else {
                bally += 10;
            }
        } else {
            if(bally - 10 < 0){
                ballydirection = 1;
                bally += 10;
            } else {
                bally -= 10;
            }
        }
        ball.x = ballx;
        ball.y = bally;
    }

    static function main() {
        //hxd.Res.initEmbed();
        //inst = new Game();
        new Game();
    }
}
