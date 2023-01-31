import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/bloc/authentication/auth_bloc.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/gen/assets.gen.dart';
import 'package:todo_app_flutter/ui/common/app_button.dart';
import 'package:todo_app_flutter/ui/common/app_text.dart';
import 'package:todo_app_flutter/ui/features/profile/widgets/profile_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: kToolbarHeight,
        ),
        CircleAvatar(
          radius: 45,
          backgroundColor: AppColor.bgColorDarker,
          backgroundImage: Assets.images.png.karyaLogo.image().image,
        ),
        const AppText("Peter BNk"),
        const SizedBox(
          height: kToolbarHeight,
        ),
        Expanded(
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return const ProfileItem();
              }),
        ),
        AppPrimaryButton(
          title: "Logout",
          isEnabled: true,
          onPressed: () => context.read<AuthenticationBloc>().add(
                AuthenticationLogoutRequested(),
              ),
        )
      ],
    );
  }
}
