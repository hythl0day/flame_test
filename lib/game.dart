import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flame/components.dart';

class GameScene extends FlameGame {
  late FpsComponent fps;

  late TextComponent fpsText;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    final SpriteComponent background = SpriteComponent(
      // position: Vector2(-size.x / 2, -size.y / 2),
      sprite: Sprite(await Flame.images.load('main2-small.png')),
      size: size,
    );
    add(background);

    fps = FpsComponent();
    fpsText = TextComponent(
      textRenderer: TextPaint(
        style: TextStyle(fontSize: 24.0, color: Colors.white),
      ),
    );
    add(fpsText);
  }

  @override
  void update(double dt) {
    super.update(dt);

    fps.update(dt);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    fpsText.text = fps.fps.toStringAsFixed(0);
  }
}
