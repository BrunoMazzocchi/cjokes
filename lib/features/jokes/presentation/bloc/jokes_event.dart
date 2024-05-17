part of 'jokes_bloc.dart';

sealed class JokesEvent extends Equatable {
  const JokesEvent();

  @override
  List<Object> get props => [];
}

class GetJokeEvent extends JokesEvent {

}