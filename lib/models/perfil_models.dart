
class PerfilModel {
  final int id;
  final String primerNombre;
  final String segundoNombre;
  final String primerApellido;
  final String segundoApellido;
  final String genero;
  final String telefono;
  final String numeroIdentificacion;
  final String email;
  final DateTime emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int municipioResidenciaId;
  final int municipioNacimientoId;
  final int tipoIdentificacionId;
  final String urlFoto;

  PerfilModel({
    required this.id,
    required this.primerNombre,
    required this.segundoNombre,
    required this.primerApellido,
    required this.segundoApellido,
    required this.genero,
    required this.telefono,
    required this.numeroIdentificacion,
    required this.email,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.municipioResidenciaId,
    required this.municipioNacimientoId,
    required this.tipoIdentificacionId,
    required this.urlFoto,
  });

  // Método para crear un UserProfile desde un mapa JSON
  factory PerfilModel.fromJson(Map<String, dynamic> json) {
    return PerfilModel(
      id: json['id'],
      primerNombre: json['primer_nombre'],
      segundoNombre: json['segundo_nombre'],
      primerApellido: json['primer_apellido'],
      segundoApellido: json['segundo_apellido'],
      genero: json['genero'],
      telefono: json['telefono'],
      numeroIdentificacion: json['numero_identificacion'],
      email: json['email'],
      emailVerifiedAt: DateTime.parse(json['email_verified_at']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      municipioResidenciaId: json['municipio_residencia_id'],
      municipioNacimientoId: json['municipio_nacimiento_id'],
      tipoIdentificacionId: json['tipo_identificacions_id'],
      urlFoto: json['url_foto'],
    );
  }
}
