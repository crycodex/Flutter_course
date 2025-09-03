import 'package:cine_app/domain/datasources/movie_data.dart';
import 'package:cine_app/domain/entities/movie.dart';
import 'package:dio/dio.dart';
import 'package:cine_app/config/constants/env.dart';
import 'package:cine_app/infraestructure/models/moviebd/movie_response.dart';

class MovieDatasource extends MovieData {

  final dio = Dio(
    BaseOptions(
      baseUrl: "https://api.themoviedb.org/3",
      queryParameters: {
        "api_key": Env.apiKey,
        "language": "es-MX",
      },
    ),
  );

  @override
  Future<List<Movie>> getNowPlayMovies({int page = 1}) async {
    final response = await dio.get("/movie/now_playing");
    final List<Movie> movies = [
      ...response.data["results"].map((movie) => MovieResponse.fromJson(movie)),
    ];
    return movies;
  }
}
