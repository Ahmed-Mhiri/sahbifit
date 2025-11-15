import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/errors/failure.dart';
import 'package:sahbifit/features/tag/domain/entities/tag.dart';
import 'package:sahbifit/features/tag/domain/entities/tag_type.dart';
import 'package:sahbifit/features/tag/domain/usecases/get_tags_by_type.dart';

part 'tags_cubit.freezed.dart';
part 'tags_state.dart';

@injectable
class TagsCubit extends Cubit<TagsState> {
  final GetTagsByType _getTagsByType;

  TagsCubit(this._getTagsByType) : super(const TagsState.initial());

  /// Fetches both GOAL and SCHEDULE tags concurrently.
  Future<void> loadAllTags() async {
    emit(const TagsState.loading());
    try {
      // Use Future.wait to fetch both lists in parallel
      final results = await Future.wait([
        _getTagsByType(const GetTagsByTypeParams(type: TagType.goal)),
        _getTagsByType(const GetTagsByTypeParams(type: TagType.schedule)),
      ]);

      // Extract the results
      final goalTags = results[0];
      final scheduleTags = results[1];

      emit(TagsState.loaded(
        goalTags: goalTags,
        scheduleTags: scheduleTags,
      ));
    } on ServerFailure catch (e) {
      emit(TagsState.error(e.message));
    } catch (e) {
      emit(TagsState.error(e.toString()));
    }
  }
}
