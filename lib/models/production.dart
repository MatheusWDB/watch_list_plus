import 'dart:convert';

import 'package:watchlist_plus/enums/category_enum.dart';
import 'package:watchlist_plus/models/streaming.dart';

class Production {
  final int? id;
  final String title;
  final CategoryEnum category;
  final List<Streaming> streaming;
  final bool watched;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const Production({
    required this.title,
    required this.category,
    required this.streaming,
    required this.createdAt,
    this.id,
    this.watched = false,
    this.updatedAt,
  });

  Production copyWith({
    int? id,
    String? title,
    CategoryEnum? category,
    List<Streaming>? streaming,
    bool? watched,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Production(
    id: id ?? this.id,
    title: title ?? this.title,
    category: category ?? this.category,
    streaming: streaming ?? this.streaming,
    watched: watched ?? this.watched,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? DateTime.now(),
  );

  factory Production.fromRow(
    Map<String, dynamic> row,
    List<Streaming> streamings,
  ) => Production(
    id: row['id'] as int?,
    title: row['title'] as String,
    category: CategoryEnum.values.firstWhere(
      (e) => e.name == row['category'],
      orElse: () => CategoryEnum.movie,
    ),
    streaming: streamings,
    watched: (row['watched'] as int) == 1,
    createdAt: DateTime.parse(row['created_at'] as String),
    updatedAt: row['updated_at'] != null
        ? DateTime.parse(row['updated_at'] as String)
        : null,
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'category': category.name,
    'streaming': streaming.map((s) => s.toMap()).toList(),
    'watched': watched,
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };

  factory Production.fromJson(Map<String, dynamic> json) {
    final streamingRaw = (json['streaming'] as List? ?? []).map(
      (e) => e as Map<String, dynamic>,
    );

    return Production(
      title: json['title'] as String,
      category: CategoryEnum.values.firstWhere(
        (e) => e.name == json['category'],
        orElse: () => CategoryEnum.movie,
      ),
      streaming: streamingRaw.map(Streaming.fromMap).toList(),
      watched: json['watched'] as bool? ?? false,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
    );
  }

  static String encodeList(List<Production> list) =>
      json.encode(list.map((p) => p.toJson()).toList());

  static List<Production> decodeList(String source) {
    final decoded = json.decode(source);
    if (decoded is List) {
      return decoded
          .map((item) => Production.fromJson(item as Map<String, dynamic>))
          .toList();
    }
    return [];
  }
}
