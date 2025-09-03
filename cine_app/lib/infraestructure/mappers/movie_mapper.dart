import 'package:cine_app/domain/entities/movie.dart';
import 'package:cine_app/infraestructure/models/moviebd/movie_model.dart';

class MovieMapper {
  static Movie movieResponseToMovie(MovieModel movieResponse) => Movie(
    adult: movieResponse.adult,
    backdropPath: movieResponse.backdropPath != ""
        ? "https://image.tmdb.org/t/p/w500/${movieResponse.backdropPath}"
        : "https://marketplace.canva.com/EAEbNyW0c8A/1/0/1131w/canva-azul-tormenta-mar-pel%C3%ADcula-p%C3%B3ster-mFNHMKQlmUs.jpg",
    genreIds: movieResponse.genreIds.map((e) => e).toList(),
    id: movieResponse.id,
    originalLanguage: movieResponse.originalLanguage,
    originalTitle: movieResponse.originalTitle,
    overview: movieResponse.overview,
    popularity: movieResponse.popularity,
    posterPath: movieResponse.posterPath != ""
        ? "https://image.tmdb.org/t/p/w500/${movieResponse.posterPath}"
        : "https://marketplace.canva.com/EAEbNyW0c8A/1/0/1131w/canva-azul-tormenta-mar-pel%C3%ADcula-p%C3%B3ster-mFNHMKQlmUs.jpg",
    releaseDate: movieResponse.releaseDate,
    title: movieResponse.title,
    video: movieResponse.video,
    voteAverage: movieResponse.voteAverage,
    voteCount: movieResponse.voteCount,
  );
}
