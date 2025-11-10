import 'package:sahbifit_mobile/core/utils/type_defs.dart';
import 'package:sahbifit_mobile/features/session/data/models/mark_attendance_model.dart';
import 'package:sahbifit_mobile/features/session/domain/repositories/session_repository.dart';

/// Use case for marking attendance.
class MarkAttendance {
  final SessionRepository repository;

  MarkAttendance(this.repository);

  Future<Result<void>> call(MarkAttendanceModel params) async {
    return await repository.markAttendance(params);
  }
}