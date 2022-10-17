import 'package:e_commerce_assignment8/features/e_commerce_assignment8/presentation/widgets/item_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/color_constants.dart';
import '../../bloc/all_items_bloc/all_items_bloc.dart';

class HorizontalItemListWidget extends StatelessWidget {
  const HorizontalItemListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllItemsBloc, AllItemsState>(
      builder: (context, state) {
        if (state is AllItemsInitial) {
          BlocProvider.of<AllItemsBloc>(context).add(FetchAllItemsEvent());
          return const Center(child: CircularProgressIndicator());
        }
        if (state is AllItemsLoadedState) {
          return Container(
            margin: const EdgeInsets.only(top: 8, left: 16, right: 16),
            height: MediaQuery.of(context).size.height / 2.2,
            child: ListView.builder(
              itemCount: state.allItems.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 8, right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorConstants.scaffoldBackgroundColor,
                    ),
                    width: MediaQuery.of(context).size.width / 2,
                    child: ItemViewWidget(index: index),
                  ),
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
