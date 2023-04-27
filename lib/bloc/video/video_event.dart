// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'video_bloc.dart';

@immutable
abstract class NewVideoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class NewVideoLoadRequested extends NewVideoEvent {
  final String source;
  NewVideoLoadRequested({
    required this.source,
  });

  @override
  List<Object?> get props => [source];
}

class NewVideoPlayPauseRequested extends NewVideoEvent {}

class NewVideoForwardReverseRequested extends NewVideoEvent {
  final bool isForward;
  NewVideoForwardReverseRequested({
    required this.isForward,
  });

  @override
  List<Object?> get props => [isForward];
}

class NewVideoSliderChanged extends NewVideoEvent {
  final double value;
  NewVideoSliderChanged({
    required this.value,
  });

  @override
  List<Object?> get props => [value];
}
