// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TagModel {
  int get tagId;
  String get tagName;
  TagType get tagType;

  /// Create a copy of TagModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TagModelCopyWith<TagModel> get copyWith =>
      _$TagModelCopyWithImpl<TagModel>(this as TagModel, _$identity);

  /// Serializes this TagModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TagModel &&
            (identical(other.tagId, tagId) || other.tagId == tagId) &&
            (identical(other.tagName, tagName) || other.tagName == tagName) &&
            (identical(other.tagType, tagType) || other.tagType == tagType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tagId, tagName, tagType);

  @override
  String toString() {
    return 'TagModel(tagId: $tagId, tagName: $tagName, tagType: $tagType)';
  }
}

/// @nodoc
abstract mixin class $TagModelCopyWith<$Res> {
  factory $TagModelCopyWith(TagModel value, $Res Function(TagModel) _then) =
      _$TagModelCopyWithImpl;
  @useResult
  $Res call({int tagId, String tagName, TagType tagType});
}

/// @nodoc
class _$TagModelCopyWithImpl<$Res> implements $TagModelCopyWith<$Res> {
  _$TagModelCopyWithImpl(this._self, this._then);

  final TagModel _self;
  final $Res Function(TagModel) _then;

  /// Create a copy of TagModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tagId = null,
    Object? tagName = null,
    Object? tagType = null,
  }) {
    return _then(_self.copyWith(
      tagId: null == tagId
          ? _self.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int,
      tagName: null == tagName
          ? _self.tagName
          : tagName // ignore: cast_nullable_to_non_nullable
              as String,
      tagType: null == tagType
          ? _self.tagType
          : tagType // ignore: cast_nullable_to_non_nullable
              as TagType,
    ));
  }
}

/// Adds pattern-matching-related methods to [TagModel].
extension TagModelPatterns on TagModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TagModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TagModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TagModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TagModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TagModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TagModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int tagId, String tagName, TagType tagType)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TagModel() when $default != null:
        return $default(_that.tagId, _that.tagName, _that.tagType);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int tagId, String tagName, TagType tagType) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TagModel():
        return $default(_that.tagId, _that.tagName, _that.tagType);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int tagId, String tagName, TagType tagType)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TagModel() when $default != null:
        return $default(_that.tagId, _that.tagName, _that.tagType);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _TagModel extends TagModel {
  const _TagModel(
      {required this.tagId, required this.tagName, required this.tagType})
      : super._();
  factory _TagModel.fromJson(Map<String, dynamic> json) =>
      _$TagModelFromJson(json);

  @override
  final int tagId;
  @override
  final String tagName;
  @override
  final TagType tagType;

  /// Create a copy of TagModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TagModelCopyWith<_TagModel> get copyWith =>
      __$TagModelCopyWithImpl<_TagModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TagModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TagModel &&
            (identical(other.tagId, tagId) || other.tagId == tagId) &&
            (identical(other.tagName, tagName) || other.tagName == tagName) &&
            (identical(other.tagType, tagType) || other.tagType == tagType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tagId, tagName, tagType);

  @override
  String toString() {
    return 'TagModel(tagId: $tagId, tagName: $tagName, tagType: $tagType)';
  }
}

/// @nodoc
abstract mixin class _$TagModelCopyWith<$Res>
    implements $TagModelCopyWith<$Res> {
  factory _$TagModelCopyWith(_TagModel value, $Res Function(_TagModel) _then) =
      __$TagModelCopyWithImpl;
  @override
  @useResult
  $Res call({int tagId, String tagName, TagType tagType});
}

/// @nodoc
class __$TagModelCopyWithImpl<$Res> implements _$TagModelCopyWith<$Res> {
  __$TagModelCopyWithImpl(this._self, this._then);

  final _TagModel _self;
  final $Res Function(_TagModel) _then;

  /// Create a copy of TagModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tagId = null,
    Object? tagName = null,
    Object? tagType = null,
  }) {
    return _then(_TagModel(
      tagId: null == tagId
          ? _self.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int,
      tagName: null == tagName
          ? _self.tagName
          : tagName // ignore: cast_nullable_to_non_nullable
              as String,
      tagType: null == tagType
          ? _self.tagType
          : tagType // ignore: cast_nullable_to_non_nullable
              as TagType,
    ));
  }
}

// dart format on
