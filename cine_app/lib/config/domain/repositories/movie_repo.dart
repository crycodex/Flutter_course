import 'package:cine_app/config/domain/entities/movie.dart';

abstract class MovieRepo {
    Future <List<Movie>> getNowPlayMovies({int page = 1});

}