// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CharacterDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CharacterDetailState()';
}


}

/// @nodoc
class $CharacterDetailStateCopyWith<$Res>  {
$CharacterDetailStateCopyWith(CharacterDetailState _, $Res Function(CharacterDetailState) __);
}


/// Adds pattern-matching-related methods to [CharacterDetailState].
extension CharacterDetailStatePatterns on CharacterDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _LoadingCharacter value)?  loadingCharacter,TResult Function( _CharacterLoaded value)?  characterLoaded,TResult Function( _LoadingDescription value)?  loadingDescription,TResult Function( _Streaming value)?  streaming,TResult Function( _Loaded value)?  loaded,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadingCharacter() when loadingCharacter != null:
return loadingCharacter(_that);case _CharacterLoaded() when characterLoaded != null:
return characterLoaded(_that);case _LoadingDescription() when loadingDescription != null:
return loadingDescription(_that);case _Streaming() when streaming != null:
return streaming(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _LoadingCharacter value)  loadingCharacter,required TResult Function( _CharacterLoaded value)  characterLoaded,required TResult Function( _LoadingDescription value)  loadingDescription,required TResult Function( _Streaming value)  streaming,required TResult Function( _Loaded value)  loaded,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _LoadingCharacter():
return loadingCharacter(_that);case _CharacterLoaded():
return characterLoaded(_that);case _LoadingDescription():
return loadingDescription(_that);case _Streaming():
return streaming(_that);case _Loaded():
return loaded(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _LoadingCharacter value)?  loadingCharacter,TResult? Function( _CharacterLoaded value)?  characterLoaded,TResult? Function( _LoadingDescription value)?  loadingDescription,TResult? Function( _Streaming value)?  streaming,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadingCharacter() when loadingCharacter != null:
return loadingCharacter(_that);case _CharacterLoaded() when characterLoaded != null:
return characterLoaded(_that);case _LoadingDescription() when loadingDescription != null:
return loadingDescription(_that);case _Streaming() when streaming != null:
return streaming(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loadingCharacter,TResult Function( CharacterEntity character)?  characterLoaded,TResult Function( CharacterEntity character)?  loadingDescription,TResult Function( CharacterEntity character,  String partialText)?  streaming,TResult Function( CharacterEntity character,  String fullText)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _LoadingCharacter() when loadingCharacter != null:
return loadingCharacter();case _CharacterLoaded() when characterLoaded != null:
return characterLoaded(_that.character);case _LoadingDescription() when loadingDescription != null:
return loadingDescription(_that.character);case _Streaming() when streaming != null:
return streaming(_that.character,_that.partialText);case _Loaded() when loaded != null:
return loaded(_that.character,_that.fullText);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loadingCharacter,required TResult Function( CharacterEntity character)  characterLoaded,required TResult Function( CharacterEntity character)  loadingDescription,required TResult Function( CharacterEntity character,  String partialText)  streaming,required TResult Function( CharacterEntity character,  String fullText)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _LoadingCharacter():
return loadingCharacter();case _CharacterLoaded():
return characterLoaded(_that.character);case _LoadingDescription():
return loadingDescription(_that.character);case _Streaming():
return streaming(_that.character,_that.partialText);case _Loaded():
return loaded(_that.character,_that.fullText);case _Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loadingCharacter,TResult? Function( CharacterEntity character)?  characterLoaded,TResult? Function( CharacterEntity character)?  loadingDescription,TResult? Function( CharacterEntity character,  String partialText)?  streaming,TResult? Function( CharacterEntity character,  String fullText)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _LoadingCharacter() when loadingCharacter != null:
return loadingCharacter();case _CharacterLoaded() when characterLoaded != null:
return characterLoaded(_that.character);case _LoadingDescription() when loadingDescription != null:
return loadingDescription(_that.character);case _Streaming() when streaming != null:
return streaming(_that.character,_that.partialText);case _Loaded() when loaded != null:
return loaded(_that.character,_that.fullText);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CharacterDetailState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CharacterDetailState.initial()';
}


}




/// @nodoc


class _LoadingCharacter implements CharacterDetailState {
  const _LoadingCharacter();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingCharacter);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CharacterDetailState.loadingCharacter()';
}


}




/// @nodoc


class _CharacterLoaded implements CharacterDetailState {
  const _CharacterLoaded({required this.character});
  

 final  CharacterEntity character;

/// Create a copy of CharacterDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharacterLoadedCopyWith<_CharacterLoaded> get copyWith => __$CharacterLoadedCopyWithImpl<_CharacterLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharacterLoaded&&(identical(other.character, character) || other.character == character));
}


@override
int get hashCode => Object.hash(runtimeType,character);

@override
String toString() {
  return 'CharacterDetailState.characterLoaded(character: $character)';
}


}

/// @nodoc
abstract mixin class _$CharacterLoadedCopyWith<$Res> implements $CharacterDetailStateCopyWith<$Res> {
  factory _$CharacterLoadedCopyWith(_CharacterLoaded value, $Res Function(_CharacterLoaded) _then) = __$CharacterLoadedCopyWithImpl;
@useResult
$Res call({
 CharacterEntity character
});


$CharacterEntityCopyWith<$Res> get character;

}
/// @nodoc
class __$CharacterLoadedCopyWithImpl<$Res>
    implements _$CharacterLoadedCopyWith<$Res> {
  __$CharacterLoadedCopyWithImpl(this._self, this._then);

  final _CharacterLoaded _self;
  final $Res Function(_CharacterLoaded) _then;

/// Create a copy of CharacterDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? character = null,}) {
  return _then(_CharacterLoaded(
character: null == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as CharacterEntity,
  ));
}

