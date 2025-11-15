import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/tag/domain/entities/tag.dart';
import 'package:sahbifit/features/tag/domain/entities/tag_type.dart';
import 'package:sahbifit/features/tag/domain/repositories/tag_repository.dart';

@injectable
class GetTagsByType implements UseCase<List<Tag>, GetTagsByTypeParams> {
  final TagRepository _repository;

  GetTagsByType(this._repository);

  @override
  Future<List<Tag>> call(GetTagsByTypeParams params) async {
    return _repository.getTagsByType(params.type);
  }
}

class GetTagsByTypeParams extends Equatable {
  final TagType type;

  const GetTagsByTypeParams({required this.type});

  @override
  List<Object?> get props => [type];
}
