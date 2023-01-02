import 'dart:convert';

/// [BlogLocale] This is BlogLocale Model class
class BlogLocale {
  final String language;
  final String country;
  final String variant;
  BlogLocale({
    required this.language,
    required this.country,
    required this.variant,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'language': language});
    result.addAll({'country': country});
    result.addAll({'variant': variant});

    return result;
  }

  factory BlogLocale.fromMap(Map<String, dynamic> map) {
    return BlogLocale(
      language: map['language'] ?? '',
      country: map['country'] ?? '',
      variant: map['variant'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BlogLocale.fromJson(String source) =>
      BlogLocale.fromMap(json.decode(source));
}
