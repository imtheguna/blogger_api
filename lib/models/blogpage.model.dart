import 'dart:convert';

/// [BlogPost] This is BlogPost Model class
class BlogPost {
  final int totalItems;
  final String selfLink;
  BlogPost({
    required this.totalItems,
    required this.selfLink,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'totalItems': totalItems});
    result.addAll({'selfLink': selfLink});

    return result;
  }

  factory BlogPost.fromMap(Map<String, dynamic> map) {
    return BlogPost(
      totalItems: map['totalItems']?.toInt() ?? 0,
      selfLink: map['selfLink'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BlogPost.fromJson(String source) =>
      BlogPost.fromMap(json.decode(source));
}
