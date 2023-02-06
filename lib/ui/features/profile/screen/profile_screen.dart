import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/bloc/profile/profile_bloc.dart';
import 'package:todo_app_flutter/data/repository/authentication_repository.dart';
import 'package:todo_app_flutter/data/repository/profile_repository.dart';
import 'package:todo_app_flutter/ui/features/profile/widgets/image_and_name_block.dart';
import 'package:todo_app_flutter/ui/features/profile/widgets/percentage_block.dart';
import 'package:todo_app_flutter/ui/features/profile/widgets/profile_item_block.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(
        context.read<AuthenticationRepository>(),
        context.read<ProfileRepository>(),
      )..add(ProfileDataRequested()),
      child: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(
              height: kToolbarHeight,
            ),
            ImageAndNameBlock(),
            SizedBox(
              height: kToolbarHeight,
            ),
            PercentageBlock(),
            ProfileItemBlock(),
          ],
        ),
      ),
    );
  }
}
