import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:todo_app_flutter/bloc/dashboard/dashboard_bloc.dart';
import 'package:todo_app_flutter/ui/features/dashboard/widgets/empty_events_block.dart';
import 'package:todo_app_flutter/ui/features/dashboard/widgets/event_card.dart';

class EventSwiperItem extends StatelessWidget {
  const EventSwiperItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      buildWhen: (previous, current) => current is DashboardSuccess,
      builder: (context, state) {
        return Expanded(
          child: FutureBuilder(
            future: Future.delayed(
              const Duration(milliseconds: 100),
            ),
            builder: (context, snapshot) {
              return snapshot.connectionState != ConnectionState.done
                  ? const SizedBox()
                  : state is DashboardSuccess &&
                          state.allTodosForToday.isNotEmpty
                      ? CardSwiper(
                          maxAngle: 90,
                          isLoop: true,
                          numberOfCardsDisplayed: state.allTodosForToday.length,
                          isDisabled: state.allTodosForToday.length == 1,
                          padding: const EdgeInsets.only(top: 0, bottom: 36),
                          cards: state.allTodosForToday
                              .map(
                                (e) => EventCard(
                                  itemIndex: state.allTodosForToday
                                          .indexOf(e)
                                          .toInt() +
                                      1,
                                  todoModel: e,
                                  totalTodos: state.allTodosForToday.length,
                                ),
                              )
                              .toList()
                              .reversed
                              .toList(),
                        )
                      : const EmptyEventBlock();
            },
          ),
        );
      },
    );
  }
}
