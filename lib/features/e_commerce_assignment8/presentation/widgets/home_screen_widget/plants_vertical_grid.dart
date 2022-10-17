import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/color_constants.dart';
import '../../bloc/all_items_bloc/all_items_bloc.dart';
import '../item_view_widget.dart';

class PlantVerticalGrid extends StatelessWidget {
  const PlantVerticalGrid({super.key});

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
            height: 350,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: state.allItems.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 8, right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorConstants.scaffoldBackgroundColor,
                    ),
                    width: MediaQuery.of(context).size.width / 2.5,
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
