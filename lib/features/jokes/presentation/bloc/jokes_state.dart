part of 'jokes_bloc.dart';

sealed class JokesState extends Equatable {
  const JokesState();
  
  @override
  List<Object> get props => [];
}

final class JokesInitial extends JokesState {}

final class JokesLoading extends JokesState {}

final class JokeSuccess extends JokesState {
  final List<JokeEntity> jokes;

  const JokeSuccess({required this.jokes});

  @override
  List<Object> get props => [jokes];
}

final class JokeError extends JokesState {
  final String error;

  const JokeError({required this.error});

  @override
  List<Object> get props => [error];
}