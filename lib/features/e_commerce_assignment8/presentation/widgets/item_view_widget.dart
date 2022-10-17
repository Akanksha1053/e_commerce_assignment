import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/textstyle_constants.dart';
import '../bloc/all_items_bloc/all_items_bloc.dart';

class ItemViewWidget extends StatelessWidget {
  const ItemViewWidget({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllItemsBloc, AllItemsState>(
      builder: (context, state) {
        if ((state is AllItemsInitial)) {
          BlocProvider.of<AllItemsBloc>(context).add(FetchAllItemsEvent());
          return const Center(child: CircularProgressIndicator());
        } else {
          BlocProvider.of<AllItemsBloc>(context).add(FetchAllItemsEvent());
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorConstants.imageContainerColor),
                      height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.width / 1.8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                            (state as AllItemsLoadedState)
                                .allItems[index]
                                .plantImage,
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      left: 130,
                      top: 0,
                      right: 0,
                      child: IconButton(
                          onPressed: () {
                            BlocProvider.of<AllItemsBloc>(context)
                                .add(OnTapEvent(item: (state).allItems[index]));
                          },
                          icon: Icon(
                            key:
                                Key('heart_${state.allItems[index].plantName}'),
                            state.allItems[index].isAddedToCart
                                ? Icons.favorite_sharp
                                : Icons.favorite_outline,
                            color: state.allItems[index].isAddedToCart
                                ? Colors.red
                                : ColorConstants.favouriteIconColor,
                            size: 30,
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      (state).allItems[index].plantName,
                      style: plantNameTextStyle,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.star_half,
                          color: ColorConstants.starRatingIconColor,
                        ),
                        Text((state).allItems[index].rating.toString()),
                        const Text('  |'),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 5,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: ColorConstants
                                        .totalPlantsSoldContainerColor,
                                    width: 2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    (state)
                                        .allItems[index]
                                        .plantsSold
                                        .toString(),
                                    style: plantsSoldTextStyle),
                                const Text(' Sold', style: plantsSoldTextStyle)
                              ],
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      '\$${(state).allItems[index].price.toString()}',
                      style: plantsPriceTextStyle,
                    )
                  ],
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
