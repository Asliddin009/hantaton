// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_post_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DetailPostState {
  AsyncSnapshot<dynamic> get asyncSnapshot =>
      throw _privateConstructorUsedError;
  PostEntity? get postEntity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailPostStateCopyWith<DetailPostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailPostStateCopyWith<$Res> {
  factory $DetailPostStateCopyWith(
          DetailPostState value, $Res Function(DetailPostState) then) =
      _$DetailPostStateCopyWithImpl<$Res, DetailPostState>;
  @useResult
  $Res call({AsyncSnapshot<dynamic> asyncSnapshot, PostEntity? postEntity});

  $PostEntityCopyWith<$Res>? get postEntity;
}

/// @nodoc
class _$DetailPostStateCopyWithImpl<$Res, $Val extends DetailPostState>
    implements $DetailPostStateCopyWith<$Res> {
  _$DetailPostStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? asyncSnapshot = null,
    Object? postEntity = freezed,
  }) {
    return _then(_value.copyWith(
      asyncSnapshot: null == asyncSnapshot
          ? _value.asyncSnapshot
          : asyncSnapshot // ignore: cast_nullable_to_non_nullable
              as AsyncSnapshot<dynamic>,
      postEntity: freezed == postEntity
          ? _value.postEntity
          : postEntity // ignore: cast_nullable_to_non_nullable
              as PostEntity?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PostEntityCopyWith<$Res>? get postEntity {
    if (_value.postEntity == null) {
      return null;
    }

    return $PostEntityCopyWith<$Res>(_value.postEntity!, (value) {
      return _then(_value.copyWith(postEntity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailPostStateImplCopyWith<$Res>
    implements $DetailPostStateCopyWith<$Res> {
  factory _$$DetailPostStateImplCopyWith(_$DetailPostStateImpl value,
          $Res Function(_$DetailPostStateImpl) then) =
      __$$DetailPostStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncSnapshot<dynamic> asyncSnapshot, PostEntity? postEntity});

  @override
  $PostEntityCopyWith<$Res>? get postEntity;
}

/// @nodoc
class __$$DetailPostStateImplCopyWithImpl<$Res>
    extends _$DetailPostStateCopyWithImpl<$Res, _$DetailPostStateImpl>
    implements _$$DetailPostStateImplCopyWith<$Res> {
  __$$DetailPostStateImplCopyWithImpl(
      _$DetailPostStateImpl _value, $Res Function(_$DetailPostStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? asyncSnapshot = null,
    Object? postEntity = freezed,
  }) {
    return _then(_$DetailPostStateImpl(
      asyncSnapshot: null == asyncSnapshot
          ? _value.asyncSnapshot
          : asyncSnapshot // ignore: cast_nullable_to_non_nullable
              as AsyncSnapshot<dynamic>,
      postEntity: freezed == postEntity
          ? _value.postEntity
          : postEntity // ignore: cast_nullable_to_non_nullable
              as PostEntity?,
    ));
  }
}

/// @nodoc

class _$DetailPostStateImpl implements _DetailPostState {
  const _$DetailPostStateImpl(
      {this.asyncSnapshot = const AsyncSnapshot.nothing(), this.postEntity});

  @override
  @JsonKey()
  final AsyncSnapshot<dynamic> asyncSnapshot;
  @override
  final PostEntity? postEntity;

  @override
  String toString() {
    return 'DetailPostState(asyncSnapshot: $asyncSnapshot, postEntity: $postEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailPostStateImpl &&
            (identical(other.asyncSnapshot, asyncSnapshot) ||
                other.asyncSnapshot == asyncSnapshot) &&
            (identical(other.postEntity, postEntity) ||
                other.postEntity == postEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, asyncSnapshot, postEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailPostStateImplCopyWith<_$DetailPostStateImpl> get copyWith =>
      __$$DetailPostStateImplCopyWithImpl<_$DetailPostStateImpl>(
          this, _$identity);
}

abstract class _DetailPostState implements DetailPostState {
  const factory _DetailPostState(
      {final AsyncSnapshot<dynamic> asyncSnapshot,
      final PostEntity? postEntity}) = _$DetailPostStateImpl;

  @override
  AsyncSnapshot<dynamic> get asyncSnapshot;
  @override
  PostEntity? get postEntity;
  @override
  @JsonKey(ignore: true)
  _$$DetailPostStateImplCopyWith<_$DetailPostStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
