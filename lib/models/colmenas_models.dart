// import 'dart:convert';

// class ColmenasModels {
// final int id;
// final String nombre;
// final DateTime fechaInicio;
// final DateTime? fechaFinal;
// final String? temperaturaMinima;
// final String? temperaturaMaxima;
// final String? pesoMinimo;
// final String? pesoMaximo;
// final String? humedadMinima;
// final String? humedadMaxima;
// final int usersId;
// final DateTime createdAt;
// final DateTime updatedAt;
// final DateTime? deletedAt;

//   ColmenasModels({
//     required this.id,
//     required this.nombre,
//     required this.fechaInicio,
//     required this.fechaFinal,
//     required this.temperaturaMinima,
//     required this.temperaturaMaxima,
//     required this.pesoMinimo,
//     required this.pesoMaximo,
//     required this.humedadMinima,
//     required this.humedadMaxima,
//     required this.usersId,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.deletedAt,
//   });

//   factory ColmenasModels.fromRawJson(String str) => ColmenasModels.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory ColmenasModels.fromJson(Map<String, dynamic> json) => ColmenasModels(
//     id: json["id"],
//     nombre: json["nombre"],
//     fechaInicio: DateTime.parse(json["fecha_inicio"]),
//     fechaFinal: json["fecha_final"] != null ? DateTime.parse(json["fecha_final"]) : null,
//     temperaturaMinima: json["temperatura_minima"],
//     temperaturaMaxima: json["temperatura_maxima"],
//     pesoMinimo: json["peso_minimo"],
//     pesoMaximo: json["peso_maximo"],
//     humedadMinima: json["humedad_minima"],
//     humedadMaxima: json["humedad_maxima"],
//     usersId: json["user_id"],
// createdAt: DateTime.parse(json["created_at"]),
// updatedAt: DateTime.parse(json["updated_at"]),
//     deletedAt: json["deleted_at"] != null ? DateTime.parse(json["deleted_at"]) : null,
//   );

//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "nombre": nombre,
//     "fecha_inicio": "${fechaInicio.year.toString().padLeft(4, '0')}-${fechaInicio.month.toString().padLeft(2, '0')}-${fechaInicio.day.toString().padLeft(2, '0')}",
//     "fecha_final": fechaFinal != null ? "${fechaFinal!.year.toString().padLeft(4, '0')}-${fechaFinal!.month.toString().padLeft(2, '0')}-${fechaFinal!.day.toString().padLeft(2, '0')}" : null,
//     "temperatura_minima": temperaturaMinima,
//     "temperatura_maxima": temperaturaMaxima,
//     "peso_minimo": pesoMinimo,
//     "peso_maximo": pesoMaximo,
//     "humedad_minima": humedadMinima,
//     "humedad_maxima": humedadMaxima,
//     "user_id": usersId,
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//     "deleted_at": deletedAt != null ? deletedAt!.toIso8601String() : null,
//   };
// }
//---------------------------------------------------------------------------------------------------------------------------------------------------------------
// import 'dart:convert';

// class ColmenasModels {
//   final List<Datum>? data;
//   final int? currentPage;
//   final int? totalPages;

//   ColmenasModels({
//     this.data,
//     this.currentPage,
//     this.totalPages,
//   });

//   factory ColmenasModels.fromRawJson(String str) =>
//       ColmenasModels.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory ColmenasModels.fromJson(Map<String, dynamic> json) => ColmenasModels(
//         data: json["data"] == null
//             ? []
//             : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
//         currentPage: json["current_page"],
//         totalPages: json["total_pages"],
//       );

//   Map<String, dynamic> toJson() => {
//         "data": data == null
//             ? []
//             : List<dynamic>.from(data!.map((x) => x.toJson())),
//         "current_page": currentPage,
//         "total_pages": totalPages,
//       };
// }

// class Datum {
//   final int id;
//   final String nombre;
//   final DateTime fechaInicio;
//   final DateTime? fechaFinal;
//   final String? temperaturaMinima;
//   final String? temperaturaMaxima;
//   final String? pesoMinimo;
//   final String? pesoMaximo;
//   final String? humedadMinima;
//   final String? humedadMaxima;
//   final int userId;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   final DateTime? deletedAt;
//   final String? estado;

