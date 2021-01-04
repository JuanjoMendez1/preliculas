class Peliculas{

  List<Pelicula> items = new List();

  Peliculas();

  Peliculas.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null) return;

    for (var item in jsonList){
      final pelicula = new Pelicula. fromJsonMap(item);
      items.add(pelicula);
    }
  }

}

class Pelicula {
  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  String releaseDate;

  Pelicula({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  Pelicula.fromJsonMap(Map<String, dynamic> json) {
    popularity = json['popularity'] / 1;
    voteCount = json['vote_count'];
    video = json['video'];
    posterPath = json['poster_path'];
    id = json['id'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    genreIds = json['genre_ids'].cast<int>();
    title = json['title'];
    voteAverage = json['vote_average'] / 1;
    overview = json['overview'];
    releaseDate = json['release_date'];
  }
  getPosterImg(){
    if(posterPath == null){
return 'data:image/png;base64,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';
    }else{
    return 'https://image.tmdb.org/t/p/w500/$posterPath';
  }
  }
}