/// Create a copy of CharacterDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterEntityCopyWith<$Res> get character {
  
  return $CharacterEntityCopyWith<$Res>(_self.character, (value) {
    return _then(_self.copyWith(character: value));
  });
}
}

/// @nodoc


class _LoadingDescription implements CharacterDetailState {
  const _LoadingDescription({required this.character});
  

 final  CharacterEntity character;

/// Create a copy of CharacterDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingDescriptionCopyWith<_LoadingDescription> get copyWith => __$LoadingDescriptionCopyWithImpl<_LoadingDescription>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingDescription&&(identical(other.character, character) || other.character == character));
}


@override
int get hashCode => Object.hash(runtimeType,character);

@override
String toString() {
  return 'CharacterDetailState.loadingDescription(character: $character)';
}


}

/// @nodoc
abstract mixin class _$LoadingDescriptionCopyWith<$Res> implements $CharacterDetailStateCopyWith<$Res> {
  factory _$LoadingDescriptionCopyWith(_LoadingDescription value, $Res Function(_LoadingDescription) _then) = __$LoadingDescriptionCopyWithImpl;
@useResult
$Res call({
 CharacterEntity character
});


$CharacterEntityCopyWith<$Res> get character;

}
/// @nodoc
class __$LoadingDescriptionCopyWithImpl<$Res>
    implements _$LoadingDescriptionCopyWith<$Res> {
  __$LoadingDescriptionCopyWithImpl(this._self, this._then);

  final _LoadingDescription _self;
  final $Res Function(_LoadingDescription) _then;

/// Create a copy of CharacterDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? character = null,}) {
  return _then(_LoadingDescription(
character: null == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as CharacterEntity,
  ));
}

/// Create a copy of CharacterDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterEntityCopyWith<$Res> get character {
  
  return $CharacterEntityCopyWith<$Res>(_self.character, (value) {
    return _then(_self.copyWith(character: value));
  });
}
}

/// @nodoc


class _Streaming implements CharacterDetailState {
  const _Streaming({required this.character, required this.partialText});
  

 final  CharacterEntity character;
 final  String partialText;

/// Create a copy of CharacterDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StreamingCopyWith<_Streaming> get copyWith => __$StreamingCopyWithImpl<_Streaming>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Streaming&&(identical(other.character, character) || other.character == character)&&(identical(other.partialText, partialText) || other.partialText == partialText));
}


@override
int get hashCode => Object.hash(runtimeType,character,partialText);

@override
String toString() {
  return 'CharacterDetailState.streaming(character: $character, partialText: $partialText)';
}


}

/// @nodoc
abstract mixin class _$StreamingCopyWith<$Res> implements $CharacterDetailStateCopyWith<$Res> {
  factory _$StreamingCopyWith(_Streaming value, $Res Function(_Streaming) _then) = __$StreamingCopyWithImpl;
@useResult
$Res call({
 CharacterEntity character, String partialText
});


$CharacterEntityCopyWith<$Res> get character;

}
/// @nodoc
class __$StreamingCopyWithImpl<$Res>
    implements _$StreamingCopyWith<$Res> {
  __$StreamingCopyWithImpl(this._self, this._then);

  final _Streaming _self;
  final $Res Function(_Streaming) _then;

/// Create a copy of CharacterDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? character = null,Object? partialText = null,}) {
  return _then(_Streaming(
character: null == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as CharacterEntity,partialText: null == partialText ? _self.partialText : partialText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of CharacterDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterEntityCopyWith<$Res> get character {
  
  return $CharacterEntityCopyWith<$Res>(_self.character, (value) {
    return _then(_self.copyWith(character: value));
  });
}
}

/// @nodoc


class _Loaded implements CharacterDetailState {
  const _Loaded({required this.character, required this.fullText});
  

 final  CharacterEntity character;
 final  String fullText;

/// Create a copy of CharacterDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.character, character) || other.character == character)&&(identical(other.fullText, fullText) || other.fullText == fullText));
}


@override
int get hashCode => Object.hash(runtimeType,character,fullText);

@override
String toString() {
  return 'CharacterDetailState.loaded(character: $character, fullText: $fullText)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $CharacterDetailStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 CharacterEntity character, String fullText
});


$CharacterEntityCopyWith<$Res> get character;

}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of CharacterDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? character = null,Object? fullText = null,}) {
  return _then(_Loaded(
character: null == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as CharacterEntity,fullText: null == fullText ? _self.fullText : fullText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of CharacterDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterEntityCopyWith<$Res> get character {
  
  return $CharacterEntityCopyWith<$Res>(_self.character, (value) {
    return _then(_self.copyWith(character: value));
  });
}
}

/// @nodoc


class _Error implements CharacterDetailState {
  const _Error({required this.message});
  

 final  String message;

/// Create a copy of CharacterDetailState
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
  return 'CharacterDetailState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $CharacterDetailStateCopyWith<$Res> {
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

/// Create a copy of CharacterDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
