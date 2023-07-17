import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_db/implements/movie_repository_impl.dart';
import 'package:flutter_movie_db/providers/movie_get_discover_providers.dart';
import 'package:flutter_movie_db/repositories/movie_repository.dart';
import 'package:flutter_movie_db/ui/home_page.dart';
import 'package:flutter_movie_db/utils/splash_screen.dart';
import 'package:provider/provider.dart';

import 'commons/api_constants.dart';

void main() {
  final dioOption = BaseOptions(
    baseUrl: ApiConstants.baseURL,
    queryParameters: {'api_key': ApiConstants.apiKey},
  );
  final Dio dio = Dio(dioOption);
  final MovieRepository movieRepository = MovieRepositoryImpl(dio);
  runApp(MyApp(movieRepository));
}

class MyApp extends StatelessWidget {
  final MovieRepository movieRepository;
  const MyApp(this.movieRepository, {super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 2)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                  create: (_) => MovieDiscoverProviders(movieRepository))
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "The Movie Database",
              initialRoute: HomePage.routeName,
              routes: {
                HomePage.routeName: (context) => const HomePage(),
              },
            ),
          );
        }
        return const SplashScreen();
      },
    );
  }
}
