import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/bloc/post/post_bloc.dart';
import 'package:todo_app_flutter/data/repository/post_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Learning with events"),
      ),
      body: BlocProvider(
        lazy: true,
        create: (context) => PostBloc(
          context.read<PostRepository>(),
        )..add(LoadPostEvents()),
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostLoaded) {
              return ListView.builder(
                itemCount: 10,
                itemBuilder: (ctx, index) => ListTile(
                  onTap: () {
                    ctx.read<PostBloc>().add(LoadPostEvents());
                  },
                  title: Text("Title $index"),
                  subtitle: const Text("Subititle here,"),
                ),
              );
            } else if (state is PostLoadInProgress) {
              return const CircularProgressIndicator.adaptive();
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
