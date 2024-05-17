import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/jokes_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<JokesBloc>()..add(GetJokeEvent()),
        child: const Icon(Icons.downloading),
      ),
      body: BlocConsumer<JokesBloc, JokesState>(
        listener: (context, state) {
          if(state is JokeError) {
            ScaffoldMessenger.of(context).showSnackBar (
                SnackBar(content: Text(state.error))
            );
          }
        },
        builder: (context, state) {
          if (state is JokesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is JokeSuccess) {
            final jokes = state.jokes;
            return ListView.builder(
              itemCount: jokes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 5,
                  ),
                  child: ListTile(
                    title: Text(
                        "#${index + 1} ${jokes[index].value}"
                    ),
                    tileColor: Colors.white,
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text("There are no jokes"),
            );
          }
        },
      ),
    );
  }
}
