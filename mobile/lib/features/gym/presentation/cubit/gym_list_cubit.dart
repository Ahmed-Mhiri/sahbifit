import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/errors/failure.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/gym/domain/entities/gym.dart';
import 'package:sahbifit/features/gym/domain/usecases/get_approved_gyms.dart';

part 'gym_list_cubit.freezed.dart';
part 'gym_list_state.dart';

@injectable
class GymListCubit extends Cubit<GymListState> {
  final GetApprovedGyms _getApprovedGyms;

  GymListCubit(this._getApprovedGyms) : super(const GymListState.initial());

  /// Fetches the list of all approved gyms.
  Future<void> fetchApprovedGyms() async {
    emit(const GymListState.loading());
    try {
      final gyms = await _getApprovedGyms(NoParams());
      emit(GymListState.loaded(gyms: gyms));
    } on ServerFailure catch (e) {
      emit(GymListState.error(e.message));
    } catch (e) {
      emit(GymListState.error(e.toString()));
    }
  }
}