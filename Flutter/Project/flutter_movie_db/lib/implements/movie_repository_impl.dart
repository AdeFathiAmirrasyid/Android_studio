import 'package:dartz/dartz.dart';
import 'package:flutter_movie_db/models/movie_model.dart';
import 'package:dio/dio.dart';
import '../repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final Dio _dio;
  MovieRepositoryImpl(this._dio);

  @override
  Future<Either<String, Movie>> getDiscover({int page = 1}) async {
    try {
      final result =
          await _dio.get('/discover/movie', queryParameters: {'page': page});
      if (result.statusCode == 200 && result.data != null) {
        final movie = Movie.fromJson(result.data);
        return Right(movie);
      }

      return const Left("Error get discover movies");
    } on DioError catch (error) {
      if (error.response != null) {
        return Left(error.response.toString());
      }
      return const Left("Another error on get discover movies");
    }
  }
}
