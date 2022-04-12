import 'package:owlnime/models/picture_details.dart';

import 'dart:convert';
import 'genres.dart';

class AnimeDetail {
  dynamic id;
  dynamic title;
  dynamic mainPicture;
  dynamic startDate;
  dynamic endDate;
  dynamic synopsis;
  dynamic mean;
  dynamic ranking;
  dynamic popularity;
  dynamic status;
  List<Genre> genres;
  dynamic numEps;
  dynamic source;
  List<Picture> pictures;

  AnimeDetail({
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
    required this.source,
    required this.pictures,
  });

  factory AnimeDetail.fromJson(Map<String, dynamic> json) {
    return AnimeDetail(
      id: json['id'],
      title: json['title'],
      mainPicture: json['main_picture']['medium'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      synopsis: json['synopsis'],
      mean: json['mean'],
      ranking: json['rank'],
      popularity: json['popularity'],
      status: json['status'],
      genres:
          (json['genres'] as Iterable).map((e) => Genre.fromJson(e)).toList(),
      numEps: json['num_episodes'],
      source: json['source'],
      pictures: (json['pictures'] as Iterable)
          .map((e) => Picture.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'mainPicture': mainPicture,
      'startDate': startDate,
      'endDate': endDate,
      'synopsis': synopsis,
      'mean': mean,
      'ranking': ranking,
      'popularity': popularity,
      'status': status,
      'genres': genres,
      'numEps': numEps,
      'source': source,
      'pictures': pictures
    };
  }
}
