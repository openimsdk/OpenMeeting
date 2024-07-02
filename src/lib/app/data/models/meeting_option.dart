class MeetingOptions {
  final bool enableMicrophone;
  final bool enableSpeaker;
  final bool enableVideo;
  final bool videoIsMirroring;
  bool enableAudioEncouragement;

  MeetingOptions({
    this.enableMicrophone = true,
    this.enableSpeaker = true,
    this.enableVideo = true,
    this.videoIsMirroring = false,
    this.enableAudioEncouragement = false,
  });

  factory MeetingOptions.fromMap(Map<String, dynamic> json) => MeetingOptions(
        enableMicrophone: json['enableMicrophone'],
        enableSpeaker: json['enableSpeaker'],
        enableVideo: json['enableVideo'],
        videoIsMirroring: json['videoIsMirroring'],
        enableAudioEncouragement: json['enableAudioEncouragement'],
      );

  Map<String, dynamic> toMap() => {
        'enableMicrophone': enableMicrophone,
        'enableSpeaker': enableSpeaker,
        'enableVideo': enableVideo,
        'videoIsMirroring': videoIsMirroring,
        'enableAudioEncouragement': enableAudioEncouragement,
      };
}
