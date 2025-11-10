import 'package:flutter_bloc/flutter_bloc.dart';
import 'tags_state.dart';
import '../domain/usecases/get_tags_by_type.dart';
import '../domain/enums/tag_type.dart';
import '../domain/repositories/tag_repository.dart'; // For Failure types

class TagsCubit extends Cubit<TagsState> {
  final GetTagsByType getTagsByType;

  TagsCubit({required this.getTagsByType}) : super(TagsInitial());

  /// Loads the list of tags based on the given [TagType].
  Future<void> loadTags(TagType tagType) async {
    emit(TagsLoading());

    final params = GetTagsParams(tagType);
    final result = await getTagsByType(params);

    result.fold(
      (failure) {
        emit(TagsError(_mapFailureToMessage(failure)));
      },
      (tags) {
        emit(TagsLoaded(tags));
      },
    );
  }

  /// Helper function to convert Failure objects to user-friendly strings.
  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return 'Server Error. Could not load tags.';
    } else if (failure is NetworkFailure) {
      return 'No internet connection.';
    } else {
      return 'An unexpected error occurred.';
    }
  }
}