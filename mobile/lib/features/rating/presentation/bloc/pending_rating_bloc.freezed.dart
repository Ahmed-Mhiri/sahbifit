// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pending_rating_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PendingRatingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PendingRatingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PendingRatingEvent()';
}


}

/// @nodoc
class $PendingRatingEventCopyWith<$Res>  {
$PendingRatingEventCopyWith(PendingRatingEvent _, $Res Function(PendingRatingEvent) __);
}


/// Adds pattern-matching-related methods to [PendingRatingEvent].
extension PendingRatingEventPatterns on PendingRatingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchList value)?  fetchList,TResult Function( _SubmitRating value)?  submitRating,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchList() when fetchList != null:
return fetchList(_that);case _SubmitRating() when submitRating != null:
return submitRating(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchList value)  fetchList,required TResult Function( _SubmitRating value)  submitRating,}){
final _that = this;
switch (_that) {
case _FetchList():
return fetchList(_that);case _SubmitRating():
return submitRating(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchList value)?  fetchList,TResult? Function( _SubmitRating value)?  submitRating,}){
final _that = this;
switch (_that) {
case _FetchList() when fetchList != null:
return fetchList(_that);case _SubmitRating() when submitRating != null:
return submitRating(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchList,TResult Function( String sessionId,  String ratedUserId,  int ratingValue,  String? comment)?  submitRating,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchList() when fetchList != null:
return fetchList();case _SubmitRating() when submitRating != null:
return submitRating(_that.sessionId,_that.ratedUserId,_that.ratingValue,_that.comment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchList,required TResult Function( String sessionId,  String ratedUserId,  int ratingValue,  String? comment)  submitRating,}) {final _that = this;
switch (_that) {
case _FetchList():
return fetchList();case _SubmitRating():
return submitRating(_that.sessionId,_that.ratedUserId,_that.ratingValue,_that.comment);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchList,TResult? Function( String sessionId,  String ratedUserId,  int ratingValue,  String? comment)?  submitRating,}) {final _that = this;
switch (_that) {
case _FetchList() when fetchList != null:
return fetchList();case _SubmitRating() when submitRating != null:
return submitRating(_that.sessionId,_that.ratedUserId,_that.ratingValue,_that.comment);case _:
  return null;

}
}

}

/// @nodoc


class _FetchList implements PendingRatingEvent {
  const _FetchList();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchList);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PendingRatingEvent.fetchList()';
}


}




/// @nodoc


class _SubmitRating implements PendingRatingEvent {
  const _SubmitRating({required this.sessionId, required this.ratedUserId, required this.ratingValue, this.comment});
  

 final  String sessionId;
 final  String ratedUserId;
 final  int ratingValue;
 final  String? comment;

/// Create a copy of PendingRatingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmitRatingCopyWith<_SubmitRating> get copyWith => __$SubmitRatingCopyWithImpl<_SubmitRating>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitRating&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.ratedUserId, ratedUserId) || other.ratedUserId == ratedUserId)&&(identical(other.ratingValue, ratingValue) || other.ratingValue == ratingValue)&&(identical(other.comment, comment) || other.comment == comment));
}


@override
int get hashCode => Object.hash(runtimeType,sessionId,ratedUserId,ratingValue,comment);

@override
String toString() {
  return 'PendingRatingEvent.submitRating(sessionId: $sessionId, ratedUserId: $ratedUserId, ratingValue: $ratingValue, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$SubmitRatingCopyWith<$Res> implements $PendingRatingEventCopyWith<$Res> {
  factory _$SubmitRatingCopyWith(_SubmitRating value, $Res Function(_SubmitRating) _then) = __$SubmitRatingCopyWithImpl;
@useResult
$Res call({
 String sessionId, String ratedUserId, int ratingValue, String? comment
});




}
/// @nodoc
class __$SubmitRatingCopyWithImpl<$Res>
    implements _$SubmitRatingCopyWith<$Res> {
  __$SubmitRatingCopyWithImpl(this._self, this._then);

  final _SubmitRating _self;
  final $Res Function(_SubmitRating) _then;

/// Create a copy of PendingRatingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? ratedUserId = null,Object? ratingValue = null,Object? comment = freezed,}) {
  return _then(_SubmitRating(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,ratedUserId: null == ratedUserId ? _self.ratedUserId : ratedUserId // ignore: cast_nullable_to_non_nullable
as String,ratingValue: null == ratingValue ? _self.ratingValue : ratingValue // ignore: cast_nullable_to_non_nullable
as int,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$PendingRatingState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PendingRatingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PendingRatingState()';
}


}

/// @nodoc
class $PendingRatingStateCopyWith<$Res>  {
$PendingRatingStateCopyWith(PendingRatingState _, $Res Function(PendingRatingState) __);
}


/// Adds pattern-matching-related methods to [PendingRatingState].
extension PendingRatingStatePatterns on PendingRatingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _SubmissionSuccess value)?  submissionSuccess,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _SubmissionSuccess() when submissionSuccess != null:
return submissionSuccess(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _SubmissionSuccess value)  submissionSuccess,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _SubmissionSuccess():
return submissionSuccess(_that);case _Error():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _SubmissionSuccess value)?  submissionSuccess,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _SubmissionSuccess() when submissionSuccess != null:
return submissionSuccess(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<PendingRating> pendingRatings)?  loaded,TResult Function()?  submissionSuccess,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.pendingRatings);case _SubmissionSuccess() when submissionSuccess != null:
return submissionSuccess();case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<PendingRating> pendingRatings)  loaded,required TResult Function()  submissionSuccess,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.pendingRatings);case _SubmissionSuccess():
return submissionSuccess();case _Error():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<PendingRating> pendingRatings)?  loaded,TResult? Function()?  submissionSuccess,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.pendingRatings);case _SubmissionSuccess() when submissionSuccess != null:
return submissionSuccess();case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements PendingRatingState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PendingRatingState.initial()';
}


}




/// @nodoc


class _Loading implements PendingRatingState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PendingRatingState.loading()';
}


}




/// @nodoc


class _Loaded implements PendingRatingState {
  const _Loaded({required final  List<PendingRating> pendingRatings}): _pendingRatings = pendingRatings;
  

 final  List<PendingRating> _pendingRatings;
 List<PendingRating> get pendingRatings {
  if (_pendingRatings is EqualUnmodifiableListView) return _pendingRatings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pendingRatings);
}


/// Create a copy of PendingRatingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._pendingRatings, _pendingRatings));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_pendingRatings));

@override
String toString() {
  return 'PendingRatingState.loaded(pendingRatings: $pendingRatings)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $PendingRatingStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<PendingRating> pendingRatings
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of PendingRatingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pendingRatings = null,}) {
  return _then(_Loaded(
pendingRatings: null == pendingRatings ? _self._pendingRatings : pendingRatings // ignore: cast_nullable_to_non_nullable
as List<PendingRating>,
  ));
}


}

/// @nodoc


class _SubmissionSuccess implements PendingRatingState {
  const _SubmissionSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmissionSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PendingRatingState.submissionSuccess()';
}


}




/// @nodoc


class _Error implements PendingRatingState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of PendingRatingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PendingRatingState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $PendingRatingStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of PendingRatingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
