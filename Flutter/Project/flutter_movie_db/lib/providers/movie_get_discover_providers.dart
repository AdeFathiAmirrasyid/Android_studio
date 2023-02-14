import 'package:flutter/material.dart';
import 'package:flutter_movie_db/repositories/movie_repository.dart';

import '../models/movie_model.dart';

class MovieDiscoverProviders extends ChangeNotifier {
  final MovieRepository _movieRepository;
  MovieDiscoverProviders(this._movieRepository);
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final List<MovieModel> _movies = [];
  List<MovieModel> get movies => _movies;

  void getDiscover(BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    final result = await _movieRepository.getDiscover();

    result.fold((errorMsg) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(errorMsg)));
      _isLoading = false;
      notifyListeners();
      return;
    }, (response) {
      // _movies.clear();
      _movies.addAll(response.results);
      _isLoading = false;
      notifyListeners();

    });
  }
}
