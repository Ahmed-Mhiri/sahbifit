// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pending_rating_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PendingRatingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchList,
    required TResult Function(
      String sessionId,
      String ratedUserId,
      int ratingValue,
      String? comment,
    )
    submitRating,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchList,
    TResult? Function(
      String sessionId,
      String ratedUserId,
      int ratingValue,
      String? comment,
    )?
    submitRating,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchList,
    TResult Function(
      String sessionId,
      String ratedUserId,
      int ratingValue,
      String? comment,
    )?
    submitRating,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchList value) fetchList,
    required TResult Function(_SubmitRating value) submitRating,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchList value)? fetchList,
    TResult? Function(_SubmitRating value)? submitRating,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchList value)? fetchList,
    TResult Function(_SubmitRating value)? submitRating,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingRatingEventCopyWith<$Res> {
  factory $PendingRatingEventCopyWith(
    PendingRatingEvent value,
    $Res Function(PendingRatingEvent) then,
  ) = _$PendingRatingEventCopyWithImpl<$Res, PendingRatingEvent>;
}

/// @nodoc
class _$PendingRatingEventCopyWithImpl<$Res, $Val extends PendingRatingEvent>
    implements $PendingRatingEventCopyWith<$Res> {
  _$PendingRatingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PendingRatingEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchListImplCopyWith<$Res> {
  factory _$$FetchListImplCopyWith(
    _$FetchListImpl value,
    $Res Function(_$FetchListImpl) then,
  ) = __$$FetchListImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchListImplCopyWithImpl<$Res>
    extends _$PendingRatingEventCopyWithImpl<$Res, _$FetchListImpl>
    implements _$$FetchListImplCopyWith<$Res> {
  __$$FetchListImplCopyWithImpl(
    _$FetchListImpl _value,
    $Res Function(_$FetchListImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PendingRatingEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchListImpl implements _FetchList {
  const _$FetchListImpl();

  @override
  String toString() {
    return 'PendingRatingEvent.fetchList()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchListImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchList,
    required TResult Function(
      String sessionId,
      String ratedUserId,
      int ratingValue,
      String? comment,
    )
    submitRating,
  }) {
    return fetchList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchList,
    TResult? Function(
      String sessionId,
      String ratedUserId,
      int ratingValue,
      String? comment,
    )?
    submitRating,
  }) {
    return fetchList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchList,
    TResult Function(
      String sessionId,
      String ratedUserId,
      int ratingValue,
      String? comment,
    )?
    submitRating,
    required TResult orElse(),
  }) {
    if (fetchList != null) {
      return fetchList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchList value) fetchList,
    required TResult Function(_SubmitRating value) submitRating,
  }) {
    return fetchList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchList value)? fetchList,
    TResult? Function(_SubmitRating value)? submitRating,
  }) {
    return fetchList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchList value)? fetchList,
    TResult Function(_SubmitRating value)? submitRating,
    required TResult orElse(),
  }) {
    if (fetchList != null) {
      return fetchList(this);
    }
    return orElse();
  }
}

abstract class _FetchList implements PendingRatingEvent {
  const factory _FetchList() = _$FetchListImpl;
}

/// @nodoc
abstract class _$$SubmitRatingImplCopyWith<$Res> {
  factory _$$SubmitRatingImplCopyWith(
    _$SubmitRatingImpl value,
    $Res Function(_$SubmitRatingImpl) then,
  ) = __$$SubmitRatingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String sessionId,
    String ratedUserId,
    int ratingValue,
    String? comment,
  });
}

