import 'dart:convert';

import 'package:blogger_api/models/postitem.model.dart';

/// [PageModel] This is PageModel Model class
class PageModel {
  final String? kind;
  final List<PostItemModel>? items;
  final String? etag;
  final String? error;
  PageModel({
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

  factory PageModel.fromMap(Map<String, dynamic> map) {
    return PageModel(
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

  factory PageModel.fromJson(String source) =>
      PageModel.fromMap(json.decode(source));

  PageModel copyWith({
    String? kind,
    List<PostItemModel>? items,
    String? etag,
    String? error,
  }) {
    return PageModel(
      kind: kind ?? this.kind,
      items: items ?? this.items,
      etag: etag ?? this.etag,
      error: error ?? this.error,
    );
  }
}
