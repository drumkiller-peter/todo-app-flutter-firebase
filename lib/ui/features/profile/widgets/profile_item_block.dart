import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/bloc/authentication/auth_bloc.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/constants/app_constants.dart';
import 'package:todo_app_flutter/ui/features/profile/widgets/profile_item.dart';

class ProfileItemBlock extends StatefulWidget {
  const ProfileItemBlock({Key? key}) : super(key: key);

  @override
  State<ProfileItemBlock> createState() => _ProfileItemBlockState();
}

class _ProfileItemBlockState extends State<ProfileItemBlock> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: AppConstants.profileItems.length,
        itemBuilder: (context, index) {
          return ProfileItem(
            appTileModel: AppConstants.profileItems[index],
            svgColor: index == AppConstants.profileItems.length - 1
                ? AppColor.error
                : null,
            onTap: () {
              switch (index) {
                case 0:
                  print(AppConstants.profileItems[index].title);

                  break;
                case 4:
                  context.read<AuthenticationBloc>().add(
                        AuthenticationLogoutRequested(),
                      );
                  break;
                default:
                  print(AppConstants.profileItems[index].title);
              }
            },
          );
        });
  }
}
