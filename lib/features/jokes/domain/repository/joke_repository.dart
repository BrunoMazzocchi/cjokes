
import 'package:jokes/features/jokes/domain/entities/joke_entity.dart';

abstract class JokeRepository {
  Future<JokeEntity> getJoke();
}