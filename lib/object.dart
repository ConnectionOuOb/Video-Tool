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

class VideoSection {
  Duration start;
  Duration end;

  VideoSection({
    required this.start,
    required this.end,
  });

  factory VideoSection.init(Duration start) {
    return VideoSection(
      start: start,
      end: start + const Duration(seconds: 15),
    );
  }
}
