import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes/features/jokes/presentation/bloc/jokes_bloc.dart';

/// This class wraps the app with the bloc information
class BlocWrapper extends StatelessWidget {
  final Widget child;

  const BlocWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<JokesBloc>(
          create: (context) => JokesBloc(
              jokeRepository: context.read(),
          ),
        )
      ],
      child: child,
    );
  }
}
