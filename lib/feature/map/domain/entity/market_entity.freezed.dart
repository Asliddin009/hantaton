// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'market_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MarkerEntity _$MarkerEntityFromJson(Map<String, dynamic> json) {
  return _MarkerEntity.fromJson(json);
}

/// @nodoc
mixin _$MarkerEntity {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String? get preContent => throw _privateConstructorUsedError;
  AuthorEntity? get author => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarkerEntityCopyWith<MarkerEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarkerEntityCopyWith<$Res> {
  factory $MarkerEntityCopyWith(
          MarkerEntity value, $Res Function(MarkerEntity) then) =
      _$MarkerEntityCopyWithImpl<$Res, MarkerEntity>;
  @useResult
  $Res call(
      {int id,
      String name,
      String? content,
      String? preContent,
      AuthorEntity? author});

  $AuthorEntityCopyWith<$Res>? get author;
}

/// @nodoc
class _$MarkerEntityCopyWithImpl<$Res, $Val extends MarkerEntity>
    implements $MarkerEntityCopyWith<$Res> {
  _$MarkerEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? content = freezed,
    Object? preContent = freezed,
    Object? author = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      preContent: freezed == preContent
          ? _value.preContent
          : preContent // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as AuthorEntity?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthorEntityCopyWith<$Res>? get author {
    if (_value.author == null) {
      return null;
    }

    return $AuthorEntityCopyWith<$Res>(_value.author!, (value) {
      return _then(_value.copyWith(author: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MarkerEntityImplCopyWith<$Res>
    implements $MarkerEntityCopyWith<$Res> {
  factory _$$MarkerEntityImplCopyWith(
          _$MarkerEntityImpl value, $Res Function(_$MarkerEntityImpl) then) =
      __$$MarkerEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? content,
      String? preContent,
      AuthorEntity? author});

  @override
  $AuthorEntityCopyWith<$Res>? get author;
}

/// @nodoc
class __$$MarkerEntityImplCopyWithImpl<$Res>
    extends _$MarkerEntityCopyWithImpl<$Res, _$MarkerEntityImpl>
    implements _$$MarkerEntityImplCopyWith<$Res> {
  __$$MarkerEntityImplCopyWithImpl(
      _$MarkerEntityImpl _value, $Res Function(_$MarkerEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? content = freezed,
    Object? preContent = freezed,
    Object? author = freezed,
  }) {
    return _then(_$MarkerEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      preContent: freezed == preContent
          ? _value.preContent
          : preContent // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as AuthorEntity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarkerEntityImpl implements _MarkerEntity {
  const _$MarkerEntityImpl(
      {required this.id,
      required this.name,
      this.content,
      this.preContent,
      this.author});

  factory _$MarkerEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarkerEntityImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? content;
  @override
  final String? preContent;
  @override
  final AuthorEntity? author;

  @override
  String toString() {
    return 'MarkerEntity(id: $id, name: $name, content: $content, preContent: $preContent, author: $author)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkerEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.preContent, preContent) ||
                other.preContent == preContent) &&
            (identical(other.author, author) || other.author == author));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, content, preContent, author);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkerEntityImplCopyWith<_$MarkerEntityImpl> get copyWith =>
      __$$MarkerEntityImplCopyWithImpl<_$MarkerEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarkerEntityImplToJson(
      this,
    );
  }
}

abstract class _MarkerEntity implements MarkerEntity {
  const factory _MarkerEntity(
      {required final int id,
      required final String name,
      final String? content,
      final String? preContent,
      final AuthorEntity? author}) = _$MarkerEntityImpl;

  factory _MarkerEntity.fromJson(Map<String, dynamic> json) =
      _$MarkerEntityImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get content;
  @override
  String? get preContent;
  @override
  AuthorEntity? get author;
  @override
  @JsonKey(ignore: true)
  _$$MarkerEntityImplCopyWith<_$MarkerEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
