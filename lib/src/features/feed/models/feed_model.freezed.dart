// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PeamanFeed _$PeamanFeedFromJson(Map<String, dynamic> json) {
  return _PeamanFeed.fromJson(json);
}

/// @nodoc
mixin _$PeamanFeed {
  String? get id => throw _privateConstructorUsedError;
  String? get ownerId => throw _privateConstructorUsedError;
  String? get caption => throw _privateConstructorUsedError;
  List<PeamanFileUrl> get files => throw _privateConstructorUsedError;
  PeamanFeedType get type => throw _privateConstructorUsedError;
  int get reactionsCount => throw _privateConstructorUsedError;
  int get commentsCount => throw _privateConstructorUsedError;
  int get repliesCount => throw _privateConstructorUsedError;
  int get savesCount => throw _privateConstructorUsedError;
  int get sharesCount => throw _privateConstructorUsedError;
  int get viewsCount => throw _privateConstructorUsedError;
  String? get ytLink => throw _privateConstructorUsedError;
  String? get pollQuestion => throw _privateConstructorUsedError;
  List<PeamanPollOption> get pollOptions => throw _privateConstructorUsedError;
  bool get featured => throw _privateConstructorUsedError;
  List<String> get searchKeys => throw _privateConstructorUsedError;
  int? get createdAt => throw _privateConstructorUsedError;
  int? get updatedAt => throw _privateConstructorUsedError;
  bool get visibility => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  Map<String, dynamic> get extraData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PeamanFeedCopyWith<PeamanFeed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanFeedCopyWith<$Res> {
  factory $PeamanFeedCopyWith(
          PeamanFeed value, $Res Function(PeamanFeed) then) =
      _$PeamanFeedCopyWithImpl<$Res, PeamanFeed>;
  @useResult
  $Res call(
      {String? id,
      String? ownerId,
      String? caption,
      List<PeamanFileUrl> files,
      PeamanFeedType type,
      int reactionsCount,
      int commentsCount,
      int repliesCount,
      int savesCount,
      int sharesCount,
      int viewsCount,
      String? ytLink,
      String? pollQuestion,
      List<PeamanPollOption> pollOptions,
      bool featured,
      List<String> searchKeys,
      int? createdAt,
      int? updatedAt,
      bool visibility,
      @JsonKey(ignore: true) Map<String, dynamic> extraData});
}

/// @nodoc
class _$PeamanFeedCopyWithImpl<$Res, $Val extends PeamanFeed>
    implements $PeamanFeedCopyWith<$Res> {
  _$PeamanFeedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? ownerId = freezed,
    Object? caption = freezed,
    Object? files = null,
    Object? type = null,
    Object? reactionsCount = null,
    Object? commentsCount = null,
    Object? repliesCount = null,
    Object? savesCount = null,
    Object? sharesCount = null,
    Object? viewsCount = null,
    Object? ytLink = freezed,
    Object? pollQuestion = freezed,
    Object? pollOptions = null,
    Object? featured = null,
    Object? searchKeys = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? visibility = null,
    Object? extraData = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerId: freezed == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String?,
      caption: freezed == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
      files: null == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<PeamanFileUrl>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PeamanFeedType,
      reactionsCount: null == reactionsCount
          ? _value.reactionsCount
          : reactionsCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
      repliesCount: null == repliesCount
          ? _value.repliesCount
          : repliesCount // ignore: cast_nullable_to_non_nullable
              as int,
      savesCount: null == savesCount
          ? _value.savesCount
          : savesCount // ignore: cast_nullable_to_non_nullable
              as int,
      sharesCount: null == sharesCount
          ? _value.sharesCount
          : sharesCount // ignore: cast_nullable_to_non_nullable
              as int,
      viewsCount: null == viewsCount
          ? _value.viewsCount
          : viewsCount // ignore: cast_nullable_to_non_nullable
              as int,
      ytLink: freezed == ytLink
          ? _value.ytLink
          : ytLink // ignore: cast_nullable_to_non_nullable
              as String?,
      pollQuestion: freezed == pollQuestion
          ? _value.pollQuestion
          : pollQuestion // ignore: cast_nullable_to_non_nullable
              as String?,
      pollOptions: null == pollOptions
          ? _value.pollOptions
          : pollOptions // ignore: cast_nullable_to_non_nullable
              as List<PeamanPollOption>,
      featured: null == featured
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as bool,
      searchKeys: null == searchKeys
          ? _value.searchKeys
          : searchKeys // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as bool,
      extraData: null == extraData
          ? _value.extraData
          : extraData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PeamanFeedCopyWith<$Res>
    implements $PeamanFeedCopyWith<$Res> {
  factory _$$_PeamanFeedCopyWith(
          _$_PeamanFeed value, $Res Function(_$_PeamanFeed) then) =
      __$$_PeamanFeedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? ownerId,
      String? caption,
      List<PeamanFileUrl> files,
      PeamanFeedType type,
      int reactionsCount,
      int commentsCount,
      int repliesCount,
      int savesCount,
      int sharesCount,
      int viewsCount,
      String? ytLink,
      String? pollQuestion,
      List<PeamanPollOption> pollOptions,
      bool featured,
      List<String> searchKeys,
      int? createdAt,
      int? updatedAt,
      bool visibility,
      @JsonKey(ignore: true) Map<String, dynamic> extraData});
}

