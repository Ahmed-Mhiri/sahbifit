import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahbifit_mobile/features/session/domain/entities/session.dart';


/// State for the session feed UI.
@freezed
class SessionFeedState with _$SessionFeedState {
  const factory SessionFeedState.initial() = _Initial;
  const factory SessionFeedState.loading() = _Loading;
  const factory SessionFeedState.success(List<Session> sessions) = _Success;
  const factory SessionFeedState.failure(String message) = _Failure;
}