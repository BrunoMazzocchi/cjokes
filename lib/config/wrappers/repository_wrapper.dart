import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes/features/jokes/data/datasource/joke_datasource_impl.dart';
import 'package:jokes/features/jokes/data/repository/joke_repository_impl.dart';
import 'package:jokes/features/jokes/domain/repository/joke_repository.dart';

/// This class wraps the app with the repositories
class RepositoryWrapper extends StatelessWidget {
  final Widget child;

  const RepositoryWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<JokeRepository>(
          create: (context) => JokeRepositoryImpl(
            jokeDatasource: JokeDatasourceImpl(
              apiClient: context.read()
            )
          ),
        )
      ],
      child: child,
    );
  }
}
