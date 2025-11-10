class AuthToken {
  final String token;
  final DateTime expiresAt;

  AuthToken({
    required this.token,
    required this.expiresAt,
  });

  bool get isExpired => DateTime.now().isAfter(expiresAt);

  Map<String, dynamic> toJson() => {
        'token': token,
        'expiresAt': expiresAt.toIso8601String(),
      };

  factory AuthToken.fromJson(Map<String, dynamic> json) => AuthToken(
        token: json['token'],
        expiresAt: DateTime.parse(json['expiresAt']),
      );
}