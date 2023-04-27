import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/bloc/video/video_bloc.dart';
import 'package:todo_app_flutter/configs/app_extension/duration_extension.dart';
import 'package:todo_app_flutter/ui/common/app_text.dart';
import 'package:todo_app_flutter/ui/common/loading_indicator.dart';
import 'package:video_player/video_player.dart';

class MiniVideoPlayerScreen extends StatelessWidget {
  const MiniVideoPlayerScreen({super.key, required this.source});

  final String source;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => VideoBloc()
          ..add(
            NewVideoLoadRequested(source: source),
          ),
        child: Builder(builder: (context) {
          return BlocBuilder<VideoBloc, NewVideoState>(
            builder: (context, state) {
              final videoBloc = context.read<VideoBloc>();
              return state is NewVideoSuccess
                  ? InkWell(
                      onTap: () {
                        videoBloc.add(NewVideoPlayPauseRequested());
                      },
                      child: AspectRatio(
                        aspectRatio: 16 / 12,
                        child: Stack(
                          children: [
                            VideoPlayer(
                              context.read<VideoBloc>().videoController,
                            ),
                            state.isComplete
                                ? const SizedBox()
                                : state.isBuffering
                                    ? const LoadingIndicator()
                                    : const SizedBox(),
                            Positioned(
                              bottom: 0,
                              child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.56,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            AppText(
                                              state.position
                                                      ?.getFormattedDuration() ??
                                                  '00:00',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                            AppText(
                                              state.duration
                                                      ?.getFormattedDuration() ??
                                                  '00:00',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Slider(
                                        value: state.progress ?? 0.00,
                                        onChanged: (v) {
                                          videoBloc.add(
                                            NewVideoSliderChanged(value: v),
                                          );
                                        },
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),

                      // Container(
                      //   width: MediaQuery.of(context).size.width,
                      //   alignment: Alignment.center,
                      //   color: Colors.white,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //     children: [
                      //       IconButton(
                      //         padding: const EdgeInsets.only(top: 2),
                      //         iconSize: 12,
                      //         splashRadius: 1,
                      //         onPressed: () {
                      //           videoBloc.add(NewVideoForwardReverseRequested(
                      //               isForward: false));
                      //         },
                      //         icon: const Icon(Icons.fast_rewind_outlined),
                      //       ),
                      //       IconButton(
                      //         padding: const EdgeInsets.only(top: 2),
                      //         iconSize: 12,
                      //         splashRadius: 1,
                      //         onPressed: () {
                      //           videoBloc.add(NewVideoPlayPauseRequested());
                      //         },
                      //         icon: Icon(
                      //           state.isPlaying!
                      //               ? Icons.pause
                      //               : Icons.play_arrow,
                      //           color: AppColor.primary,
                      //         ),
                      //       ),
                      //       IconButton(
                      //         padding: const EdgeInsets.only(top: 2),
                      //         iconSize: 12,
                      //         splashRadius: 1,
                      //         onPressed: () {
                      //           videoBloc.add(NewVideoForwardReverseRequested(
                      //               isForward: true));
                      //         },
                      //         icon: const Icon(Icons.fast_forward),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    )
                  : const AppText("No video");
            },
          );
        }),
      ),
    );
  }
}
