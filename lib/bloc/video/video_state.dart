// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'video_bloc.dart';

class NewVideoState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NewVideoInitial extends NewVideoState {}

class NewVideoLoadInProgress extends NewVideoState {}

class NewVideoFailure extends NewVideoState {}

class NewVideoPlayPauseState extends NewVideoState {
  final bool isPlaying;
  NewVideoPlayPauseState({
    required this.isPlaying,
  });

  @override
  List<Object?> get props => [isPlaying];
}

class NewVideoSuccess extends NewVideoState {
  final Duration? duration;
  final Duration? position;
  final double? progress;
  final bool? isPlaying;
  final bool isBuffering;
  final bool isComplete;

  NewVideoSuccess({
    this.duration,
    this.position,
    this.progress,
    this.isPlaying = false,
    this.isBuffering = false,
    this.isComplete = false,
  });

  @override
  List<Object?> get props => [duration, position, progress];
}
