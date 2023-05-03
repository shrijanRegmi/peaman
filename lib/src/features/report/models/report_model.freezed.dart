// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PeamanReport _$PeamanReportFromJson(Map<String, dynamic> json) {
  return _PeamanReport.fromJson(json);
}

/// @nodoc
mixin _$PeamanReport {
  String? get id => throw _privateConstructorUsedError;
  PeamanReportType get type => throw _privateConstructorUsedError;
  dynamic get reportedBys => throw _privateConstructorUsedError;
  int get reportsCount => throw _privateConstructorUsedError;
  int? get createdAt => throw _privateConstructorUsedError;
  int? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PeamanReportCopyWith<PeamanReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanReportCopyWith<$Res> {
  factory $PeamanReportCopyWith(
          PeamanReport value, $Res Function(PeamanReport) then) =
      _$PeamanReportCopyWithImpl<$Res, PeamanReport>;
  @useResult
  $Res call(
      {String? id,
      PeamanReportType type,
      dynamic reportedBys,
      int reportsCount,
      int? createdAt,
      int? updatedAt});
}

/// @nodoc
class _$PeamanReportCopyWithImpl<$Res, $Val extends PeamanReport>
    implements $PeamanReportCopyWith<$Res> {
  _$PeamanReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = null,
    Object? reportedBys = freezed,
    Object? reportsCount = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PeamanReportType,
      reportedBys: freezed == reportedBys
          ? _value.reportedBys
          : reportedBys // ignore: cast_nullable_to_non_nullable
              as dynamic,
      reportsCount: null == reportsCount
          ? _value.reportsCount
          : reportsCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PeamanReportCopyWith<$Res>
    implements $PeamanReportCopyWith<$Res> {
  factory _$$_PeamanReportCopyWith(
          _$_PeamanReport value, $Res Function(_$_PeamanReport) then) =
      __$$_PeamanReportCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      PeamanReportType type,
      dynamic reportedBys,
      int reportsCount,
      int? createdAt,
      int? updatedAt});
}

/// @nodoc
class __$$_PeamanReportCopyWithImpl<$Res>
    extends _$PeamanReportCopyWithImpl<$Res, _$_PeamanReport>
    implements _$$_PeamanReportCopyWith<$Res> {
  __$$_PeamanReportCopyWithImpl(
      _$_PeamanReport _value, $Res Function(_$_PeamanReport) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = null,
    Object? reportedBys = freezed,
    Object? reportsCount = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_PeamanReport(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PeamanReportType,
      reportedBys: freezed == reportedBys ? _value.reportedBys! : reportedBys,
      reportsCount: null == reportsCount
          ? _value.reportsCount
          : reportsCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PeamanReport implements _PeamanReport {
  const _$_PeamanReport(
      {this.id,
      this.type = PeamanReportType.unknown,
      this.reportedBys = const <PeamanReportedBy>[],
      this.reportsCount = 0,
      this.createdAt,
      this.updatedAt});

  factory _$_PeamanReport.fromJson(Map<String, dynamic> json) =>
      _$$_PeamanReportFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey()
  final PeamanReportType type;
  @override
  @JsonKey()
  final dynamic reportedBys;
  @override
  @JsonKey()
  final int reportsCount;
  @override
  final int? createdAt;
  @override
  final int? updatedAt;

  @override
  String toString() {
    return 'PeamanReport(id: $id, type: $type, reportedBys: $reportedBys, reportsCount: $reportsCount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanReport &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other.reportedBys, reportedBys) &&
            (identical(other.reportsCount, reportsCount) ||
                other.reportsCount == reportsCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      const DeepCollectionEquality().hash(reportedBys),
      reportsCount,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeamanReportCopyWith<_$_PeamanReport> get copyWith =>
      __$$_PeamanReportCopyWithImpl<_$_PeamanReport>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PeamanReportToJson(
      this,
    );
  }
}

abstract class _PeamanReport implements PeamanReport {
  const factory _PeamanReport(
      {final String? id,
      final PeamanReportType type,
      final dynamic reportedBys,
      final int reportsCount,
      final int? createdAt,
      final int? updatedAt}) = _$_PeamanReport;

  factory _PeamanReport.fromJson(Map<String, dynamic> json) =
      _$_PeamanReport.fromJson;

  @override
  String? get id;
  @override
  PeamanReportType get type;
  @override
  dynamic get reportedBys;
  @override
  int get reportsCount;
  @override
  int? get createdAt;
  @override
  int? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanReportCopyWith<_$_PeamanReport> get copyWith =>
      throw _privateConstructorUsedError;
}
