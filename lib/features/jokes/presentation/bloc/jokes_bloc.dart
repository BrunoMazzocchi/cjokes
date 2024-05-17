import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/joke_entity.dart';
import '../../domain/repository/joke_repository.dart';

part 'jokes_event.dart';
part 'jokes_state.dart';

class JokesBloc extends Bloc<JokesEvent, JokesState> {
  final JokeRepository _jokeRepository;

  JokesBloc({required JokeRepository jokeRepository}) :
        _jokeRepository = jokeRepository,
        super(JokesInitial()) {
    on<GetJokeEvent>((event, emit) async {
      try {
        emit(JokesLoading());
        List<JokeEntity> jokesToEmit = [];

        while(jokesToEmit.length < 20) {
          JokeEntity jokeToAdd = await _jokeRepository.getJoke();
          jokesToEmit.add(jokeToAdd);
        }

        emit(JokeSuccess(jokes: jokesToEmit));
        
      } catch (error) {
        emit(JokeError(error: error.toString()));
      }
    });
  }
}
