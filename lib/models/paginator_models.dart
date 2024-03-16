import 'dart:convert';
class PaginatorModel {
  final List<dynamic> data;
  final int currentPage;
  final int totalPages;

  PaginatorModel({
    required this.data,
    required this.currentPage,
    required this.totalPages,
  });

  factory PaginatorModel.fromRawJson(String str) =>
      PaginatorModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PaginatorModel.fromJson(Map<String, dynamic> json) => PaginatorModel(
        data: List<dynamic>.from(json["data"].map((x) => ColmenaModel.fromJson(x))),
        currentPage: json["current_page"],
        totalPages: json["total_pages"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "current_page": currentPage,
        "total_pages": totalPages,
      };
}
