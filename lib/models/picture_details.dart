class Picture {
  String medium;
  String large;

  Picture({
    required this.medium,
    required this.large,
  });

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      medium: json['medium'],
      large: json['large'],
    );
  }
}
