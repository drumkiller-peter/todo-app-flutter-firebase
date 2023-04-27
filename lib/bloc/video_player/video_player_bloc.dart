import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:video_player/video_player.dart';

part 'video_player_event.dart';
part 'video_player_state.dart';

class VideoPlayerBloc extends Bloc<VideoPlayerEvent, VideoPlayerState> {
  VideoPlayerBloc() : super(VideoPlayerInitial()) {
    on<VideoPlayerInitRequested>((event, emit) {
      emit(VideoPlayerLoadInProgress());
      controller = VideoPlayerController.network(event.source);
      controller.initialize();
      controller.play();
      emit((VideoPlayerSuccess(
        videoPlayerController: controller,
        wholeDuration: controller.value.duration,
        isPlaying: controller.value.isPlaying,
        progressDuration: controller.value.position,
        progress: progress,
        isCompleted: false,
      )));
      listenForChangeInTimer(emit);
    });

    on<VideoPlayerControllerChangeRequested>(_handleControllerStateChange);
  }

  _handleControllerStateChange(VideoPlayerControllerChangeRequested event,
      Emitter<VideoPlayerState> emit) {
    emit(VideoPlayerInitial());
    print(controller.value.duration);
    print(controller.value.position);
    wholeDuration = controller.value.duration.inMilliseconds.toDouble();
    currentPlayPosition = controller.value.position.inMilliseconds.toDouble();

    final progressValue = currentPlayPosition / wholeDuration;
    if (!progressValue.isNaN) {
      progress = progressValue.toDouble();
    }
    emit((VideoPlayerSuccess(
      videoPlayerController: controller,
      wholeDuration: controller.value.duration,
      isPlaying: controller.value.isPlaying,
      progressDuration: controller.value.position,
      progress: progress,
      isCompleted: false,
    )));
  }

  late VideoPlayerController controller;

  void listenForChangeInTimer(Emitter<VideoPlayerState> emit) {
    controller.addListener(() {
      wholeDuration = controller.value.duration.inMilliseconds.toDouble();
      currentPlayPosition = controller.value.position.inMilliseconds.toDouble();
      ((VideoPlayerSuccess(
        videoPlayerController: controller,
        wholeDuration: controller.value.duration,
        isPlaying: controller.value.isPlaying,
        progressDuration: controller.value.position,
        progress: progress,
        isCompleted: false,
      )));
    });
  }

  double currentPlayPosition = 0.0;
  double wholeDuration = 0.0;
  double progress = 0.00;

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
