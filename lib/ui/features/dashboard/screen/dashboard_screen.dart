import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/bloc/dashboard/dashboard_bloc.dart';
import 'package:todo_app_flutter/configs/dependency_injection/dependency_injection.dart';
import 'package:todo_app_flutter/configs/enum/app_enum.dart';
import 'package:todo_app_flutter/configs/routes/navigator_service.dart';
import 'package:todo_app_flutter/configs/routes/app_routes.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/data/repository/authentication_repository.dart';
import 'package:todo_app_flutter/data/repository/todo_repository.dart';
import 'package:todo_app_flutter/ui/common/app_snackbar.dart';
import 'package:todo_app_flutter/ui/common/app_text.dart';
import 'package:todo_app_flutter/ui/common/loading_indicator.dart';
import 'package:todo_app_flutter/ui/features/dashboard/widgets/events_list_item.dart';
import 'package:todo_app_flutter/ui/features/dashboard/widgets/hero_block.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final ScrollController scrollController;
  bool showTitle = false;
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset > 210.0) {
        setState(() {
          showTitle = true;
        });
      } else {
        setState(() {
          showTitle = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc(
        context.read<TodoRepository>(),
        context.read<AuthenticationRepository>(),
      )..add(DashboardEventGetTodoRequested()),
      child: Builder(builder: (context) {
        return BlocListener<DashboardBloc, DashboardState>(
          listenWhen: (previous, current) => current is DashboardFailure,
          listener: (context, state) {
            if (state is DashboardFailure) {
              AppSnackBar.showSnackbar(context, state.error, MessageType.error);
            }
          },
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.cyan,
              onPressed: () {
                getIt.get<NavigatorService>().navigator.pushNamed(
                      AppRoutes.createTodo,
                    );
              },
              child: const Icon(
                Icons.add,
                size: 32,
              ),
            ),
            body: CustomScrollView(
              controller: scrollController,
              slivers: [
                HeroBlock(
                  showTitle: showTitle,
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 32,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: AppText(
                      "Upcoming tasks",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(color: AppColor.white),
                    ),
                  ),
                ),
                BlocBuilder<DashboardBloc, DashboardState>(
                  buildWhen: (previous, current) =>
                      current is DashboardLoadInProgress ||
                      current is DashboardSuccess ||
                      current is DashboardFailure,
                  builder: (context, state) {
                    return state is DashboardLoadInProgress
                        ? const SliverToBoxAdapter(child: LoadingIndicator())
                        : state is DashboardSuccess
                            ? SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (context, index) => EventsItem(
                                    todoModel: state.todoModelList[index],
                                  ),
                                  childCount: state.todoModelList.length,
                                ),
                              )
                            : const SliverToBoxAdapter(child: SizedBox());
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