/// @nodoc
class __$$SubmitRatingImplCopyWithImpl<$Res>
    extends _$PendingRatingEventCopyWithImpl<$Res, _$SubmitRatingImpl>
    implements _$$SubmitRatingImplCopyWith<$Res> {
  __$$SubmitRatingImplCopyWithImpl(
    _$SubmitRatingImpl _value,
    $Res Function(_$SubmitRatingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PendingRatingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? ratedUserId = null,
    Object? ratingValue = null,
    Object? comment = freezed,
  }) {
    return _then(
      _$SubmitRatingImpl(
        sessionId: null == sessionId
            ? _value.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String,
        ratedUserId: null == ratedUserId
            ? _value.ratedUserId
            : ratedUserId // ignore: cast_nullable_to_non_nullable
                  as String,
        ratingValue: null == ratingValue
            ? _value.ratingValue
            : ratingValue // ignore: cast_nullable_to_non_nullable
                  as int,
        comment: freezed == comment
            ? _value.comment
            : comment // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$SubmitRatingImpl implements _SubmitRating {
  const _$SubmitRatingImpl({
    required this.sessionId,
    required this.ratedUserId,
    required this.ratingValue,
    this.comment,
  });

  @override
  final String sessionId;
  @override
  final String ratedUserId;
  @override
  final int ratingValue;
  @override
  final String? comment;

  @override
  String toString() {
    return 'PendingRatingEvent.submitRating(sessionId: $sessionId, ratedUserId: $ratedUserId, ratingValue: $ratingValue, comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitRatingImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.ratedUserId, ratedUserId) ||
                other.ratedUserId == ratedUserId) &&
            (identical(other.ratingValue, ratingValue) ||
                other.ratingValue == ratingValue) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, sessionId, ratedUserId, ratingValue, comment);

  /// Create a copy of PendingRatingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitRatingImplCopyWith<_$SubmitRatingImpl> get copyWith =>
      __$$SubmitRatingImplCopyWithImpl<_$SubmitRatingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchList,
    required TResult Function(
      String sessionId,
      String ratedUserId,
      int ratingValue,
      String? comment,
    )
    submitRating,
  }) {
    return submitRating(sessionId, ratedUserId, ratingValue, comment);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchList,
    TResult? Function(
      String sessionId,
      String ratedUserId,
      int ratingValue,
      String? comment,
    )?
    submitRating,
  }) {
    return submitRating?.call(sessionId, ratedUserId, ratingValue, comment);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchList,
    TResult Function(
      String sessionId,
      String ratedUserId,
      int ratingValue,
      String? comment,
    )?
    submitRating,
    required TResult orElse(),
  }) {
    if (submitRating != null) {
      return submitRating(sessionId, ratedUserId, ratingValue, comment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchList value) fetchList,
    required TResult Function(_SubmitRating value) submitRating,
  }) {
    return submitRating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchList value)? fetchList,
    TResult? Function(_SubmitRating value)? submitRating,
  }) {
    return submitRating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchList value)? fetchList,
    TResult Function(_SubmitRating value)? submitRating,
    required TResult orElse(),
  }) {
    if (submitRating != null) {
      return submitRating(this);
    }
    return orElse();
  }
}

abstract class _SubmitRating implements PendingRatingEvent {
  const factory _SubmitRating({
    required final String sessionId,
    required final String ratedUserId,
    required final int ratingValue,
    final String? comment,
  }) = _$SubmitRatingImpl;

  String get sessionId;
  String get ratedUserId;
  int get ratingValue;
  String? get comment;

  /// Create a copy of PendingRatingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubmitRatingImplCopyWith<_$SubmitRatingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PendingRatingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PendingRating> pendingRatings) loaded,
    required TResult Function() submissionSuccess,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PendingRating> pendingRatings)? loaded,
    TResult? Function()? submissionSuccess,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PendingRating> pendingRatings)? loaded,
    TResult Function()? submissionSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_SubmissionSuccess value) submissionSuccess,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_SubmissionSuccess value)? submissionSuccess,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_SubmissionSuccess value)? submissionSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingRatingStateCopyWith<$Res> {
  factory $PendingRatingStateCopyWith(
    PendingRatingState value,
    $Res Function(PendingRatingState) then,
  ) = _$PendingRatingStateCopyWithImpl<$Res, PendingRatingState>;
}

