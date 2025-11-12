part of 'tags_cubit.dart';

@freezed
class TagsState with _$TagsState {
  /// The initial state, before tags are fetched.
  const factory TagsState.initial() = _Initial;

  /// The state while fetching the tags from the API.
  const factory TagsState.loading() = _Loading;

  /// The state when both 'goal' and 'schedule' tags are successfully loaded.
  const factory TagsState.loaded({
    required List<Tag> goalTags,
    required List<Tag> scheduleTags,
  }) = _Loaded;

  /// The state when an error occurs during fetching.
  const factory TagsState.error(String message) = _Error;
}