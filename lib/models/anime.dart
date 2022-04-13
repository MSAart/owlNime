import 'genres.dart';

class Anime {
  int id;
  String title;
  String mainPicture;
  dynamic startDate;
  dynamic endDate;
  String synopsis;
  dynamic mean;
  int ranking;
  int popularity;
  String status;
  List<Genre> genres;
  int numEps;

  Anime({
    required this.id,
    required this.title,
    required this.mainPicture,
    required this.startDate,
    required this.endDate,
    required this.synopsis,
    required this.mean,
    required this.ranking,
    required this.popularity,
    required this.status,
    required this.genres,
    required this.numEps,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      id: json['node']['id'],
      title: json['node']['title'],
      mainPicture: json['node']['main_picture']['medium'],
      startDate: json['node']['start_date'],
      endDate: json['node']['end_date'],
      synopsis: json['node']['synopsis'],
      mean: json['node']['mean'],
      ranking: json['node']['rank'],
      popularity: json['node']['popularity'],
      status: json['node']['status'],
      genres: (json['node']['genres'] as Iterable)
          .map((e) => Genre.fromJson(e))
          .toList(),
      numEps: json['node']['num_episodes'],
    );
  }
}
