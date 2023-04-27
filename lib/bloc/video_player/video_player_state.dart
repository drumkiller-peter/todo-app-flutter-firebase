// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'video_player_bloc.dart';

@immutable
class VideoPlayerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class VideoPlayerInitial extends VideoPlayerState {}

class VideoPlayerLoadInProgress extends VideoPlayerState {}

class VideoPlayerFailure extends VideoPlayerState {}

class VideoPlayerSuccess extends VideoPlayerState {
  final VideoPlayerController videoPlayerController;
  final Duration? wholeDuration;
    final Duration? progressDuration;
  final double progress;
  final bool? isCompleted;
  final bool isPlaying;
  VideoPlayerSuccess({
    required this.videoPlayerController,
    this.wholeDuration,
    this.progressDuration,
    required this.progress,
    this.isCompleted,
    required this.isPlaying,
  });

  @override
  List<Object?> get props => [
        videoPlayerController,
        wholeDuration,
      ];
}

// class VideoPlayerControllerStateChange extends VideoPlayerState {
//   final Duration? progressDuration;
//   final double progress;
//   final bool? isCompleted;
//   final bool isPlaying;
//   VideoPlayerControllerStateChange({
//     this.progressDuration,
//     required this.progress,
//     this.isCompleted,
//     required this.isPlaying,
//   });

//   @override
//   List<Object?> get props =>
//       [progressDuration, progress, isCompleted, isPlaying];
// }
