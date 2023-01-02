import 'dart:convert';

import 'package:blogger_api/models/postitem.model.dart';

/// [PostModel] This is PostModel Model class
class PostModel {
  final String? kind;
  final List<PostItemModel>? items;
  final String? etag;
  final String? error;
  PostModel({
    this.kind,
    this.items,
    this.etag,
    this.error,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (kind != null) {
      result.addAll({'kind': kind});
    }
    if (items != null) {
      result.addAll({'items': items!.map((x) => x.toMap()).toList()});
    }
    if (etag != null) {
      result.addAll({'etag': etag});
    }
    if (error != null) {
      result.addAll({'error': error});
    }

    return result;
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      kind: map['kind'],
      items: map['items'] != null
          ? List<PostItemModel>.from(
              map['items']?.map((x) => PostItemModel.fromMap(x)))
          : null,
      etag: map['etag'],
      error: map['error'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source));

  PostModel copyWith({
    String? kind,
    List<PostItemModel>? items,
    String? etag,
    String? error,
  }) {
    return PostModel(
      kind: kind ?? this.kind,
      items: items ?? this.items,
      etag: etag ?? this.etag,
      error: error ?? this.error,
    );
  }
}
