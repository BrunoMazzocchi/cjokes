import 'package:jokes/features/jokes/domain/datasource/joke_datasource.dart';
import 'package:jokes/features/jokes/domain/entities/joke_entity.dart';
import 'package:jokes/features/jokes/domain/repository/joke_repository.dart';

class JokeRepositoryImpl extends JokeRepository {
  final JokeDatasource _jokeDatasource;

  JokeRepositoryImpl({
    required JokeDatasource jokeDatasource
}) : _jokeDatasource = jokeDatasource;

  @override
  Future<JokeEntity> getJoke() async {
    try {
      JokeEntity joke = await _jokeDatasource.getJoke();
      return joke;
    } on Exception catch (_) {
      rethrow;
    } catch (error) {
      throw Exception(error);
    }
  }
}