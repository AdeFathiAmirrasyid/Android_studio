import 'package:dartz/dartz.dart';

import '../models/movie_model.dart';

abstract class MovieRepository {
  Future<Either<String,Movie>> getDiscover({int page = 1});
}
