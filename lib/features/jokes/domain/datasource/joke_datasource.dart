import '../entities/joke_entity.dart';

abstract class JokeDatasource {
  Future<JokeEntity> getJoke();
}