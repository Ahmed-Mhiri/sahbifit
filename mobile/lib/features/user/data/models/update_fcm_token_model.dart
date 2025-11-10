import 'package:equatable/equatable.dart';

// DTO for updating the FCM token, based on UpdateFcmTokenDto.java
class UpdateFcmTokenModel extends Equatable {
  final String fcmToken;

  const UpdateFcmTokenModel({required this.fcmToken});

  Map<String, dynamic> toJson() {
    return {
      'fcmToken': fcmToken,
    };
  }

  @override
  List<Object?> get props => [fcmToken];
}