import 'package:equatable/equatable.dart';
import '../domain/entities/tag.dart';

abstract class TagsState extends Equatable {
  const TagsState();

  @override
  List<Object> get props => [];
}

/// Initial state, before any loading.
class TagsInitial extends TagsState {}

/// State when the tags are being fetched from the API.
class TagsLoading extends TagsState {}

/// State when the tags have been successfully loaded.
class TagsLoaded extends TagsState {
  final List<Tag> tags;

  const TagsLoaded(this.tags);

  @override
  List<Object> get props => [tags];
}

/// State when an error occurred while fetching tags.
class TagsError extends TagsState {
  final String message;

  const TagsError(this.message);

  @override
  List<Object> get props => [message];
}