//   Datum({
//     required this.id,
//     required this.nombre,
//     required this.fechaInicio,
//     required this.fechaFinal,
//     required this.temperaturaMinima,
//     required this.temperaturaMaxima,
//     required this.pesoMinimo,
//     required this.pesoMaximo,
//     required this.humedadMinima,
//     required this.humedadMaxima,
//     required this.userId,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.deletedAt,
//     required this.estado,
//   });

//   factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         nombre: json["nombre"],
//         fechaInicio: DateTime.parse(json["fecha_inicio"]),
//         fechaFinal: json["fecha_final"],
//         temperaturaMinima: json["temperatura_minima"],
//         temperaturaMaxima: json["temperatura_maxima"],
//         pesoMinimo: json["peso_minimo"],
//         pesoMaximo: json["peso_maximo"],
//         humedadMinima: json["humedad_minima"],
//         humedadMaxima: json["humedad_maxima"],
//         userId: json["user_id"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         deletedAt: json["deleted_at"],
//         estado: json["estado"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "nombre": nombre,
//         "fecha_inicio":
//             "${fechaInicio!.year.toString().padLeft(4, '0')}-${fechaInicio!.month.toString().padLeft(2, '0')}-${fechaInicio!.day.toString().padLeft(2, '0')}",
//         "fecha_final": fechaFinal,
//         "temperatura_minima": temperaturaMinima,
//         "temperatura_maxima": temperaturaMaxima,
//         "peso_minimo": pesoMinimo,
//         "peso_maximo": pesoMaximo,
//         "humedad_minima": humedadMinima,
//         "humedad_maxima": humedadMaxima,
//         "user_id": userId,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//         "deleted_at": deletedAt,
//         "estado": estado,
//       };
// }
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
        data: List<ColmenaModel>.from(json["data"].map((x) => ColmenaModel.fromJson(x))),
        currentPage: json["current_page"],
        totalPages: json["total_pages"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "current_page": currentPage,
        "total_pages": totalPages,
      };
}

class ColmenaModel {
  final int id;
  final String nombre;
  final DateTime fechaInicio;
  final DateTime? fechaFinal;
  final int? temperaturaMinima;
  final int? temperaturaMaxima;
  final int? pesoMinimo;
  final int? pesoMaximo;
  final int? humedadMinima;
  final int? humedadMaxima;
  final int userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;
  final String estado;

  ColmenaModel({
    required this.id,
    required this.nombre,
    required this.fechaInicio,
    this.fechaFinal,
    this.temperaturaMinima,
    this.temperaturaMaxima,
    this.pesoMinimo,
    this.pesoMaximo,
    this.humedadMinima,
    this.humedadMaxima,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.estado,
  });

  factory ColmenaModel.fromRawJson(String str) => ColmenaModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ColmenaModel.fromJson(Map<String, dynamic> json) => ColmenaModel(
        id: json["id"],
        nombre: json["nombre"],
        fechaInicio: DateTime.parse(json["fecha_inicio"]),
        fechaFinal: json["fecha_final"] != null
            ? DateTime.parse(json["fecha_final"])
            : null,
        temperaturaMinima: json["temperatura_minima"],
        temperaturaMaxima: json["temperatura_maxima"],
        pesoMinimo: json["peso_minimo"],
        pesoMaximo: json["peso_maximo"],
        humedadMinima: json["humedad_minima"],
        humedadMaxima: json["humedad_maxima"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "fecha_inicio":
            "${fechaInicio.year.toString().padLeft(4, '0')}-${fechaInicio.month.toString().padLeft(2, '0')}-${fechaInicio.day.toString().padLeft(2, '0')}",
        "fecha_final": fechaFinal?.toIso8601String(),
        "temperatura_minima": temperaturaMinima,
        "temperatura_maxima": temperaturaMaxima,
        "peso_minimo": pesoMinimo,
        "peso_maximo": pesoMaximo,
        "humedad_minima": humedadMinima,
        "humedad_maxima": humedadMaxima,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "estado": estado,
      };
}
