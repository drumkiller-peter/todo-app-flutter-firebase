// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'video_player_bloc.dart';

@immutable
abstract class VideoPlayerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class VideoPlayerInitRequested extends VideoPlayerEvent {
  final String source;
  VideoPlayerInitRequested({
    required this.source,
  });
  @override
  List<Object?> get props => [source];
}

class VideoPlayerControllerChangeRequested extends VideoPlayerEvent {
  final bool isPlaying;
  final bool isReverse10Sec;
  final bool isForward10Sec;
  VideoPlayerControllerChangeRequested({
    this.isPlaying = false,
    this.isReverse10Sec = false,
    this.isForward10Sec = false,
  });
}
