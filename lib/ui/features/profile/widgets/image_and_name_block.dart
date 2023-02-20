import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/bloc/profile/profile_bloc.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/constants/app_constants.dart';
import 'package:todo_app_flutter/ui/common/app_text.dart';

class ImageAndNameBlock extends StatelessWidget {
  const ImageAndNameBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Column(
          children: [
            CircleAvatar(
              radius: 45,
              backgroundColor: AppColor.bgColorDarker,
              backgroundImage: CachedNetworkImageProvider(
                state is ProfileSuccess
                    ? state.userModel.profilePicture ?? AppConstants.dummyImage
                    : AppConstants.dummyImage,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            AppText(state is ProfileSuccess ? state.userModel.fullName : ""),
            AppText(state is ProfileSuccess ? state.userModel.email : ""),
          ],
        );
      },
    );
  }
}
