import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahbifit_mobile/features/gym/presentation/cubit/gym_list_state.dart';
import '../../../../../core/usecases/usecase.dart'; // For NoParams
import '../../domain/usecases/get_approved_gyms.dart';

class GymListCubit extends Cubit<GymListState> {
  final GetApprovedGyms getApprovedGyms;

  GymListCubit({required this.getApprovedGyms}) : super(GymListInitial());

  Future<void> loadGyms() async {
    emit(GymListLoading());
    
    final failureOrGyms = await getApprovedGyms(NoParams());
    
    failureOrGyms.fold(
      (failure) => emit(GymListError(message: 'Failed to load gyms')),
      (gyms) => emit(GymListLoaded(gyms: gyms)),
    );
  }
}