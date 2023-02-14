import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_get_discover_providers.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MovieDiscoverProviders>().getDiscover(context);
    });
    return Scaffold(
      body: Consumer<MovieDiscoverProviders>(
        builder: (_, provider, __) {
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (provider.movies.isNotEmpty) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final movie = provider.movies[index];
                return ListTile(
                  title: Text(movie.title),
                  subtitle: Text(movie.overview),
                );
              },
            );
          }

          return const Center(child: Text('Not Found Discover Movies'));
        },
      ),
    );
  }
}
