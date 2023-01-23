import 'package:flutter/material.dart';
import 'package:todo_app_flutter/configs/dependency_injection/dependency_injection.dart';
import 'package:todo_app_flutter/configs/routes/navigator_service.dart';
import 'package:todo_app_flutter/configs/routes/routes.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/ui/common/app_text.dart';
import 'package:todo_app_flutter/ui/features/home/widgets/events_list_item.dart';
import 'package:todo_app_flutter/ui/features/home/widgets/hero_block.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    return Scaffold(
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: AppText(
                "Upcoming tasks",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: AppColor.white),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => const EventsItem(),
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}