/// @nodoc
class __$$_PeamanFeedCopyWithImpl<$Res>
    extends _$PeamanFeedCopyWithImpl<$Res, _$_PeamanFeed>
    implements _$$_PeamanFeedCopyWith<$Res> {
  __$$_PeamanFeedCopyWithImpl(
      _$_PeamanFeed _value, $Res Function(_$_PeamanFeed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? ownerId = freezed,
    Object? caption = freezed,
    Object? files = null,
    Object? type = null,
    Object? reactionsCount = null,
    Object? commentsCount = null,
    Object? repliesCount = null,
    Object? savesCount = null,
    Object? sharesCount = null,
    Object? viewsCount = null,
    Object? ytLink = freezed,
    Object? pollQuestion = freezed,
    Object? pollOptions = null,
    Object? featured = null,
    Object? searchKeys = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? visibility = null,
    Object? extraData = null,
  }) {
    return _then(_$_PeamanFeed(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerId: freezed == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String?,
      caption: freezed == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<PeamanFileUrl>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PeamanFeedType,
      reactionsCount: null == reactionsCount
          ? _value.reactionsCount
          : reactionsCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
      repliesCount: null == repliesCount
          ? _value.repliesCount
          : repliesCount // ignore: cast_nullable_to_non_nullable
              as int,
      savesCount: null == savesCount
          ? _value.savesCount
          : savesCount // ignore: cast_nullable_to_non_nullable
              as int,
      sharesCount: null == sharesCount
          ? _value.sharesCount
          : sharesCount // ignore: cast_nullable_to_non_nullable
              as int,
      viewsCount: null == viewsCount
          ? _value.viewsCount
          : viewsCount // ignore: cast_nullable_to_non_nullable
              as int,
      ytLink: freezed == ytLink
          ? _value.ytLink
          : ytLink // ignore: cast_nullable_to_non_nullable
              as String?,
      pollQuestion: freezed == pollQuestion
          ? _value.pollQuestion
          : pollQuestion // ignore: cast_nullable_to_non_nullable
              as String?,
      pollOptions: null == pollOptions
          ? _value._pollOptions
          : pollOptions // ignore: cast_nullable_to_non_nullable
              as List<PeamanPollOption>,
      featured: null == featured
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as bool,
      searchKeys: null == searchKeys
          ? _value._searchKeys
          : searchKeys // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as bool,
      extraData: null == extraData
          ? _value._extraData
          : extraData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PeamanFeed implements _PeamanFeed {
  const _$_PeamanFeed(
      {this.id,
      this.ownerId,
      this.caption,
      final List<PeamanFileUrl> files = const <PeamanFileUrl>[],
      this.type = PeamanFeedType.text,
      this.reactionsCount = 0,
      this.commentsCount = 0,
      this.repliesCount = 0,
      this.savesCount = 0,
      this.sharesCount = 0,
      this.viewsCount = 0,
      this.ytLink,
      this.pollQuestion,
      final List<PeamanPollOption> pollOptions = const <PeamanPollOption>[],
      this.featured = false,
      final List<String> searchKeys = const <String>[],
      this.createdAt,
      this.updatedAt,
      this.visibility = true,
      @JsonKey(ignore: true)
          final Map<String, dynamic> extraData = const <String, dynamic>{}})
      : _files = files,
        _pollOptions = pollOptions,
        _searchKeys = searchKeys,
        _extraData = extraData;

  factory _$_PeamanFeed.fromJson(Map<String, dynamic> json) =>
      _$$_PeamanFeedFromJson(json);

  @override
  final String? id;
  @override
  final String? ownerId;
  @override
  final String? caption;
  final List<PeamanFileUrl> _files;
  @override
  @JsonKey()
  List<PeamanFileUrl> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  @JsonKey()
  final PeamanFeedType type;
  @override
  @JsonKey()
  final int reactionsCount;
  @override
  @JsonKey()
  final int commentsCount;
  @override
  @JsonKey()
  final int repliesCount;
  @override
  @JsonKey()
  final int savesCount;
  @override
  @JsonKey()
  final int sharesCount;
  @override
  @JsonKey()
  final int viewsCount;
  @override
  final String? ytLink;
  @override
  final String? pollQuestion;
  final List<PeamanPollOption> _pollOptions;
  @override
  @JsonKey()
  List<PeamanPollOption> get pollOptions {
    if (_pollOptions is EqualUnmodifiableListView) return _pollOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pollOptions);
  }

  @override
  @JsonKey()
  final bool featured;
  final List<String> _searchKeys;
  @override
  @JsonKey()
  List<String> get searchKeys {
    if (_searchKeys is EqualUnmodifiableListView) return _searchKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchKeys);
  }

  @override
  final int? createdAt;
  @override
  final int? updatedAt;
  @override
  @JsonKey()
  final bool visibility;
  final Map<String, dynamic> _extraData;
  @override
  @JsonKey(ignore: true)
  Map<String, dynamic> get extraData {
    if (_extraData is EqualUnmodifiableMapView) return _extraData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_extraData);
  }

  @override
  String toString() {
    return 'PeamanFeed(id: $id, ownerId: $ownerId, caption: $caption, files: $files, type: $type, reactionsCount: $reactionsCount, commentsCount: $commentsCount, repliesCount: $repliesCount, savesCount: $savesCount, sharesCount: $sharesCount, viewsCount: $viewsCount, ytLink: $ytLink, pollQuestion: $pollQuestion, pollOptions: $pollOptions, featured: $featured, searchKeys: $searchKeys, createdAt: $createdAt, updatedAt: $updatedAt, visibility: $visibility, extraData: $extraData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanFeed &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.reactionsCount, reactionsCount) ||
                other.reactionsCount == reactionsCount) &&
            (identical(other.commentsCount, commentsCount) ||
                other.commentsCount == commentsCount) &&
            (identical(other.repliesCount, repliesCount) ||
                other.repliesCount == repliesCount) &&
            (identical(other.savesCount, savesCount) ||
                other.savesCount == savesCount) &&
            (identical(other.sharesCount, sharesCount) ||
                other.sharesCount == sharesCount) &&
            (identical(other.viewsCount, viewsCount) ||
                other.viewsCount == viewsCount) &&
            (identical(other.ytLink, ytLink) || other.ytLink == ytLink) &&
            (identical(other.pollQuestion, pollQuestion) ||
                other.pollQuestion == pollQuestion) &&
            const DeepCollectionEquality()
                .equals(other._pollOptions, _pollOptions) &&
            (identical(other.featured, featured) ||
                other.featured == featured) &&
            const DeepCollectionEquality()
                .equals(other._searchKeys, _searchKeys) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            const DeepCollectionEquality()
                .equals(other._extraData, _extraData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        ownerId,
        caption,
        const DeepCollectionEquality().hash(_files),
        type,
        reactionsCount,
        commentsCount,
        repliesCount,
        savesCount,
        sharesCount,
        viewsCount,
        ytLink,
        pollQuestion,
        const DeepCollectionEquality().hash(_pollOptions),
        featured,
        const DeepCollectionEquality().hash(_searchKeys),
        createdAt,
        updatedAt,
        visibility,
        const DeepCollectionEquality().hash(_extraData)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeamanFeedCopyWith<_$_PeamanFeed> get copyWith =>
      __$$_PeamanFeedCopyWithImpl<_$_PeamanFeed>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PeamanFeedToJson(
      this,
    );
  }
}

abstract class _PeamanFeed implements PeamanFeed {
  const factory _PeamanFeed(
          {final String? id,
          final String? ownerId,
          final String? caption,
          final List<PeamanFileUrl> files,
          final PeamanFeedType type,
          final int reactionsCount,
          final int commentsCount,
          final int repliesCount,
          final int savesCount,
          final int sharesCount,
          final int viewsCount,
          final String? ytLink,
          final String? pollQuestion,
          final List<PeamanPollOption> pollOptions,
          final bool featured,
          final List<String> searchKeys,
          final int? createdAt,
          final int? updatedAt,
          final bool visibility,
          @JsonKey(ignore: true) final Map<String, dynamic> extraData}) =
      _$_PeamanFeed;

  factory _PeamanFeed.fromJson(Map<String, dynamic> json) =
      _$_PeamanFeed.fromJson;

  @override
  String? get id;
  @override
  String? get ownerId;
  @override
  String? get caption;
  @override
  List<PeamanFileUrl> get files;
  @override
  PeamanFeedType get type;
  @override
  int get reactionsCount;
  @override
  int get commentsCount;
  @override
  int get repliesCount;
  @override
  int get savesCount;
  @override
  int get sharesCount;
  @override
  int get viewsCount;
  @override
  String? get ytLink;
  @override
  String? get pollQuestion;
  @override
  List<PeamanPollOption> get pollOptions;
  @override
  bool get featured;
  @override
  List<String> get searchKeys;
  @override
  int? get createdAt;
  @override
  int? get updatedAt;
  @override
  bool get visibility;
  @override
  @JsonKey(ignore: true)
  Map<String, dynamic> get extraData;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanFeedCopyWith<_$_PeamanFeed> get copyWith =>
      throw _privateConstructorUsedError;
}
