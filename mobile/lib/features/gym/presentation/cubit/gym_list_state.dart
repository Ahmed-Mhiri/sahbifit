part of 'gym_list_cubit.dart';

@freezed
class GymListState with _$GymListState {
  /// The initial state, before gyms are fetched.
  const factory GymListState.initial() = _Initial;

  /// The state while fetching the list of gyms.
  const factory GymListState.loading() = _Loading;

  /// The state when the list of approved gyms is successfully loaded.
  const factory GymListState.loaded({required List<Gym> gyms}) = _Loaded;

  /// The state when an error occurs.
  const factory GymListState.error(String message) = _Error;
}