/// @nodoc
class _$PendingRatingStateCopyWithImpl<$Res, $Val extends PendingRatingState>
    implements $PendingRatingStateCopyWith<$Res> {
  _$PendingRatingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PendingRatingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PendingRatingStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PendingRatingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PendingRatingState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PendingRating> pendingRatings) loaded,
    required TResult Function() submissionSuccess,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PendingRating> pendingRatings)? loaded,
    TResult? Function()? submissionSuccess,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PendingRating> pendingRatings)? loaded,
    TResult Function()? submissionSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_SubmissionSuccess value) submissionSuccess,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_SubmissionSuccess value)? submissionSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_SubmissionSuccess value)? submissionSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PendingRatingState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$PendingRatingStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PendingRatingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'PendingRatingState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PendingRating> pendingRatings) loaded,
    required TResult Function() submissionSuccess,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PendingRating> pendingRatings)? loaded,
    TResult? Function()? submissionSuccess,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PendingRating> pendingRatings)? loaded,
    TResult Function()? submissionSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_SubmissionSuccess value) submissionSuccess,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_SubmissionSuccess value)? submissionSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_SubmissionSuccess value)? submissionSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements PendingRatingState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
    _$LoadedImpl value,
    $Res Function(_$LoadedImpl) then,
  ) = __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PendingRating> pendingRatings});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$PendingRatingStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
    _$LoadedImpl _value,
    $Res Function(_$LoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PendingRatingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? pendingRatings = null}) {
    return _then(
      _$LoadedImpl(
        pendingRatings: null == pendingRatings
            ? _value._pendingRatings
            : pendingRatings // ignore: cast_nullable_to_non_nullable
                  as List<PendingRating>,
      ),
    );
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl({required final List<PendingRating> pendingRatings})
    : _pendingRatings = pendingRatings;

  final List<PendingRating> _pendingRatings;
  @override
  List<PendingRating> get pendingRatings {
    if (_pendingRatings is EqualUnmodifiableListView) return _pendingRatings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pendingRatings);
  }

  @override
  String toString() {
    return 'PendingRatingState.loaded(pendingRatings: $pendingRatings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(
              other._pendingRatings,
              _pendingRatings,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_pendingRatings),
  );

  /// Create a copy of PendingRatingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PendingRating> pendingRatings) loaded,
    required TResult Function() submissionSuccess,
    required TResult Function(String message) error,
  }) {
    return loaded(pendingRatings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PendingRating> pendingRatings)? loaded,
    TResult? Function()? submissionSuccess,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(pendingRatings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PendingRating> pendingRatings)? loaded,
    TResult Function()? submissionSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(pendingRatings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_SubmissionSuccess value) submissionSuccess,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_SubmissionSuccess value)? submissionSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_SubmissionSuccess value)? submissionSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements PendingRatingState {
  const factory _Loaded({required final List<PendingRating> pendingRatings}) =
      _$LoadedImpl;

  List<PendingRating> get pendingRatings;

  /// Create a copy of PendingRatingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmissionSuccessImplCopyWith<$Res> {
  factory _$$SubmissionSuccessImplCopyWith(
    _$SubmissionSuccessImpl value,
    $Res Function(_$SubmissionSuccessImpl) then,
  ) = __$$SubmissionSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SubmissionSuccessImplCopyWithImpl<$Res>
    extends _$PendingRatingStateCopyWithImpl<$Res, _$SubmissionSuccessImpl>
    implements _$$SubmissionSuccessImplCopyWith<$Res> {
  __$$SubmissionSuccessImplCopyWithImpl(
    _$SubmissionSuccessImpl _value,
    $Res Function(_$SubmissionSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PendingRatingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SubmissionSuccessImpl implements _SubmissionSuccess {
  const _$SubmissionSuccessImpl();

  @override
  String toString() {
    return 'PendingRatingState.submissionSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SubmissionSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PendingRating> pendingRatings) loaded,
    required TResult Function() submissionSuccess,
    required TResult Function(String message) error,
  }) {
    return submissionSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PendingRating> pendingRatings)? loaded,
    TResult? Function()? submissionSuccess,
    TResult? Function(String message)? error,
  }) {
    return submissionSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PendingRating> pendingRatings)? loaded,
    TResult Function()? submissionSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (submissionSuccess != null) {
      return submissionSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_SubmissionSuccess value) submissionSuccess,
    required TResult Function(_Error value) error,
  }) {
    return submissionSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_SubmissionSuccess value)? submissionSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return submissionSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_SubmissionSuccess value)? submissionSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (submissionSuccess != null) {
      return submissionSuccess(this);
    }
    return orElse();
  }
}

abstract class _SubmissionSuccess implements PendingRatingState {
  const factory _SubmissionSuccess() = _$SubmissionSuccessImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$PendingRatingStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PendingRatingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'PendingRatingState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of PendingRatingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PendingRating> pendingRatings) loaded,
    required TResult Function() submissionSuccess,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PendingRating> pendingRatings)? loaded,
    TResult? Function()? submissionSuccess,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PendingRating> pendingRatings)? loaded,
    TResult Function()? submissionSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_SubmissionSuccess value) submissionSuccess,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_SubmissionSuccess value)? submissionSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_SubmissionSuccess value)? submissionSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements PendingRatingState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of PendingRatingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
