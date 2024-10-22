class Video {
  String name;
  String path;

  Video({
    required this.name,
    required this.path,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      name: json['name'],
      path: json['path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'path': path,
    };
  }
}
