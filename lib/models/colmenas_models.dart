import 'dart:convert';

class ColmenasModels {
  final int id;
  final String nombre;
  final DateTime fechaInicio;
  final DateTime? fechaFinal;
  final String? temperaturaMinima;
  final String? temperaturaMaxima;
  final String? pesoMinimo;
  final String? pesoMaximo;
  final String? humedadMinima;
  final String? humedadMaxima;
  final int usersId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  ColmenasModels({
    required this.id,
    required this.nombre,
    required this.fechaInicio,
    required this.fechaFinal,
    required this.temperaturaMinima,
    required this.temperaturaMaxima,
    required this.pesoMinimo,
    required this.pesoMaximo,
    required this.humedadMinima,
    required this.humedadMaxima,
    required this.usersId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory ColmenasModels.fromRawJson(String str) => ColmenasModels.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ColmenasModels.fromJson(Map<String, dynamic> json) => ColmenasModels(
    id: json["id"],
    nombre: json["nombre"],
    fechaInicio: DateTime.parse(json["fecha_inicio"]),
    fechaFinal: json["fecha_final"] != null ? DateTime.parse(json["fecha_final"]) : null,
    temperaturaMinima: json["temperatura_minima"],
    temperaturaMaxima: json["temperatura_maxima"],
    pesoMinimo: json["peso_minimo"],
    pesoMaximo: json["peso_maximo"],
    humedadMinima: json["humedad_minima"],
    humedadMaxima: json["humedad_maxima"],
    usersId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"] != null ? DateTime.parse(json["deleted_at"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombre": nombre,
    "fecha_inicio": "${fechaInicio.year.toString().padLeft(4, '0')}-${fechaInicio.month.toString().padLeft(2, '0')}-${fechaInicio.day.toString().padLeft(2, '0')}",
    "fecha_final": fechaFinal != null ? "${fechaFinal!.year.toString().padLeft(4, '0')}-${fechaFinal!.month.toString().padLeft(2, '0')}-${fechaFinal!.day.toString().padLeft(2, '0')}" : null,
    "temperatura_minima": temperaturaMinima,
    "temperatura_maxima": temperaturaMaxima,
    "peso_minimo": pesoMinimo,
    "peso_maximo": pesoMaximo,
    "humedad_minima": humedadMinima,
    "humedad_maxima": humedadMaxima,
    "user_id": usersId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt != null ? deletedAt!.toIso8601String() : null,
  };
}
