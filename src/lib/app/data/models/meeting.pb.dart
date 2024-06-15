//
//  Generated code. Do not modify.
//  source: meeting.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

/// Defines LiveKit access information.
class LiveKit extends $pb.GeneratedMessage {
  factory LiveKit({
    $core.String? token,
    $core.String? url,
  }) {
    final $result = create();
    if (token != null) {
      $result.token = token;
    }
    if (url != null) {
      $result.url = url;
    }
    return $result;
  }
  LiveKit._() : super();
  factory LiveKit.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LiveKit.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LiveKit', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'token')
    ..aOS(2, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LiveKit clone() => LiveKit()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LiveKit copyWith(void Function(LiveKit) updates) => super.copyWith((message) => updates(message as LiveKit)) as LiveKit;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LiveKit create() => LiveKit._();
  LiveKit createEmptyInstance() => create();
  static $pb.PbList<LiveKit> createRepeated() => $pb.PbList<LiveKit>();
  @$core.pragma('dart2js:noInline')
  static LiveKit getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LiveKit>(create);
  static LiveKit? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => clearField(2);
}

/// Information about a specific meeting that cannot be changed once set.
class SystemGeneratedMeetingInfo extends $pb.GeneratedMessage {
  factory SystemGeneratedMeetingInfo({
    $core.String? creatorUserID,
    $core.String? creatorNickname,
    $core.String? status,
    $fixnum.Int64? startTime,
    $core.String? meetingID,
  }) {
    final $result = create();
    if (creatorUserID != null) {
      $result.creatorUserID = creatorUserID;
    }
    if (creatorNickname != null) {
      $result.creatorNickname = creatorNickname;
    }
    if (status != null) {
      $result.status = status;
    }
    if (startTime != null) {
      $result.startTime = startTime;
    }
    if (meetingID != null) {
      $result.meetingID = meetingID;
    }
    return $result;
  }
  SystemGeneratedMeetingInfo._() : super();
  factory SystemGeneratedMeetingInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SystemGeneratedMeetingInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SystemGeneratedMeetingInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'creatorUserID', protoName: 'creatorUserID')
    ..aOS(2, _omitFieldNames ? '' : 'creatorNickname', protoName: 'creatorNickname')
    ..aOS(3, _omitFieldNames ? '' : 'status')
    ..aInt64(4, _omitFieldNames ? '' : 'startTime', protoName: 'startTime')
    ..aOS(5, _omitFieldNames ? '' : 'meetingID', protoName: 'meetingID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SystemGeneratedMeetingInfo clone() => SystemGeneratedMeetingInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SystemGeneratedMeetingInfo copyWith(void Function(SystemGeneratedMeetingInfo) updates) => super.copyWith((message) => updates(message as SystemGeneratedMeetingInfo)) as SystemGeneratedMeetingInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SystemGeneratedMeetingInfo create() => SystemGeneratedMeetingInfo._();
  SystemGeneratedMeetingInfo createEmptyInstance() => create();
  static $pb.PbList<SystemGeneratedMeetingInfo> createRepeated() => $pb.PbList<SystemGeneratedMeetingInfo>();
  @$core.pragma('dart2js:noInline')
  static SystemGeneratedMeetingInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SystemGeneratedMeetingInfo>(create);
  static SystemGeneratedMeetingInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get creatorUserID => $_getSZ(0);
  @$pb.TagNumber(1)
  set creatorUserID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCreatorUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearCreatorUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get creatorNickname => $_getSZ(1);
  @$pb.TagNumber(2)
  set creatorNickname($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCreatorNickname() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatorNickname() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get status => $_getSZ(2);
  @$pb.TagNumber(3)
  set status($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get startTime => $_getI64(3);
  @$pb.TagNumber(4)
  set startTime($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStartTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearStartTime() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get meetingID => $_getSZ(4);
  @$pb.TagNumber(5)
  set meetingID($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMeetingID() => $_has(4);
  @$pb.TagNumber(5)
  void clearMeetingID() => clearField(5);
}

/// Information about a specific meeting that can be modified.
class CreatorDefinedMeetingInfo extends $pb.GeneratedMessage {
  factory CreatorDefinedMeetingInfo({
    $core.String? title,
    $fixnum.Int64? scheduledTime,
    $fixnum.Int64? meetingDuration,
    $core.String? password,
  }) {
    final $result = create();
    if (title != null) {
      $result.title = title;
    }
    if (scheduledTime != null) {
      $result.scheduledTime = scheduledTime;
    }
    if (meetingDuration != null) {
      $result.meetingDuration = meetingDuration;
    }
    if (password != null) {
      $result.password = password;
    }
    return $result;
  }
  CreatorDefinedMeetingInfo._() : super();
  factory CreatorDefinedMeetingInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatorDefinedMeetingInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatorDefinedMeetingInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aInt64(2, _omitFieldNames ? '' : 'scheduledTime', protoName: 'scheduledTime')
    ..aInt64(3, _omitFieldNames ? '' : 'meetingDuration', protoName: 'meetingDuration')
    ..aOS(4, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatorDefinedMeetingInfo clone() => CreatorDefinedMeetingInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatorDefinedMeetingInfo copyWith(void Function(CreatorDefinedMeetingInfo) updates) => super.copyWith((message) => updates(message as CreatorDefinedMeetingInfo)) as CreatorDefinedMeetingInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatorDefinedMeetingInfo create() => CreatorDefinedMeetingInfo._();
  CreatorDefinedMeetingInfo createEmptyInstance() => create();
  static $pb.PbList<CreatorDefinedMeetingInfo> createRepeated() => $pb.PbList<CreatorDefinedMeetingInfo>();
  @$core.pragma('dart2js:noInline')
  static CreatorDefinedMeetingInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatorDefinedMeetingInfo>(create);
  static CreatorDefinedMeetingInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get scheduledTime => $_getI64(1);
  @$pb.TagNumber(2)
  set scheduledTime($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasScheduledTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearScheduledTime() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get meetingDuration => $_getI64(2);
  @$pb.TagNumber(3)
  set meetingDuration($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMeetingDuration() => $_has(2);
  @$pb.TagNumber(3)
  void clearMeetingDuration() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get password => $_getSZ(3);
  @$pb.TagNumber(4)
  set password($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPassword() => $_has(3);
  @$pb.TagNumber(4)
  void clearPassword() => clearField(4);
}

/// Information about a specific meeting, combining system-generated and creator-defined information.
class MeetingInfo extends $pb.GeneratedMessage {
  factory MeetingInfo({
    SystemGeneratedMeetingInfo? systemGenerated,
    CreatorDefinedMeetingInfo? creatorDefinedMeeting,
  }) {
    final $result = create();
    if (systemGenerated != null) {
      $result.systemGenerated = systemGenerated;
    }
    if (creatorDefinedMeeting != null) {
      $result.creatorDefinedMeeting = creatorDefinedMeeting;
    }
    return $result;
  }
  MeetingInfo._() : super();
  factory MeetingInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MeetingInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MeetingInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..aOM<SystemGeneratedMeetingInfo>(1, _omitFieldNames ? '' : 'systemGenerated', protoName: 'systemGenerated', subBuilder: SystemGeneratedMeetingInfo.create)
    ..aOM<CreatorDefinedMeetingInfo>(2, _omitFieldNames ? '' : 'creatorDefinedMeeting', protoName: 'creatorDefinedMeeting', subBuilder: CreatorDefinedMeetingInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MeetingInfo clone() => MeetingInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MeetingInfo copyWith(void Function(MeetingInfo) updates) => super.copyWith((message) => updates(message as MeetingInfo)) as MeetingInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MeetingInfo create() => MeetingInfo._();
  MeetingInfo createEmptyInstance() => create();
  static $pb.PbList<MeetingInfo> createRepeated() => $pb.PbList<MeetingInfo>();
  @$core.pragma('dart2js:noInline')
  static MeetingInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MeetingInfo>(create);
  static MeetingInfo? _defaultInstance;

  @$pb.TagNumber(1)
  SystemGeneratedMeetingInfo get systemGenerated => $_getN(0);
  @$pb.TagNumber(1)
  set systemGenerated(SystemGeneratedMeetingInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSystemGenerated() => $_has(0);
  @$pb.TagNumber(1)
  void clearSystemGenerated() => clearField(1);
  @$pb.TagNumber(1)
  SystemGeneratedMeetingInfo ensureSystemGenerated() => $_ensure(0);

  @$pb.TagNumber(2)
  CreatorDefinedMeetingInfo get creatorDefinedMeeting => $_getN(1);
  @$pb.TagNumber(2)
  set creatorDefinedMeeting(CreatorDefinedMeetingInfo v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCreatorDefinedMeeting() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatorDefinedMeeting() => clearField(2);
  @$pb.TagNumber(2)
  CreatorDefinedMeetingInfo ensureCreatorDefinedMeeting() => $_ensure(1);
}

/// Settings controlling meeting features such as video, audio, and screen sharing permissions.
class MeetingSetting extends $pb.GeneratedMessage {
  factory MeetingSetting({
    $core.bool? canParticipantsEnableCamera,
    $core.bool? canParticipantsUnmuteMicrophone,
    $core.bool? canParticipantsShareScreen,
    $core.bool? disableCameraOnJoin,
    $core.bool? disableMicrophoneOnJoin,
  }) {
    final $result = create();
    if (canParticipantsEnableCamera != null) {
      $result.canParticipantsEnableCamera = canParticipantsEnableCamera;
    }
    if (canParticipantsUnmuteMicrophone != null) {
      $result.canParticipantsUnmuteMicrophone = canParticipantsUnmuteMicrophone;
    }
    if (canParticipantsShareScreen != null) {
      $result.canParticipantsShareScreen = canParticipantsShareScreen;
    }
    if (disableCameraOnJoin != null) {
      $result.disableCameraOnJoin = disableCameraOnJoin;
    }
    if (disableMicrophoneOnJoin != null) {
      $result.disableMicrophoneOnJoin = disableMicrophoneOnJoin;
    }
    return $result;
  }
  MeetingSetting._() : super();
  factory MeetingSetting.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MeetingSetting.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MeetingSetting', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'canParticipantsEnableCamera', protoName: 'canParticipantsEnableCamera')
    ..aOB(2, _omitFieldNames ? '' : 'canParticipantsUnmuteMicrophone', protoName: 'canParticipantsUnmuteMicrophone')
    ..aOB(3, _omitFieldNames ? '' : 'canParticipantsShareScreen', protoName: 'canParticipantsShareScreen')
    ..aOB(4, _omitFieldNames ? '' : 'disableCameraOnJoin', protoName: 'disableCameraOnJoin')
    ..aOB(5, _omitFieldNames ? '' : 'disableMicrophoneOnJoin', protoName: 'disableMicrophoneOnJoin')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MeetingSetting clone() => MeetingSetting()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MeetingSetting copyWith(void Function(MeetingSetting) updates) => super.copyWith((message) => updates(message as MeetingSetting)) as MeetingSetting;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MeetingSetting create() => MeetingSetting._();
  MeetingSetting createEmptyInstance() => create();
  static $pb.PbList<MeetingSetting> createRepeated() => $pb.PbList<MeetingSetting>();
  @$core.pragma('dart2js:noInline')
  static MeetingSetting getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MeetingSetting>(create);
  static MeetingSetting? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get canParticipantsEnableCamera => $_getBF(0);
  @$pb.TagNumber(1)
  set canParticipantsEnableCamera($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCanParticipantsEnableCamera() => $_has(0);
  @$pb.TagNumber(1)
  void clearCanParticipantsEnableCamera() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get canParticipantsUnmuteMicrophone => $_getBF(1);
  @$pb.TagNumber(2)
  set canParticipantsUnmuteMicrophone($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCanParticipantsUnmuteMicrophone() => $_has(1);
  @$pb.TagNumber(2)
  void clearCanParticipantsUnmuteMicrophone() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get canParticipantsShareScreen => $_getBF(2);
  @$pb.TagNumber(3)
  set canParticipantsShareScreen($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCanParticipantsShareScreen() => $_has(2);
  @$pb.TagNumber(3)
  void clearCanParticipantsShareScreen() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get disableCameraOnJoin => $_getBF(3);
  @$pb.TagNumber(4)
  set disableCameraOnJoin($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDisableCameraOnJoin() => $_has(3);
  @$pb.TagNumber(4)
  void clearDisableCameraOnJoin() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get disableMicrophoneOnJoin => $_getBF(4);
  @$pb.TagNumber(5)
  set disableMicrophoneOnJoin($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDisableMicrophoneOnJoin() => $_has(4);
  @$pb.TagNumber(5)
  void clearDisableMicrophoneOnJoin() => clearField(5);
}

/// Detailed information about a meeting, combining info and settings.
class MeetingInfoSetting extends $pb.GeneratedMessage {
  factory MeetingInfoSetting({
    MeetingInfo? info,
    MeetingSetting? setting,
  }) {
    final $result = create();
    if (info != null) {
      $result.info = info;
    }
    if (setting != null) {
      $result.setting = setting;
    }
    return $result;
  }
  MeetingInfoSetting._() : super();
  factory MeetingInfoSetting.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MeetingInfoSetting.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MeetingInfoSetting', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..aOM<MeetingInfo>(1, _omitFieldNames ? '' : 'info', subBuilder: MeetingInfo.create)
    ..aOM<MeetingSetting>(2, _omitFieldNames ? '' : 'setting', subBuilder: MeetingSetting.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MeetingInfoSetting clone() => MeetingInfoSetting()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MeetingInfoSetting copyWith(void Function(MeetingInfoSetting) updates) => super.copyWith((message) => updates(message as MeetingInfoSetting)) as MeetingInfoSetting;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MeetingInfoSetting create() => MeetingInfoSetting._();
  MeetingInfoSetting createEmptyInstance() => create();
  static $pb.PbList<MeetingInfoSetting> createRepeated() => $pb.PbList<MeetingInfoSetting>();
  @$core.pragma('dart2js:noInline')
  static MeetingInfoSetting getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MeetingInfoSetting>(create);
  static MeetingInfoSetting? _defaultInstance;

  @$pb.TagNumber(1)
  MeetingInfo get info => $_getN(0);
  @$pb.TagNumber(1)
  set info(MeetingInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearInfo() => clearField(1);
  @$pb.TagNumber(1)
  MeetingInfo ensureInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  MeetingSetting get setting => $_getN(1);
  @$pb.TagNumber(2)
  set setting(MeetingSetting v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSetting() => $_has(1);
  @$pb.TagNumber(2)
  void clearSetting() => clearField(2);
  @$pb.TagNumber(2)
  MeetingSetting ensureSetting() => $_ensure(1);
}

class UserInfo extends $pb.GeneratedMessage {
  factory UserInfo({
    $core.String? userID,
    $core.String? nickname,
    $core.String? account,
  }) {
    final $result = create();
    if (userID != null) {
      $result.userID = userID;
    }
    if (nickname != null) {
      $result.nickname = nickname;
    }
    if (account != null) {
      $result.account = account;
    }
    return $result;
  }
  UserInfo._() : super();
  factory UserInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userID', protoName: 'userID')
    ..aOS(2, _omitFieldNames ? '' : 'nickname')
    ..aOS(3, _omitFieldNames ? '' : 'account')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserInfo clone() => UserInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserInfo copyWith(void Function(UserInfo) updates) => super.copyWith((message) => updates(message as UserInfo)) as UserInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserInfo create() => UserInfo._();
  UserInfo createEmptyInstance() => create();
  static $pb.PbList<UserInfo> createRepeated() => $pb.PbList<UserInfo>();
  @$core.pragma('dart2js:noInline')
  static UserInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserInfo>(create);
  static UserInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userID => $_getSZ(0);
  @$pb.TagNumber(1)
  set userID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get nickname => $_getSZ(1);
  @$pb.TagNumber(2)
  set nickname($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNickname() => $_has(1);
  @$pb.TagNumber(2)
  void clearNickname() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get account => $_getSZ(2);
  @$pb.TagNumber(3)
  set account($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAccount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAccount() => clearField(3);
}

/// participant meta data
class ParticipantMetaData extends $pb.GeneratedMessage {
  factory ParticipantMetaData({
    UserInfo? userInfo,
  }) {
    final $result = create();
    if (userInfo != null) {
      $result.userInfo = userInfo;
    }
    return $result;
  }
  ParticipantMetaData._() : super();
  factory ParticipantMetaData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ParticipantMetaData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ParticipantMetaData', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..aOM<UserInfo>(1, _omitFieldNames ? '' : 'userInfo', protoName: 'userInfo', subBuilder: UserInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ParticipantMetaData clone() => ParticipantMetaData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ParticipantMetaData copyWith(void Function(ParticipantMetaData) updates) => super.copyWith((message) => updates(message as ParticipantMetaData)) as ParticipantMetaData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ParticipantMetaData create() => ParticipantMetaData._();
  ParticipantMetaData createEmptyInstance() => create();
  static $pb.PbList<ParticipantMetaData> createRepeated() => $pb.PbList<ParticipantMetaData>();
  @$core.pragma('dart2js:noInline')
  static ParticipantMetaData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ParticipantMetaData>(create);
  static ParticipantMetaData? _defaultInstance;

  @$pb.TagNumber(1)
  UserInfo get userInfo => $_getN(0);
  @$pb.TagNumber(1)
  set userInfo(UserInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserInfo() => clearField(1);
  @$pb.TagNumber(1)
  UserInfo ensureUserInfo() => $_ensure(0);
}

class StreamOperateData extends $pb.GeneratedMessage {
  factory StreamOperateData({
    $core.String? operatorUserID,
    $core.Iterable<UserOperationData>? operation,
  }) {
    final $result = create();
    if (operatorUserID != null) {
      $result.operatorUserID = operatorUserID;
    }
    if (operation != null) {
      $result.operation.addAll(operation);
    }
    return $result;
  }
  StreamOperateData._() : super();
  factory StreamOperateData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamOperateData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StreamOperateData', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'operatorUserID', protoName: 'operatorUserID')
    ..pc<UserOperationData>(2, _omitFieldNames ? '' : 'operation', $pb.PbFieldType.PM, subBuilder: UserOperationData.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StreamOperateData clone() => StreamOperateData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StreamOperateData copyWith(void Function(StreamOperateData) updates) => super.copyWith((message) => updates(message as StreamOperateData)) as StreamOperateData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamOperateData create() => StreamOperateData._();
  StreamOperateData createEmptyInstance() => create();
  static $pb.PbList<StreamOperateData> createRepeated() => $pb.PbList<StreamOperateData>();
  @$core.pragma('dart2js:noInline')
  static StreamOperateData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StreamOperateData>(create);
  static StreamOperateData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get operatorUserID => $_getSZ(0);
  @$pb.TagNumber(1)
  set operatorUserID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOperatorUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearOperatorUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<UserOperationData> get operation => $_getList(1);
}

class UserOperationData extends $pb.GeneratedMessage {
  factory UserOperationData({
    $core.String? userID,
    $core.bool? cameraOnEntry,
    $core.bool? microphoneOnEntry,
  }) {
    final $result = create();
    if (userID != null) {
      $result.userID = userID;
    }
    if (cameraOnEntry != null) {
      $result.cameraOnEntry = cameraOnEntry;
    }
    if (microphoneOnEntry != null) {
      $result.microphoneOnEntry = microphoneOnEntry;
    }
    return $result;
  }
  UserOperationData._() : super();
  factory UserOperationData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserOperationData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserOperationData', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userID', protoName: 'userID')
    ..aOB(2, _omitFieldNames ? '' : 'cameraOnEntry', protoName: 'cameraOnEntry')
    ..aOB(3, _omitFieldNames ? '' : 'microphoneOnEntry', protoName: 'microphoneOnEntry')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserOperationData clone() => UserOperationData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserOperationData copyWith(void Function(UserOperationData) updates) => super.copyWith((message) => updates(message as UserOperationData)) as UserOperationData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserOperationData create() => UserOperationData._();
  UserOperationData createEmptyInstance() => create();
  static $pb.PbList<UserOperationData> createRepeated() => $pb.PbList<UserOperationData>();
  @$core.pragma('dart2js:noInline')
  static UserOperationData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserOperationData>(create);
  static UserOperationData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userID => $_getSZ(0);
  @$pb.TagNumber(1)
  set userID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get cameraOnEntry => $_getBF(1);
  @$pb.TagNumber(2)
  set cameraOnEntry($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCameraOnEntry() => $_has(1);
  @$pb.TagNumber(2)
  void clearCameraOnEntry() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get microphoneOnEntry => $_getBF(2);
  @$pb.TagNumber(3)
  set microphoneOnEntry($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMicrophoneOnEntry() => $_has(2);
  @$pb.TagNumber(3)
  void clearMicrophoneOnEntry() => clearField(3);
}

/// Request to book a future meeting.
class BookMeetingReq extends $pb.GeneratedMessage {
  factory BookMeetingReq({
    $core.String? creatorUserID,
    CreatorDefinedMeetingInfo? creatorDefinedMeetingInfo,
    MeetingSetting? setting,
  }) {
    final $result = create();
    if (creatorUserID != null) {
      $result.creatorUserID = creatorUserID;
    }
    if (creatorDefinedMeetingInfo != null) {
      $result.creatorDefinedMeetingInfo = creatorDefinedMeetingInfo;
    }
    if (setting != null) {
      $result.setting = setting;
    }
    return $result;
  }
  BookMeetingReq._() : super();
  factory BookMeetingReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BookMeetingReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BookMeetingReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'creatorUserID', protoName: 'creatorUserID')
    ..aOM<CreatorDefinedMeetingInfo>(2, _omitFieldNames ? '' : 'creatorDefinedMeetingInfo', protoName: 'creatorDefinedMeetingInfo', subBuilder: CreatorDefinedMeetingInfo.create)
    ..aOM<MeetingSetting>(3, _omitFieldNames ? '' : 'setting', subBuilder: MeetingSetting.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BookMeetingReq clone() => BookMeetingReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BookMeetingReq copyWith(void Function(BookMeetingReq) updates) => super.copyWith((message) => updates(message as BookMeetingReq)) as BookMeetingReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BookMeetingReq create() => BookMeetingReq._();
  BookMeetingReq createEmptyInstance() => create();
  static $pb.PbList<BookMeetingReq> createRepeated() => $pb.PbList<BookMeetingReq>();
  @$core.pragma('dart2js:noInline')
  static BookMeetingReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BookMeetingReq>(create);
  static BookMeetingReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get creatorUserID => $_getSZ(0);
  @$pb.TagNumber(1)
  set creatorUserID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCreatorUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearCreatorUserID() => clearField(1);

  @$pb.TagNumber(2)
  CreatorDefinedMeetingInfo get creatorDefinedMeetingInfo => $_getN(1);
  @$pb.TagNumber(2)
  set creatorDefinedMeetingInfo(CreatorDefinedMeetingInfo v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCreatorDefinedMeetingInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatorDefinedMeetingInfo() => clearField(2);
  @$pb.TagNumber(2)
  CreatorDefinedMeetingInfo ensureCreatorDefinedMeetingInfo() => $_ensure(1);

  @$pb.TagNumber(3)
  MeetingSetting get setting => $_getN(2);
  @$pb.TagNumber(3)
  set setting(MeetingSetting v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSetting() => $_has(2);
  @$pb.TagNumber(3)
  void clearSetting() => clearField(3);
  @$pb.TagNumber(3)
  MeetingSetting ensureSetting() => $_ensure(2);
}

/// Response after booking a meeting.
class BookMeetingResp extends $pb.GeneratedMessage {
  factory BookMeetingResp({
    MeetingInfoSetting? detail,
  }) {
    final $result = create();
    if (detail != null) {
      $result.detail = detail;
    }
    return $result;
  }
  BookMeetingResp._() : super();
  factory BookMeetingResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BookMeetingResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BookMeetingResp', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..aOM<MeetingInfoSetting>(1, _omitFieldNames ? '' : 'detail', subBuilder: MeetingInfoSetting.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BookMeetingResp clone() => BookMeetingResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BookMeetingResp copyWith(void Function(BookMeetingResp) updates) => super.copyWith((message) => updates(message as BookMeetingResp)) as BookMeetingResp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BookMeetingResp create() => BookMeetingResp._();
  BookMeetingResp createEmptyInstance() => create();
  static $pb.PbList<BookMeetingResp> createRepeated() => $pb.PbList<BookMeetingResp>();
  @$core.pragma('dart2js:noInline')
  static BookMeetingResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BookMeetingResp>(create);
  static BookMeetingResp? _defaultInstance;

  @$pb.TagNumber(1)
  MeetingInfoSetting get detail => $_getN(0);
  @$pb.TagNumber(1)
  set detail(MeetingInfoSetting v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDetail() => $_has(0);
  @$pb.TagNumber(1)
  void clearDetail() => clearField(1);
  @$pb.TagNumber(1)
  MeetingInfoSetting ensureDetail() => $_ensure(0);
}

/// Request to create an immediate meeting.
class CreateImmediateMeetingReq extends $pb.GeneratedMessage {
  factory CreateImmediateMeetingReq({
    $core.String? creatorUserID,
    CreatorDefinedMeetingInfo? creatorDefinedMeetingInfo,
    MeetingSetting? setting,
  }) {
    final $result = create();
    if (creatorUserID != null) {
      $result.creatorUserID = creatorUserID;
    }
    if (creatorDefinedMeetingInfo != null) {
      $result.creatorDefinedMeetingInfo = creatorDefinedMeetingInfo;
    }
    if (setting != null) {
      $result.setting = setting;
    }
    return $result;
  }
  CreateImmediateMeetingReq._() : super();
  factory CreateImmediateMeetingReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateImmediateMeetingReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateImmediateMeetingReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'creatorUserID', protoName: 'creatorUserID')
    ..aOM<CreatorDefinedMeetingInfo>(2, _omitFieldNames ? '' : 'creatorDefinedMeetingInfo', protoName: 'creatorDefinedMeetingInfo', subBuilder: CreatorDefinedMeetingInfo.create)
    ..aOM<MeetingSetting>(3, _omitFieldNames ? '' : 'setting', subBuilder: MeetingSetting.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateImmediateMeetingReq clone() => CreateImmediateMeetingReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateImmediateMeetingReq copyWith(void Function(CreateImmediateMeetingReq) updates) => super.copyWith((message) => updates(message as CreateImmediateMeetingReq)) as CreateImmediateMeetingReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateImmediateMeetingReq create() => CreateImmediateMeetingReq._();
  CreateImmediateMeetingReq createEmptyInstance() => create();
  static $pb.PbList<CreateImmediateMeetingReq> createRepeated() => $pb.PbList<CreateImmediateMeetingReq>();
  @$core.pragma('dart2js:noInline')
  static CreateImmediateMeetingReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateImmediateMeetingReq>(create);
  static CreateImmediateMeetingReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get creatorUserID => $_getSZ(0);
  @$pb.TagNumber(1)
  set creatorUserID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCreatorUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearCreatorUserID() => clearField(1);

  @$pb.TagNumber(2)
  CreatorDefinedMeetingInfo get creatorDefinedMeetingInfo => $_getN(1);
  @$pb.TagNumber(2)
  set creatorDefinedMeetingInfo(CreatorDefinedMeetingInfo v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCreatorDefinedMeetingInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatorDefinedMeetingInfo() => clearField(2);
  @$pb.TagNumber(2)
  CreatorDefinedMeetingInfo ensureCreatorDefinedMeetingInfo() => $_ensure(1);

  @$pb.TagNumber(3)
  MeetingSetting get setting => $_getN(2);
  @$pb.TagNumber(3)
  set setting(MeetingSetting v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSetting() => $_has(2);
  @$pb.TagNumber(3)
  void clearSetting() => clearField(3);
  @$pb.TagNumber(3)
  MeetingSetting ensureSetting() => $_ensure(2);
}

/// Response after creating an immediate meeting.
class CreateImmediateMeetingResp extends $pb.GeneratedMessage {
  factory CreateImmediateMeetingResp({
    MeetingInfoSetting? detail,
    LiveKit? liveKit,
  }) {
    final $result = create();
    if (detail != null) {
      $result.detail = detail;
    }
    if (liveKit != null) {
      $result.liveKit = liveKit;
    }
    return $result;
  }
  CreateImmediateMeetingResp._() : super();
  factory CreateImmediateMeetingResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateImmediateMeetingResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateImmediateMeetingResp', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..aOM<MeetingInfoSetting>(1, _omitFieldNames ? '' : 'detail', subBuilder: MeetingInfoSetting.create)
    ..aOM<LiveKit>(2, _omitFieldNames ? '' : 'liveKit', protoName: 'liveKit', subBuilder: LiveKit.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateImmediateMeetingResp clone() => CreateImmediateMeetingResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateImmediateMeetingResp copyWith(void Function(CreateImmediateMeetingResp) updates) => super.copyWith((message) => updates(message as CreateImmediateMeetingResp)) as CreateImmediateMeetingResp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateImmediateMeetingResp create() => CreateImmediateMeetingResp._();
  CreateImmediateMeetingResp createEmptyInstance() => create();
  static $pb.PbList<CreateImmediateMeetingResp> createRepeated() => $pb.PbList<CreateImmediateMeetingResp>();
  @$core.pragma('dart2js:noInline')
  static CreateImmediateMeetingResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateImmediateMeetingResp>(create);
  static CreateImmediateMeetingResp? _defaultInstance;

  @$pb.TagNumber(1)
  MeetingInfoSetting get detail => $_getN(0);
  @$pb.TagNumber(1)
  set detail(MeetingInfoSetting v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDetail() => $_has(0);
  @$pb.TagNumber(1)
  void clearDetail() => clearField(1);
  @$pb.TagNumber(1)
  MeetingInfoSetting ensureDetail() => $_ensure(0);

  @$pb.TagNumber(2)
  LiveKit get liveKit => $_getN(1);
  @$pb.TagNumber(2)
  set liveKit(LiveKit v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLiveKit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLiveKit() => clearField(2);
  @$pb.TagNumber(2)
  LiveKit ensureLiveKit() => $_ensure(1);
}

/// Request to join a meeting.
class JoinMeetingReq extends $pb.GeneratedMessage {
  factory JoinMeetingReq({
    $core.String? meetingID,
    $core.String? userID,
    $core.String? password,
  }) {
    final $result = create();
    if (meetingID != null) {
      $result.meetingID = meetingID;
    }
    if (userID != null) {
      $result.userID = userID;
    }
    if (password != null) {
      $result.password = password;
    }
    return $result;
  }
  JoinMeetingReq._() : super();
  factory JoinMeetingReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory JoinMeetingReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'JoinMeetingReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'meetingID', protoName: 'meetingID')
    ..aOS(2, _omitFieldNames ? '' : 'userID', protoName: 'userID')
    ..aOS(3, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  JoinMeetingReq clone() => JoinMeetingReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  JoinMeetingReq copyWith(void Function(JoinMeetingReq) updates) => super.copyWith((message) => updates(message as JoinMeetingReq)) as JoinMeetingReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JoinMeetingReq create() => JoinMeetingReq._();
  JoinMeetingReq createEmptyInstance() => create();
  static $pb.PbList<JoinMeetingReq> createRepeated() => $pb.PbList<JoinMeetingReq>();
  @$core.pragma('dart2js:noInline')
  static JoinMeetingReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JoinMeetingReq>(create);
  static JoinMeetingReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get meetingID => $_getSZ(0);
  @$pb.TagNumber(1)
  set meetingID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMeetingID() => $_has(0);
  @$pb.TagNumber(1)
  void clearMeetingID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userID => $_getSZ(1);
  @$pb.TagNumber(2)
  set userID($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserID() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserID() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(2);
  @$pb.TagNumber(3)
  set password($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassword() => clearField(3);
}

/// Response after joining a meeting.
class JoinMeetingResp extends $pb.GeneratedMessage {
  factory JoinMeetingResp({
    LiveKit? liveKit,
  }) {
    final $result = create();
    if (liveKit != null) {
      $result.liveKit = liveKit;
    }
    return $result;
  }
  JoinMeetingResp._() : super();
  factory JoinMeetingResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory JoinMeetingResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'JoinMeetingResp', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..aOM<LiveKit>(1, _omitFieldNames ? '' : 'liveKit', protoName: 'liveKit', subBuilder: LiveKit.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  JoinMeetingResp clone() => JoinMeetingResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  JoinMeetingResp copyWith(void Function(JoinMeetingResp) updates) => super.copyWith((message) => updates(message as JoinMeetingResp)) as JoinMeetingResp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JoinMeetingResp create() => JoinMeetingResp._();
  JoinMeetingResp createEmptyInstance() => create();
  static $pb.PbList<JoinMeetingResp> createRepeated() => $pb.PbList<JoinMeetingResp>();
  @$core.pragma('dart2js:noInline')
  static JoinMeetingResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JoinMeetingResp>(create);
  static JoinMeetingResp? _defaultInstance;

  @$pb.TagNumber(1)
  LiveKit get liveKit => $_getN(0);
  @$pb.TagNumber(1)
  set liveKit(LiveKit v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLiveKit() => $_has(0);
  @$pb.TagNumber(1)
  void clearLiveKit() => clearField(1);
  @$pb.TagNumber(1)
  LiveKit ensureLiveKit() => $_ensure(0);
}

/// Request to get a specific meeting token.
class GetMeetingTokenReq extends $pb.GeneratedMessage {
  factory GetMeetingTokenReq({
    $core.String? meetingID,
    $core.String? userID,
  }) {
    final $result = create();
    if (meetingID != null) {
      $result.meetingID = meetingID;
    }
    if (userID != null) {
      $result.userID = userID;
    }
    return $result;
  }
  GetMeetingTokenReq._() : super();
  factory GetMeetingTokenReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMeetingTokenReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMeetingTokenReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'meetingID', protoName: 'meetingID')
    ..aOS(2, _omitFieldNames ? '' : 'userID', protoName: 'userID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMeetingTokenReq clone() => GetMeetingTokenReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMeetingTokenReq copyWith(void Function(GetMeetingTokenReq) updates) => super.copyWith((message) => updates(message as GetMeetingTokenReq)) as GetMeetingTokenReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMeetingTokenReq create() => GetMeetingTokenReq._();
  GetMeetingTokenReq createEmptyInstance() => create();
  static $pb.PbList<GetMeetingTokenReq> createRepeated() => $pb.PbList<GetMeetingTokenReq>();
  @$core.pragma('dart2js:noInline')
  static GetMeetingTokenReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMeetingTokenReq>(create);
  static GetMeetingTokenReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get meetingID => $_getSZ(0);
  @$pb.TagNumber(1)
  set meetingID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMeetingID() => $_has(0);
  @$pb.TagNumber(1)
  void clearMeetingID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userID => $_getSZ(1);
  @$pb.TagNumber(2)
  set userID($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserID() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserID() => clearField(2);
}

/// Response after getting a specific meeting.
class GetMeetingTokenResp extends $pb.GeneratedMessage {
  factory GetMeetingTokenResp({
    $core.String? meetingID,
    LiveKit? liveKit,
  }) {
    final $result = create();
    if (meetingID != null) {
      $result.meetingID = meetingID;
    }
    if (liveKit != null) {
      $result.liveKit = liveKit;
    }
    return $result;
  }
  GetMeetingTokenResp._() : super();
  factory GetMeetingTokenResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMeetingTokenResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMeetingTokenResp', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'meetingID', protoName: 'meetingID')
    ..aOM<LiveKit>(2, _omitFieldNames ? '' : 'liveKit', protoName: 'liveKit', subBuilder: LiveKit.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMeetingTokenResp clone() => GetMeetingTokenResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMeetingTokenResp copyWith(void Function(GetMeetingTokenResp) updates) => super.copyWith((message) => updates(message as GetMeetingTokenResp)) as GetMeetingTokenResp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMeetingTokenResp create() => GetMeetingTokenResp._();
  GetMeetingTokenResp createEmptyInstance() => create();
  static $pb.PbList<GetMeetingTokenResp> createRepeated() => $pb.PbList<GetMeetingTokenResp>();
  @$core.pragma('dart2js:noInline')
  static GetMeetingTokenResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMeetingTokenResp>(create);
  static GetMeetingTokenResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get meetingID => $_getSZ(0);
  @$pb.TagNumber(1)
  set meetingID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMeetingID() => $_has(0);
  @$pb.TagNumber(1)
  void clearMeetingID() => clearField(1);

  @$pb.TagNumber(2)
  LiveKit get liveKit => $_getN(1);
  @$pb.TagNumber(2)
  set liveKit(LiveKit v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLiveKit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLiveKit() => clearField(2);
  @$pb.TagNumber(2)
  LiveKit ensureLiveKit() => $_ensure(1);
}

/// Request to leave a meeting.
class LeaveMeetingReq extends $pb.GeneratedMessage {
  factory LeaveMeetingReq({
    $core.String? meetingID,
    $core.String? userID,
  }) {
    final $result = create();
    if (meetingID != null) {
      $result.meetingID = meetingID;
    }
    if (userID != null) {
      $result.userID = userID;
    }
    return $result;
  }
  LeaveMeetingReq._() : super();
  factory LeaveMeetingReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LeaveMeetingReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LeaveMeetingReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'meetingID', protoName: 'meetingID')
    ..aOS(2, _omitFieldNames ? '' : 'userID', protoName: 'userID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LeaveMeetingReq clone() => LeaveMeetingReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LeaveMeetingReq copyWith(void Function(LeaveMeetingReq) updates) => super.copyWith((message) => updates(message as LeaveMeetingReq)) as LeaveMeetingReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LeaveMeetingReq create() => LeaveMeetingReq._();
  LeaveMeetingReq createEmptyInstance() => create();
  static $pb.PbList<LeaveMeetingReq> createRepeated() => $pb.PbList<LeaveMeetingReq>();
  @$core.pragma('dart2js:noInline')
  static LeaveMeetingReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LeaveMeetingReq>(create);
  static LeaveMeetingReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get meetingID => $_getSZ(0);
  @$pb.TagNumber(1)
  set meetingID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMeetingID() => $_has(0);
  @$pb.TagNumber(1)
  void clearMeetingID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userID => $_getSZ(1);
  @$pb.TagNumber(2)
  set userID($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserID() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserID() => clearField(2);
}

/// Response after leaving a meeting.
class LeaveMeetingResp extends $pb.GeneratedMessage {
  factory LeaveMeetingResp() => create();
  LeaveMeetingResp._() : super();
  factory LeaveMeetingResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LeaveMeetingResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LeaveMeetingResp', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LeaveMeetingResp clone() => LeaveMeetingResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LeaveMeetingResp copyWith(void Function(LeaveMeetingResp) updates) => super.copyWith((message) => updates(message as LeaveMeetingResp)) as LeaveMeetingResp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LeaveMeetingResp create() => LeaveMeetingResp._();
  LeaveMeetingResp createEmptyInstance() => create();
  static $pb.PbList<LeaveMeetingResp> createRepeated() => $pb.PbList<LeaveMeetingResp>();
  @$core.pragma('dart2js:noInline')
  static LeaveMeetingResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LeaveMeetingResp>(create);
  static LeaveMeetingResp? _defaultInstance;
}

/// Request to end a meeting.
class EndMeetingReq extends $pb.GeneratedMessage {
  factory EndMeetingReq({
    $core.String? meetingID,
    $core.String? userID,
  }) {
    final $result = create();
    if (meetingID != null) {
      $result.meetingID = meetingID;
    }
    if (userID != null) {
      $result.userID = userID;
    }
    return $result;
  }
  EndMeetingReq._() : super();
  factory EndMeetingReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EndMeetingReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EndMeetingReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'meetingID', protoName: 'meetingID')
    ..aOS(2, _omitFieldNames ? '' : 'userID', protoName: 'userID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EndMeetingReq clone() => EndMeetingReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EndMeetingReq copyWith(void Function(EndMeetingReq) updates) => super.copyWith((message) => updates(message as EndMeetingReq)) as EndMeetingReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EndMeetingReq create() => EndMeetingReq._();
  EndMeetingReq createEmptyInstance() => create();
  static $pb.PbList<EndMeetingReq> createRepeated() => $pb.PbList<EndMeetingReq>();
  @$core.pragma('dart2js:noInline')
  static EndMeetingReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EndMeetingReq>(create);
  static EndMeetingReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get meetingID => $_getSZ(0);
  @$pb.TagNumber(1)
  set meetingID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMeetingID() => $_has(0);
  @$pb.TagNumber(1)
  void clearMeetingID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userID => $_getSZ(1);
  @$pb.TagNumber(2)
  set userID($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserID() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserID() => clearField(2);
}

/// Response after ending a meeting.
class EndMeetingResp extends $pb.GeneratedMessage {
  factory EndMeetingResp() => create();
  EndMeetingResp._() : super();
  factory EndMeetingResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EndMeetingResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EndMeetingResp', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EndMeetingResp clone() => EndMeetingResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EndMeetingResp copyWith(void Function(EndMeetingResp) updates) => super.copyWith((message) => updates(message as EndMeetingResp)) as EndMeetingResp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EndMeetingResp create() => EndMeetingResp._();
  EndMeetingResp createEmptyInstance() => create();
  static $pb.PbList<EndMeetingResp> createRepeated() => $pb.PbList<EndMeetingResp>();
  @$core.pragma('dart2js:noInline')
  static EndMeetingResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EndMeetingResp>(create);
  static EndMeetingResp? _defaultInstance;
}

/// Request to get a list of meetings both created and joined by a user.
class GetMeetingsReq extends $pb.GeneratedMessage {
  factory GetMeetingsReq({
    $core.String? userID,
    $core.Iterable<$core.String>? status,
  }) {
    final $result = create();
    if (userID != null) {
      $result.userID = userID;
    }
    if (status != null) {
      $result.status.addAll(status);
    }
    return $result;
  }
  GetMeetingsReq._() : super();
  factory GetMeetingsReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMeetingsReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMeetingsReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userID', protoName: 'userID')
    ..pPS(2, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMeetingsReq clone() => GetMeetingsReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMeetingsReq copyWith(void Function(GetMeetingsReq) updates) => super.copyWith((message) => updates(message as GetMeetingsReq)) as GetMeetingsReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMeetingsReq create() => GetMeetingsReq._();
  GetMeetingsReq createEmptyInstance() => create();
  static $pb.PbList<GetMeetingsReq> createRepeated() => $pb.PbList<GetMeetingsReq>();
  @$core.pragma('dart2js:noInline')
  static GetMeetingsReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMeetingsReq>(create);
  static GetMeetingsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userID => $_getSZ(0);
  @$pb.TagNumber(1)
  set userID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get status => $_getList(1);
}

/// Response with a list of meetings that the user has created or joined.
class GetMeetingsResp extends $pb.GeneratedMessage {
  factory GetMeetingsResp({
    $core.Iterable<MeetingInfoSetting>? meetingDetails,
  }) {
    final $result = create();
    if (meetingDetails != null) {
      $result.meetingDetails.addAll(meetingDetails);
    }
    return $result;
  }
  GetMeetingsResp._() : super();
  factory GetMeetingsResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMeetingsResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMeetingsResp', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..pc<MeetingInfoSetting>(1, _omitFieldNames ? '' : 'meetingDetails', $pb.PbFieldType.PM, protoName: 'meetingDetails', subBuilder: MeetingInfoSetting.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMeetingsResp clone() => GetMeetingsResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMeetingsResp copyWith(void Function(GetMeetingsResp) updates) => super.copyWith((message) => updates(message as GetMeetingsResp)) as GetMeetingsResp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMeetingsResp create() => GetMeetingsResp._();
  GetMeetingsResp createEmptyInstance() => create();
  static $pb.PbList<GetMeetingsResp> createRepeated() => $pb.PbList<GetMeetingsResp>();
  @$core.pragma('dart2js:noInline')
  static GetMeetingsResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMeetingsResp>(create);
  static GetMeetingsResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<MeetingInfoSetting> get meetingDetails => $_getList(0);
}

/// Request to get information about a specific meeting.
class GetMeetingReq extends $pb.GeneratedMessage {
  factory GetMeetingReq({
    $core.String? userID,
    $core.String? meetingID,
  }) {
    final $result = create();
    if (userID != null) {
      $result.userID = userID;
    }
    if (meetingID != null) {
      $result.meetingID = meetingID;
    }
    return $result;
  }
  GetMeetingReq._() : super();
  factory GetMeetingReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMeetingReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMeetingReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userID', protoName: 'userID')
    ..aOS(2, _omitFieldNames ? '' : 'meetingID', protoName: 'meetingID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMeetingReq clone() => GetMeetingReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMeetingReq copyWith(void Function(GetMeetingReq) updates) => super.copyWith((message) => updates(message as GetMeetingReq)) as GetMeetingReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMeetingReq create() => GetMeetingReq._();
  GetMeetingReq createEmptyInstance() => create();
  static $pb.PbList<GetMeetingReq> createRepeated() => $pb.PbList<GetMeetingReq>();
  @$core.pragma('dart2js:noInline')
  static GetMeetingReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMeetingReq>(create);
  static GetMeetingReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userID => $_getSZ(0);
  @$pb.TagNumber(1)
  set userID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get meetingID => $_getSZ(1);
  @$pb.TagNumber(2)
  set meetingID($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMeetingID() => $_has(1);
  @$pb.TagNumber(2)
  void clearMeetingID() => clearField(2);
}

/// Response with detailed information about a meeting.
class GetMeetingResp extends $pb.GeneratedMessage {
  factory GetMeetingResp({
    MeetingInfoSetting? meetingDetail,
  }) {
    final $result = create();
    if (meetingDetail != null) {
      $result.meetingDetail = meetingDetail;
    }
    return $result;
  }
  GetMeetingResp._() : super();
  factory GetMeetingResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMeetingResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMeetingResp', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..aOM<MeetingInfoSetting>(1, _omitFieldNames ? '' : 'meetingDetail', protoName: 'meetingDetail', subBuilder: MeetingInfoSetting.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMeetingResp clone() => GetMeetingResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMeetingResp copyWith(void Function(GetMeetingResp) updates) => super.copyWith((message) => updates(message as GetMeetingResp)) as GetMeetingResp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMeetingResp create() => GetMeetingResp._();
  GetMeetingResp createEmptyInstance() => create();
  static $pb.PbList<GetMeetingResp> createRepeated() => $pb.PbList<GetMeetingResp>();
  @$core.pragma('dart2js:noInline')
  static GetMeetingResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMeetingResp>(create);
  static GetMeetingResp? _defaultInstance;

  @$pb.TagNumber(1)
  MeetingInfoSetting get meetingDetail => $_getN(0);
  @$pb.TagNumber(1)
  set meetingDetail(MeetingInfoSetting v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMeetingDetail() => $_has(0);
  @$pb.TagNumber(1)
  void clearMeetingDetail() => clearField(1);
  @$pb.TagNumber(1)
  MeetingInfoSetting ensureMeetingDetail() => $_ensure(0);
}

/// Request to update specific fields of a meeting.
class UpdateMeetingRequest extends $pb.GeneratedMessage {
  factory UpdateMeetingRequest({
    $core.String? meetingID,
    $core.String? updatingUserID,
    $core.String? title,
    $fixnum.Int64? scheduledTime,
    $fixnum.Int64? meetingDuration,
    $core.String? password,
    $core.bool? canParticipantsEnableCamera,
    $core.bool? canParticipantsUnmuteMicrophone,
    $core.bool? canParticipantsShareScreen,
    $core.bool? disableCameraOnJoin,
    $core.bool? disableMicrophoneOnJoin,
  }) {
    final $result = create();
    if (meetingID != null) {
      $result.meetingID = meetingID;
    }
    if (updatingUserID != null) {
      $result.updatingUserID = updatingUserID;
    }
    if (title != null) {
      $result.title = title;
    }
    if (scheduledTime != null) {
      $result.scheduledTime = scheduledTime;
    }
    if (meetingDuration != null) {
      $result.meetingDuration = meetingDuration;
    }
    if (password != null) {
      $result.password = password;
    }
    if (canParticipantsEnableCamera != null) {
      $result.canParticipantsEnableCamera = canParticipantsEnableCamera;
    }
    if (canParticipantsUnmuteMicrophone != null) {
      $result.canParticipantsUnmuteMicrophone = canParticipantsUnmuteMicrophone;
    }
    if (canParticipantsShareScreen != null) {
      $result.canParticipantsShareScreen = canParticipantsShareScreen;
    }
    if (disableCameraOnJoin != null) {
      $result.disableCameraOnJoin = disableCameraOnJoin;
    }
    if (disableMicrophoneOnJoin != null) {
      $result.disableMicrophoneOnJoin = disableMicrophoneOnJoin;
    }
    return $result;
  }
  UpdateMeetingRequest._() : super();
  factory UpdateMeetingRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateMeetingRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateMeetingRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'meetingID', protoName: 'meetingID')
    ..aOS(2, _omitFieldNames ? '' : 'updatingUserID', protoName: 'updatingUserID')
    ..aOS(3, _omitFieldNames ? '' : 'title')
    ..aInt64(4, _omitFieldNames ? '' : 'scheduledTime', protoName: 'scheduledTime')
    ..aInt64(5, _omitFieldNames ? '' : 'meetingDuration', protoName: 'meetingDuration')
    ..aOS(6, _omitFieldNames ? '' : 'password')
    ..aOB(7, _omitFieldNames ? '' : 'canParticipantsEnableCamera', protoName: 'canParticipantsEnableCamera')
    ..aOB(8, _omitFieldNames ? '' : 'canParticipantsUnmuteMicrophone', protoName: 'canParticipantsUnmuteMicrophone')
    ..aOB(9, _omitFieldNames ? '' : 'canParticipantsShareScreen', protoName: 'canParticipantsShareScreen')
    ..aOB(10, _omitFieldNames ? '' : 'disableCameraOnJoin', protoName: 'disableCameraOnJoin')
    ..aOB(11, _omitFieldNames ? '' : 'disableMicrophoneOnJoin', protoName: 'disableMicrophoneOnJoin')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateMeetingRequest clone() => UpdateMeetingRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateMeetingRequest copyWith(void Function(UpdateMeetingRequest) updates) => super.copyWith((message) => updates(message as UpdateMeetingRequest)) as UpdateMeetingRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateMeetingRequest create() => UpdateMeetingRequest._();
  UpdateMeetingRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateMeetingRequest> createRepeated() => $pb.PbList<UpdateMeetingRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateMeetingRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateMeetingRequest>(create);
  static UpdateMeetingRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get meetingID => $_getSZ(0);
  @$pb.TagNumber(1)
  set meetingID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMeetingID() => $_has(0);
  @$pb.TagNumber(1)
  void clearMeetingID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get updatingUserID => $_getSZ(1);
  @$pb.TagNumber(2)
  set updatingUserID($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUpdatingUserID() => $_has(1);
  @$pb.TagNumber(2)
  void clearUpdatingUserID() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get scheduledTime => $_getI64(3);
  @$pb.TagNumber(4)
  set scheduledTime($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasScheduledTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearScheduledTime() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get meetingDuration => $_getI64(4);
  @$pb.TagNumber(5)
  set meetingDuration($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMeetingDuration() => $_has(4);
  @$pb.TagNumber(5)
  void clearMeetingDuration() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get password => $_getSZ(5);
  @$pb.TagNumber(6)
  set password($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPassword() => $_has(5);
  @$pb.TagNumber(6)
  void clearPassword() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get canParticipantsEnableCamera => $_getBF(6);
  @$pb.TagNumber(7)
  set canParticipantsEnableCamera($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCanParticipantsEnableCamera() => $_has(6);
  @$pb.TagNumber(7)
  void clearCanParticipantsEnableCamera() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get canParticipantsUnmuteMicrophone => $_getBF(7);
  @$pb.TagNumber(8)
  set canParticipantsUnmuteMicrophone($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasCanParticipantsUnmuteMicrophone() => $_has(7);
  @$pb.TagNumber(8)
  void clearCanParticipantsUnmuteMicrophone() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get canParticipantsShareScreen => $_getBF(8);
  @$pb.TagNumber(9)
  set canParticipantsShareScreen($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasCanParticipantsShareScreen() => $_has(8);
  @$pb.TagNumber(9)
  void clearCanParticipantsShareScreen() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get disableCameraOnJoin => $_getBF(9);
  @$pb.TagNumber(10)
  set disableCameraOnJoin($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasDisableCameraOnJoin() => $_has(9);
  @$pb.TagNumber(10)
  void clearDisableCameraOnJoin() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get disableMicrophoneOnJoin => $_getBF(10);
  @$pb.TagNumber(11)
  set disableMicrophoneOnJoin($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasDisableMicrophoneOnJoin() => $_has(10);
  @$pb.TagNumber(11)
  void clearDisableMicrophoneOnJoin() => clearField(11);
}

/// Response after updating meeting settings.
class UpdateMeetingResp extends $pb.GeneratedMessage {
  factory UpdateMeetingResp() => create();
  UpdateMeetingResp._() : super();
  factory UpdateMeetingResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateMeetingResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateMeetingResp', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateMeetingResp clone() => UpdateMeetingResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateMeetingResp copyWith(void Function(UpdateMeetingResp) updates) => super.copyWith((message) => updates(message as UpdateMeetingResp)) as UpdateMeetingResp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateMeetingResp create() => UpdateMeetingResp._();
  UpdateMeetingResp createEmptyInstance() => create();
  static $pb.PbList<UpdateMeetingResp> createRepeated() => $pb.PbList<UpdateMeetingResp>();
  @$core.pragma('dart2js:noInline')
  static UpdateMeetingResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateMeetingResp>(create);
  static UpdateMeetingResp? _defaultInstance;
}

/// Personal meeting settings related to video and audio on entry.
class PersonalMeetingSetting extends $pb.GeneratedMessage {
  factory PersonalMeetingSetting({
    $core.bool? cameraOnEntry,
    $core.bool? microphoneOnEntry,
  }) {
    final $result = create();
    if (cameraOnEntry != null) {
      $result.cameraOnEntry = cameraOnEntry;
    }
    if (microphoneOnEntry != null) {
      $result.microphoneOnEntry = microphoneOnEntry;
    }
    return $result;
  }
  PersonalMeetingSetting._() : super();
  factory PersonalMeetingSetting.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PersonalMeetingSetting.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PersonalMeetingSetting', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'cameraOnEntry', protoName: 'cameraOnEntry')
    ..aOB(2, _omitFieldNames ? '' : 'microphoneOnEntry', protoName: 'microphoneOnEntry')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PersonalMeetingSetting clone() => PersonalMeetingSetting()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PersonalMeetingSetting copyWith(void Function(PersonalMeetingSetting) updates) => super.copyWith((message) => updates(message as PersonalMeetingSetting)) as PersonalMeetingSetting;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PersonalMeetingSetting create() => PersonalMeetingSetting._();
  PersonalMeetingSetting createEmptyInstance() => create();
  static $pb.PbList<PersonalMeetingSetting> createRepeated() => $pb.PbList<PersonalMeetingSetting>();
  @$core.pragma('dart2js:noInline')
  static PersonalMeetingSetting getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PersonalMeetingSetting>(create);
  static PersonalMeetingSetting? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get cameraOnEntry => $_getBF(0);
  @$pb.TagNumber(1)
  set cameraOnEntry($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCameraOnEntry() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraOnEntry() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get microphoneOnEntry => $_getBF(1);
  @$pb.TagNumber(2)
  set microphoneOnEntry($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMicrophoneOnEntry() => $_has(1);
  @$pb.TagNumber(2)
  void clearMicrophoneOnEntry() => clearField(2);
}

/// Request to get personal meeting settings.
class GetPersonalMeetingSettingsReq extends $pb.GeneratedMessage {
  factory GetPersonalMeetingSettingsReq({
    $core.String? meetingID,
    $core.String? userID,
  }) {
    final $result = create();
    if (meetingID != null) {
      $result.meetingID = meetingID;
    }
    if (userID != null) {
      $result.userID = userID;
    }
    return $result;
  }
  GetPersonalMeetingSettingsReq._() : super();
  factory GetPersonalMeetingSettingsReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPersonalMeetingSettingsReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPersonalMeetingSettingsReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'meetingID', protoName: 'meetingID')
    ..aOS(2, _omitFieldNames ? '' : 'userID', protoName: 'userID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPersonalMeetingSettingsReq clone() => GetPersonalMeetingSettingsReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPersonalMeetingSettingsReq copyWith(void Function(GetPersonalMeetingSettingsReq) updates) => super.copyWith((message) => updates(message as GetPersonalMeetingSettingsReq)) as GetPersonalMeetingSettingsReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPersonalMeetingSettingsReq create() => GetPersonalMeetingSettingsReq._();
  GetPersonalMeetingSettingsReq createEmptyInstance() => create();
  static $pb.PbList<GetPersonalMeetingSettingsReq> createRepeated() => $pb.PbList<GetPersonalMeetingSettingsReq>();
  @$core.pragma('dart2js:noInline')
  static GetPersonalMeetingSettingsReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPersonalMeetingSettingsReq>(create);
  static GetPersonalMeetingSettingsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get meetingID => $_getSZ(0);
  @$pb.TagNumber(1)
  set meetingID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMeetingID() => $_has(0);
  @$pb.TagNumber(1)
  void clearMeetingID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userID => $_getSZ(1);
  @$pb.TagNumber(2)
  set userID($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserID() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserID() => clearField(2);
}

/// Response with personal meeting settings.
class GetPersonalMeetingSettingsResp extends $pb.GeneratedMessage {
  factory GetPersonalMeetingSettingsResp({
    PersonalMeetingSetting? setting,
  }) {
    final $result = create();
    if (setting != null) {
      $result.setting = setting;
    }
    return $result;
  }
  GetPersonalMeetingSettingsResp._() : super();
  factory GetPersonalMeetingSettingsResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPersonalMeetingSettingsResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPersonalMeetingSettingsResp', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..aOM<PersonalMeetingSetting>(1, _omitFieldNames ? '' : 'setting', subBuilder: PersonalMeetingSetting.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPersonalMeetingSettingsResp clone() => GetPersonalMeetingSettingsResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPersonalMeetingSettingsResp copyWith(void Function(GetPersonalMeetingSettingsResp) updates) => super.copyWith((message) => updates(message as GetPersonalMeetingSettingsResp)) as GetPersonalMeetingSettingsResp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPersonalMeetingSettingsResp create() => GetPersonalMeetingSettingsResp._();
  GetPersonalMeetingSettingsResp createEmptyInstance() => create();
  static $pb.PbList<GetPersonalMeetingSettingsResp> createRepeated() => $pb.PbList<GetPersonalMeetingSettingsResp>();
  @$core.pragma('dart2js:noInline')
  static GetPersonalMeetingSettingsResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPersonalMeetingSettingsResp>(create);
  static GetPersonalMeetingSettingsResp? _defaultInstance;

  @$pb.TagNumber(1)
  PersonalMeetingSetting get setting => $_getN(0);
  @$pb.TagNumber(1)
  set setting(PersonalMeetingSetting v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSetting() => $_has(0);
  @$pb.TagNumber(1)
  void clearSetting() => clearField(1);
  @$pb.TagNumber(1)
  PersonalMeetingSetting ensureSetting() => $_ensure(0);
}

/// Request to set personal meeting settings.
class SetPersonalMeetingSettingsReq extends $pb.GeneratedMessage {
  factory SetPersonalMeetingSettingsReq({
    $core.String? meetingID,
    $core.String? userID,
    PersonalMeetingSetting? setting,
  }) {
    final $result = create();
    if (meetingID != null) {
      $result.meetingID = meetingID;
    }
    if (userID != null) {
      $result.userID = userID;
    }
    if (setting != null) {
      $result.setting = setting;
    }
    return $result;
  }
  SetPersonalMeetingSettingsReq._() : super();
  factory SetPersonalMeetingSettingsReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetPersonalMeetingSettingsReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SetPersonalMeetingSettingsReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'meetingID', protoName: 'meetingID')
    ..aOS(2, _omitFieldNames ? '' : 'userID', protoName: 'userID')
    ..aOM<PersonalMeetingSetting>(3, _omitFieldNames ? '' : 'setting', subBuilder: PersonalMeetingSetting.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetPersonalMeetingSettingsReq clone() => SetPersonalMeetingSettingsReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetPersonalMeetingSettingsReq copyWith(void Function(SetPersonalMeetingSettingsReq) updates) => super.copyWith((message) => updates(message as SetPersonalMeetingSettingsReq)) as SetPersonalMeetingSettingsReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetPersonalMeetingSettingsReq create() => SetPersonalMeetingSettingsReq._();
  SetPersonalMeetingSettingsReq createEmptyInstance() => create();
  static $pb.PbList<SetPersonalMeetingSettingsReq> createRepeated() => $pb.PbList<SetPersonalMeetingSettingsReq>();
  @$core.pragma('dart2js:noInline')
  static SetPersonalMeetingSettingsReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetPersonalMeetingSettingsReq>(create);
  static SetPersonalMeetingSettingsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get meetingID => $_getSZ(0);
  @$pb.TagNumber(1)
  set meetingID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMeetingID() => $_has(0);
  @$pb.TagNumber(1)
  void clearMeetingID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userID => $_getSZ(1);
  @$pb.TagNumber(2)
  set userID($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserID() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserID() => clearField(2);

  @$pb.TagNumber(3)
  PersonalMeetingSetting get setting => $_getN(2);
  @$pb.TagNumber(3)
  set setting(PersonalMeetingSetting v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSetting() => $_has(2);
  @$pb.TagNumber(3)
  void clearSetting() => clearField(3);
  @$pb.TagNumber(3)
  PersonalMeetingSetting ensureSetting() => $_ensure(2);
}

/// Response after setting personal meeting settings.
class SetPersonalMeetingSettingsResp extends $pb.GeneratedMessage {
  factory SetPersonalMeetingSettingsResp() => create();
  SetPersonalMeetingSettingsResp._() : super();
  factory SetPersonalMeetingSettingsResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetPersonalMeetingSettingsResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SetPersonalMeetingSettingsResp', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetPersonalMeetingSettingsResp clone() => SetPersonalMeetingSettingsResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetPersonalMeetingSettingsResp copyWith(void Function(SetPersonalMeetingSettingsResp) updates) => super.copyWith((message) => updates(message as SetPersonalMeetingSettingsResp)) as SetPersonalMeetingSettingsResp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetPersonalMeetingSettingsResp create() => SetPersonalMeetingSettingsResp._();
  SetPersonalMeetingSettingsResp createEmptyInstance() => create();
  static $pb.PbList<SetPersonalMeetingSettingsResp> createRepeated() => $pb.PbList<SetPersonalMeetingSettingsResp>();
  @$core.pragma('dart2js:noInline')
  static SetPersonalMeetingSettingsResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetPersonalMeetingSettingsResp>(create);
  static SetPersonalMeetingSettingsResp? _defaultInstance;
}

class PersonalData extends $pb.GeneratedMessage {
  factory PersonalData({
    $core.String? userID,
    PersonalMeetingSetting? personalSetting,
    PersonalMeetingSetting? limitSetting,
  }) {
    final $result = create();
    if (userID != null) {
      $result.userID = userID;
    }
    if (personalSetting != null) {
      $result.personalSetting = personalSetting;
    }
    if (limitSetting != null) {
      $result.limitSetting = limitSetting;
    }
    return $result;
  }
  PersonalData._() : super();
  factory PersonalData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PersonalData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PersonalData', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userID', protoName: 'userID')
    ..aOM<PersonalMeetingSetting>(2, _omitFieldNames ? '' : 'personalSetting', protoName: 'personalSetting', subBuilder: PersonalMeetingSetting.create)
    ..aOM<PersonalMeetingSetting>(3, _omitFieldNames ? '' : 'limitSetting', protoName: 'limitSetting', subBuilder: PersonalMeetingSetting.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PersonalData clone() => PersonalData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PersonalData copyWith(void Function(PersonalData) updates) => super.copyWith((message) => updates(message as PersonalData)) as PersonalData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PersonalData create() => PersonalData._();
  PersonalData createEmptyInstance() => create();
  static $pb.PbList<PersonalData> createRepeated() => $pb.PbList<PersonalData>();
  @$core.pragma('dart2js:noInline')
  static PersonalData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PersonalData>(create);
  static PersonalData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userID => $_getSZ(0);
  @$pb.TagNumber(1)
  set userID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  PersonalMeetingSetting get personalSetting => $_getN(1);
  @$pb.TagNumber(2)
  set personalSetting(PersonalMeetingSetting v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPersonalSetting() => $_has(1);
  @$pb.TagNumber(2)
  void clearPersonalSetting() => clearField(2);
  @$pb.TagNumber(2)
  PersonalMeetingSetting ensurePersonalSetting() => $_ensure(1);

  /// limitSetting is that host user limit this user's stream operation
  @$pb.TagNumber(3)
  PersonalMeetingSetting get limitSetting => $_getN(2);
  @$pb.TagNumber(3)
  set limitSetting(PersonalMeetingSetting v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasLimitSetting() => $_has(2);
  @$pb.TagNumber(3)
  void clearLimitSetting() => clearField(3);
  @$pb.TagNumber(3)
  PersonalMeetingSetting ensureLimitSetting() => $_ensure(2);
}

/// Metadata about a meeting, primarily used for encapsulating meeting details.
class MeetingMetadata extends $pb.GeneratedMessage {
  factory MeetingMetadata({
    MeetingInfoSetting? detail,
    $core.Iterable<PersonalData>? personalData,
  }) {
    final $result = create();
    if (detail != null) {
      $result.detail = detail;
    }
    if (personalData != null) {
      $result.personalData.addAll(personalData);
    }
    return $result;
  }
  MeetingMetadata._() : super();
  factory MeetingMetadata.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MeetingMetadata.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MeetingMetadata', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..aOM<MeetingInfoSetting>(1, _omitFieldNames ? '' : 'detail', subBuilder: MeetingInfoSetting.create)
    ..pc<PersonalData>(2, _omitFieldNames ? '' : 'personalData', $pb.PbFieldType.PM, protoName: 'personalData', subBuilder: PersonalData.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MeetingMetadata clone() => MeetingMetadata()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MeetingMetadata copyWith(void Function(MeetingMetadata) updates) => super.copyWith((message) => updates(message as MeetingMetadata)) as MeetingMetadata;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MeetingMetadata create() => MeetingMetadata._();
  MeetingMetadata createEmptyInstance() => create();
  static $pb.PbList<MeetingMetadata> createRepeated() => $pb.PbList<MeetingMetadata>();
  @$core.pragma('dart2js:noInline')
  static MeetingMetadata getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MeetingMetadata>(create);
  static MeetingMetadata? _defaultInstance;

  @$pb.TagNumber(1)
  MeetingInfoSetting get detail => $_getN(0);
  @$pb.TagNumber(1)
  set detail(MeetingInfoSetting v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDetail() => $_has(0);
  @$pb.TagNumber(1)
  void clearDetail() => clearField(1);
  @$pb.TagNumber(1)
  MeetingInfoSetting ensureDetail() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<PersonalData> get personalData => $_getList(1);
}

/// operate room all stream related to video and audio on entry.
class OperateRoomAllStreamReq extends $pb.GeneratedMessage {
  factory OperateRoomAllStreamReq({
    $core.String? meetingID,
    $core.String? operatorUserID,
    $core.bool? cameraOnEntry,
    $core.bool? microphoneOnEntry,
  }) {
    final $result = create();
    if (meetingID != null) {
      $result.meetingID = meetingID;
    }
    if (operatorUserID != null) {
      $result.operatorUserID = operatorUserID;
    }
    if (cameraOnEntry != null) {
      $result.cameraOnEntry = cameraOnEntry;
    }
    if (microphoneOnEntry != null) {
      $result.microphoneOnEntry = microphoneOnEntry;
    }
    return $result;
  }
  OperateRoomAllStreamReq._() : super();
  factory OperateRoomAllStreamReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OperateRoomAllStreamReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'OperateRoomAllStreamReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'meetingID', protoName: 'meetingID')
    ..aOS(2, _omitFieldNames ? '' : 'operatorUserID', protoName: 'operatorUserID')
    ..aOB(3, _omitFieldNames ? '' : 'cameraOnEntry', protoName: 'cameraOnEntry')
    ..aOB(4, _omitFieldNames ? '' : 'microphoneOnEntry', protoName: 'microphoneOnEntry')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OperateRoomAllStreamReq clone() => OperateRoomAllStreamReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OperateRoomAllStreamReq copyWith(void Function(OperateRoomAllStreamReq) updates) => super.copyWith((message) => updates(message as OperateRoomAllStreamReq)) as OperateRoomAllStreamReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OperateRoomAllStreamReq create() => OperateRoomAllStreamReq._();
  OperateRoomAllStreamReq createEmptyInstance() => create();
  static $pb.PbList<OperateRoomAllStreamReq> createRepeated() => $pb.PbList<OperateRoomAllStreamReq>();
  @$core.pragma('dart2js:noInline')
  static OperateRoomAllStreamReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OperateRoomAllStreamReq>(create);
  static OperateRoomAllStreamReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get meetingID => $_getSZ(0);
  @$pb.TagNumber(1)
  set meetingID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMeetingID() => $_has(0);
  @$pb.TagNumber(1)
  void clearMeetingID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get operatorUserID => $_getSZ(1);
  @$pb.TagNumber(2)
  set operatorUserID($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOperatorUserID() => $_has(1);
  @$pb.TagNumber(2)
  void clearOperatorUserID() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get cameraOnEntry => $_getBF(2);
  @$pb.TagNumber(3)
  set cameraOnEntry($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCameraOnEntry() => $_has(2);
  @$pb.TagNumber(3)
  void clearCameraOnEntry() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get microphoneOnEntry => $_getBF(3);
  @$pb.TagNumber(4)
  set microphoneOnEntry($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMicrophoneOnEntry() => $_has(3);
  @$pb.TagNumber(4)
  void clearMicrophoneOnEntry() => clearField(4);
}

/// Response with operate room all stream.
class OperateRoomAllStreamResp extends $pb.GeneratedMessage {
  factory OperateRoomAllStreamResp({
    $core.Iterable<$core.String>? streamNotExistUserIDList,
    $core.Iterable<$core.String>? failedUserIDList,
  }) {
    final $result = create();
    if (streamNotExistUserIDList != null) {
      $result.streamNotExistUserIDList.addAll(streamNotExistUserIDList);
    }
    if (failedUserIDList != null) {
      $result.failedUserIDList.addAll(failedUserIDList);
    }
    return $result;
  }
  OperateRoomAllStreamResp._() : super();
  factory OperateRoomAllStreamResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OperateRoomAllStreamResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'OperateRoomAllStreamResp', package: const $pb.PackageName(_omitMessageNames ? '' : 'openmeeting.meeting'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'streamNotExistUserIDList', protoName: 'streamNotExistUserIDList')
    ..pPS(2, _omitFieldNames ? '' : 'failedUserIDList', protoName: 'failedUserIDList')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OperateRoomAllStreamResp clone() => OperateRoomAllStreamResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OperateRoomAllStreamResp copyWith(void Function(OperateRoomAllStreamResp) updates) => super.copyWith((message) => updates(message as OperateRoomAllStreamResp)) as OperateRoomAllStreamResp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OperateRoomAllStreamResp create() => OperateRoomAllStreamResp._();
  OperateRoomAllStreamResp createEmptyInstance() => create();
  static $pb.PbList<OperateRoomAllStreamResp> createRepeated() => $pb.PbList<OperateRoomAllStreamResp>();
  @$core.pragma('dart2js:noInline')
  static OperateRoomAllStreamResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OperateRoomAllStreamResp>(create);
  static OperateRoomAllStreamResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get streamNotExistUserIDList => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.String> get failedUserIDList => $_getList(1);
}

class MeetingServiceApi {
  $pb.RpcClient _client;
  MeetingServiceApi(this._client);

  $async.Future<BookMeetingResp> bookMeeting($pb.ClientContext? ctx, BookMeetingReq request) =>
    _client.invoke<BookMeetingResp>(ctx, 'MeetingService', 'BookMeeting', request, BookMeetingResp())
  ;
  $async.Future<CreateImmediateMeetingResp> createImmediateMeeting($pb.ClientContext? ctx, CreateImmediateMeetingReq request) =>
    _client.invoke<CreateImmediateMeetingResp>(ctx, 'MeetingService', 'CreateImmediateMeeting', request, CreateImmediateMeetingResp())
  ;
  $async.Future<JoinMeetingResp> joinMeeting($pb.ClientContext? ctx, JoinMeetingReq request) =>
    _client.invoke<JoinMeetingResp>(ctx, 'MeetingService', 'JoinMeeting', request, JoinMeetingResp())
  ;
  $async.Future<GetMeetingTokenResp> getMeetingToken($pb.ClientContext? ctx, GetMeetingTokenReq request) =>
    _client.invoke<GetMeetingTokenResp>(ctx, 'MeetingService', 'GetMeetingToken', request, GetMeetingTokenResp())
  ;
  $async.Future<LeaveMeetingResp> leaveMeeting($pb.ClientContext? ctx, LeaveMeetingReq request) =>
    _client.invoke<LeaveMeetingResp>(ctx, 'MeetingService', 'LeaveMeeting', request, LeaveMeetingResp())
  ;
  $async.Future<EndMeetingResp> endMeeting($pb.ClientContext? ctx, EndMeetingReq request) =>
    _client.invoke<EndMeetingResp>(ctx, 'MeetingService', 'EndMeeting', request, EndMeetingResp())
  ;
  $async.Future<GetMeetingsResp> getMeetings($pb.ClientContext? ctx, GetMeetingsReq request) =>
    _client.invoke<GetMeetingsResp>(ctx, 'MeetingService', 'GetMeetings', request, GetMeetingsResp())
  ;
  $async.Future<GetMeetingResp> getMeeting($pb.ClientContext? ctx, GetMeetingReq request) =>
    _client.invoke<GetMeetingResp>(ctx, 'MeetingService', 'GetMeeting', request, GetMeetingResp())
  ;
  $async.Future<UpdateMeetingResp> updateMeeting($pb.ClientContext? ctx, UpdateMeetingRequest request) =>
    _client.invoke<UpdateMeetingResp>(ctx, 'MeetingService', 'UpdateMeeting', request, UpdateMeetingResp())
  ;
  $async.Future<GetPersonalMeetingSettingsResp> getPersonalMeetingSettings($pb.ClientContext? ctx, GetPersonalMeetingSettingsReq request) =>
    _client.invoke<GetPersonalMeetingSettingsResp>(ctx, 'MeetingService', 'GetPersonalMeetingSettings', request, GetPersonalMeetingSettingsResp())
  ;
  $async.Future<SetPersonalMeetingSettingsResp> setPersonalMeetingSettings($pb.ClientContext? ctx, SetPersonalMeetingSettingsReq request) =>
    _client.invoke<SetPersonalMeetingSettingsResp>(ctx, 'MeetingService', 'SetPersonalMeetingSettings', request, SetPersonalMeetingSettingsResp())
  ;
  $async.Future<OperateRoomAllStreamResp> operateRoomAllStream($pb.ClientContext? ctx, OperateRoomAllStreamReq request) =>
    _client.invoke<OperateRoomAllStreamResp>(ctx, 'MeetingService', 'OperateRoomAllStream', request, OperateRoomAllStreamResp())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');