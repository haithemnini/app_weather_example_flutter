// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WeatherState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() refresh,
    required TResult Function(WeatherResponse weather) success,
    required TResult Function(String errorMessage) error,
    required TResult Function(int units) changedUnits,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? refresh,
    TResult? Function(WeatherResponse weather)? success,
    TResult? Function(String errorMessage)? error,
    TResult? Function(int units)? changedUnits,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? refresh,
    TResult Function(WeatherResponse weather)? success,
    TResult Function(String errorMessage)? error,
    TResult Function(int units)? changedUnits,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Refresh value) refresh,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
    required TResult Function(ChangedUnits value) changedUnits,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Refresh value)? refresh,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
    TResult? Function(ChangedUnits value)? changedUnits,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Refresh value)? refresh,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    TResult Function(ChangedUnits value)? changedUnits,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherStateCopyWith<$Res> {
  factory $WeatherStateCopyWith(
          WeatherState value, $Res Function(WeatherState) then) =
      _$WeatherStateCopyWithImpl<$Res, WeatherState>;
}

/// @nodoc
class _$WeatherStateCopyWithImpl<$Res, $Val extends WeatherState>
    implements $WeatherStateCopyWith<$Res> {
  _$WeatherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'WeatherState.initial()';
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
    required TResult Function() refresh,
    required TResult Function(WeatherResponse weather) success,
    required TResult Function(String errorMessage) error,
    required TResult Function(int units) changedUnits,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? refresh,
    TResult? Function(WeatherResponse weather)? success,
    TResult? Function(String errorMessage)? error,
    TResult? Function(int units)? changedUnits,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? refresh,
    TResult Function(WeatherResponse weather)? success,
    TResult Function(String errorMessage)? error,
    TResult Function(int units)? changedUnits,
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
    required TResult Function(Loading value) loading,
    required TResult Function(Refresh value) refresh,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
    required TResult Function(ChangedUnits value) changedUnits,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Refresh value)? refresh,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
    TResult? Function(ChangedUnits value)? changedUnits,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Refresh value)? refresh,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    TResult Function(ChangedUnits value)? changedUnits,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements WeatherState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'WeatherState.loading()';
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
    required TResult Function() refresh,
    required TResult Function(WeatherResponse weather) success,
    required TResult Function(String errorMessage) error,
    required TResult Function(int units) changedUnits,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? refresh,
    TResult? Function(WeatherResponse weather)? success,
    TResult? Function(String errorMessage)? error,
    TResult? Function(int units)? changedUnits,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? refresh,
    TResult Function(WeatherResponse weather)? success,
    TResult Function(String errorMessage)? error,
    TResult Function(int units)? changedUnits,
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
    required TResult Function(Loading value) loading,
    required TResult Function(Refresh value) refresh,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
    required TResult Function(ChangedUnits value) changedUnits,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Refresh value)? refresh,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
    TResult? Function(ChangedUnits value)? changedUnits,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Refresh value)? refresh,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    TResult Function(ChangedUnits value)? changedUnits,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements WeatherState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$RefreshImplCopyWith<$Res> {
  factory _$$RefreshImplCopyWith(
          _$RefreshImpl value, $Res Function(_$RefreshImpl) then) =
      __$$RefreshImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshImplCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res, _$RefreshImpl>
    implements _$$RefreshImplCopyWith<$Res> {
  __$$RefreshImplCopyWithImpl(
      _$RefreshImpl _value, $Res Function(_$RefreshImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RefreshImpl implements Refresh {
  const _$RefreshImpl();

  @override
  String toString() {
    return 'WeatherState.refresh()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() refresh,
    required TResult Function(WeatherResponse weather) success,
    required TResult Function(String errorMessage) error,
    required TResult Function(int units) changedUnits,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? refresh,
    TResult? Function(WeatherResponse weather)? success,
    TResult? Function(String errorMessage)? error,
    TResult? Function(int units)? changedUnits,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? refresh,
    TResult Function(WeatherResponse weather)? success,
    TResult Function(String errorMessage)? error,
    TResult Function(int units)? changedUnits,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Refresh value) refresh,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
    required TResult Function(ChangedUnits value) changedUnits,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Refresh value)? refresh,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
    TResult? Function(ChangedUnits value)? changedUnits,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Refresh value)? refresh,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    TResult Function(ChangedUnits value)? changedUnits,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class Refresh implements WeatherState {
  const factory Refresh() = _$RefreshImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({WeatherResponse weather});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weather = null,
  }) {
    return _then(_$SuccessImpl(
      null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as WeatherResponse,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements Success {
  const _$SuccessImpl(this.weather);

  @override
  final WeatherResponse weather;

  @override
  String toString() {
    return 'WeatherState.success(weather: $weather)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.weather, weather) || other.weather == weather));
  }

  @override
  int get hashCode => Object.hash(runtimeType, weather);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() refresh,
    required TResult Function(WeatherResponse weather) success,
    required TResult Function(String errorMessage) error,
    required TResult Function(int units) changedUnits,
  }) {
    return success(weather);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? refresh,
    TResult? Function(WeatherResponse weather)? success,
    TResult? Function(String errorMessage)? error,
    TResult? Function(int units)? changedUnits,
  }) {
    return success?.call(weather);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? refresh,
    TResult Function(WeatherResponse weather)? success,
    TResult Function(String errorMessage)? error,
    TResult Function(int units)? changedUnits,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(weather);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Refresh value) refresh,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
    required TResult Function(ChangedUnits value) changedUnits,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Refresh value)? refresh,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
    TResult? Function(ChangedUnits value)? changedUnits,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Refresh value)? refresh,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    TResult Function(ChangedUnits value)? changedUnits,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements WeatherState {
  const factory Success(final WeatherResponse weather) = _$SuccessImpl;

  WeatherResponse get weather;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$ErrorImpl(
      null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl(this.errorMessage);

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'WeatherState.error(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() refresh,
    required TResult Function(WeatherResponse weather) success,
    required TResult Function(String errorMessage) error,
    required TResult Function(int units) changedUnits,
  }) {
    return error(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? refresh,
    TResult? Function(WeatherResponse weather)? success,
    TResult? Function(String errorMessage)? error,
    TResult? Function(int units)? changedUnits,
  }) {
    return error?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? refresh,
    TResult Function(WeatherResponse weather)? success,
    TResult Function(String errorMessage)? error,
    TResult Function(int units)? changedUnits,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Refresh value) refresh,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
    required TResult Function(ChangedUnits value) changedUnits,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Refresh value)? refresh,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
    TResult? Function(ChangedUnits value)? changedUnits,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Refresh value)? refresh,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    TResult Function(ChangedUnits value)? changedUnits,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements WeatherState {
  const factory Error(final String errorMessage) = _$ErrorImpl;

  String get errorMessage;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangedUnitsImplCopyWith<$Res> {
  factory _$$ChangedUnitsImplCopyWith(
          _$ChangedUnitsImpl value, $Res Function(_$ChangedUnitsImpl) then) =
      __$$ChangedUnitsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int units});
}

