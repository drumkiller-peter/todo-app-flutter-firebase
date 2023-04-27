import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:video_player/video_player.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<NewVideoEvent, NewVideoState> {
  VideoBloc() : super(NewVideoInitial()) {
    on<NewVideoLoadRequested>((event, emit) async {
      emit(NewVideoLoadInProgress());
      videoController = VideoPlayerController.network(event.source);
      await videoController.initialize();
      emit(
        NewVideoSuccess(duration: videoController.value.duration),
      );
      await listenForChangesInDuration(emit);
    });

    on<NewVideoPlayPauseRequested>(_videoPlayPause);
    on<NewVideoForwardReverseRequested>(_onVideoForwardAndReverse);
    on<NewVideoSliderChanged>((event, emit) async {
      final temp = event.value * videoController.value.duration.inSeconds;
      videoController.seekTo(Duration(seconds: temp.toInt()));
      if (videoController.value.isPlaying) {
        videoController.play();
      }
      // streamController.add(await videoController.position);
    });
  }

  void _videoPlayPause(
      NewVideoPlayPauseRequested event, Emitter<NewVideoState> emit) async {
    if (videoController.value.isPlaying) {
      await videoController.pause();
    } else {
      await videoController.play();
    }
  }

  void _onVideoForwardAndReverse(NewVideoForwardReverseRequested event,
      Emitter<NewVideoState> emit) async {
    var controllerPosition = videoController.value.position;
    if (event.isForward) {
      await videoController
          .seekTo(controllerPosition + const Duration(seconds: 5));
    } else {
      await videoController
          .seekTo(controllerPosition - const Duration(seconds: 5));
    }
  }

  Future<void> listenForChangesInDuration(Emitter<NewVideoState> emit) async {
    final duration = videoController.value.duration;
    videoController.addListener(() async {
      streamController.add(await videoController.position);
    });
    await emit.forEach(
      streamController.stream,
      onData: (d) {
        final durationInSec = duration.inSeconds;
        final positionInSec = d.inSeconds;
        double progressValue = positionInSec / durationInSec;

        if (!progressValue.isNaN) {
          progress = progressValue;
        }
        return NewVideoSuccess(
          duration: duration,
          position: d,
          progress: progress,
          isPlaying: videoController.value.isPlaying,
          isBuffering: videoController.value.isBuffering,
          isComplete: progress >= 1,
        );
      },
    );
  }

  late VideoPlayerController videoController;
  StreamController streamController = StreamController();
  double progress = 0.00;

  @override
  Future<void> close() {
    streamController.close();
    videoController.dispose();
    return super.close();
  }
}
