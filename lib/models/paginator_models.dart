import 'dart:convert';

class PaginatorModel<T extends Object> {
  final List<T> data;
  final int currentPage;
  final int totalPages;

  PaginatorModel({
    required this.data,
    required this.currentPage,
    required this.totalPages,
  });

  factory PaginatorModel.fromRawJson(String str, T Function(Map<String, dynamic>) fromJsonT) =>
      PaginatorModel.fromJson(json.decode(str), fromJsonT);

  String toRawJson(Map<String, dynamic> Function(T) toJsonT) => json.encode(toJson(toJsonT));

  factory PaginatorModel.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    return PaginatorModel<T>(
      data: List<T>.from(json["data"].map((x) => fromJsonT(x))),
      currentPage: json["current_page"],
      totalPages: json["total_pages"],
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJsonT) {
    return {
      "data": List<dynamic>.from(data.map((x) => toJsonT(x))),
      "current_page": currentPage,
      "total_pages": totalPages,
    };
  }
}