/// @nodoc
class __$$ChangedUnitsImplCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res, _$ChangedUnitsImpl>
    implements _$$ChangedUnitsImplCopyWith<$Res> {
  __$$ChangedUnitsImplCopyWithImpl(
      _$ChangedUnitsImpl _value, $Res Function(_$ChangedUnitsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? units = null,
  }) {
    return _then(_$ChangedUnitsImpl(
      null == units
          ? _value.units
          : units // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChangedUnitsImpl implements ChangedUnits {
  const _$ChangedUnitsImpl(this.units);

  @override
  final int units;

  @override
  String toString() {
    return 'WeatherState.changedUnits(units: $units)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangedUnitsImpl &&
            (identical(other.units, units) || other.units == units));
  }

  @override
  int get hashCode => Object.hash(runtimeType, units);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangedUnitsImplCopyWith<_$ChangedUnitsImpl> get copyWith =>
      __$$ChangedUnitsImplCopyWithImpl<_$ChangedUnitsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() refresh,
    required TResult Function(WeatherResponse weather) success,
    required TResult Function(String errorMessage) error,
    required TResult Function(int units) changedUnits,
  }) {
    return changedUnits(units);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? refresh,
    TResult? Function(WeatherResponse weather)? success,
    TResult? Function(String errorMessage)? error,
    TResult? Function(int units)? changedUnits,
  }) {
    return changedUnits?.call(units);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? refresh,
    TResult Function(WeatherResponse weather)? success,
    TResult Function(String errorMessage)? error,
    TResult Function(int units)? changedUnits,
    required TResult orElse(),
  }) {
    if (changedUnits != null) {
      return changedUnits(units);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Refresh value) refresh,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
    required TResult Function(ChangedUnits value) changedUnits,
  }) {
    return changedUnits(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Refresh value)? refresh,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
    TResult? Function(ChangedUnits value)? changedUnits,
  }) {
    return changedUnits?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Refresh value)? refresh,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    TResult Function(ChangedUnits value)? changedUnits,
    required TResult orElse(),
  }) {
    if (changedUnits != null) {
      return changedUnits(this);
    }
    return orElse();
  }
}

abstract class ChangedUnits implements WeatherState {
  const factory ChangedUnits(final int units) = _$ChangedUnitsImpl;

  int get units;
  @JsonKey(ignore: true)
  _$$ChangedUnitsImplCopyWith<_$ChangedUnitsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
