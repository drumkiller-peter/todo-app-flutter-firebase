import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/bloc/create_todo/create_todo_bloc.dart';
import 'package:todo_app_flutter/configs/dependency_injection/dependency_injection.dart';
import 'package:todo_app_flutter/configs/routes/app_routes.dart';
import 'package:todo_app_flutter/configs/routes/navigator_service.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/ui/features/create_todos/widgets/custom_tile_with_switch.dart';

class MediaUploadBlock extends StatelessWidget {
  const MediaUploadBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateTodoBloc, CreateTodoState>(
      buildWhen: (previous, current) =>
          current is CreateTodoMediaUploadOnSwitchChanged ||
          current is CreateTodoMediaUploadSuccess ||
          current is CreateTodoMediaUploadLoadInProgress,
      builder: (context, state) {
        return Column(
          children: [
            CustomTileWithSwitch(
              title: "Add Media",
              onChanged: (val) {
                context
                    .read<CreateTodoBloc>()
                    .add(CreateTodoMediaUploadRequested(isEnabled: val));
              },
              value: state is CreateTodoMediaUploadOnSwitchChanged
                  ? state.isEnabled
                  : state is CreateTodoMediaUploadSuccess,
            ),
            state is CreateTodoMediaUploadSuccess
                ? InkWell(
                    onTap: () {
                      if (state.isImage) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: Image.network(state.fileUrl),
                              );
                            });
                      } else {
                        getIt.get<NavigatorService>().navigator.pushNamed(
                              AppRoutes.videoScreen,
                              arguments: state.fileUrl,
                            );
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 16),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.bgColorLight,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Text("Tap to see:\n${state.fileName}"),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        );
      },
    );
  }
}
