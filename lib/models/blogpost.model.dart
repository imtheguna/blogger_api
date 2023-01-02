import 'dart:convert';

/// [BlogPage] This is BlogPage Model class
class BlogPage {
  final int totalItems;
  final String selfLink;
  BlogPage({
    required this.totalItems,
    required this.selfLink,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'totalItems': totalItems});
    result.addAll({'selfLink': selfLink});

    return result;
  }

  factory BlogPage.fromMap(Map<String, dynamic> map) {
    return BlogPage(
      totalItems: map['totalItems']?.toInt() ?? 0,
      selfLink: map['selfLink'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BlogPage.fromJson(String source) =>
      BlogPage.fromMap(json.decode(source));
}
