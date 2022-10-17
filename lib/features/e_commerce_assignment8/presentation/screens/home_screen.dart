import 'package:flutter/material.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/text_constants.dart';
import '../widgets/home_screen_widget/filter_widget.dart';
import '../widgets/home_screen_widget/horizontal_item_list_widget.dart';
import '../widgets/home_screen_widget/menu_screen_appbar_widget.dart';
import '../widgets/home_screen_widget/menu_screen_search_widget.dart';
import '../widgets/home_screen_widget/offers_filter_widget.dart';
import '../widgets/home_screen_widget/plants_vertical_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.appbarBackgroundColor,
        elevation: 0,
        toolbarHeight: 90,
        flexibleSpace: Container(
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [MenuScreenAppBar()],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            MenuScreenSearch(),
            OffersAndFilterWidget(offerText: specialOfferText),
            HorizontalItemListWidget(),
            OffersAndFilterWidget(offerText: mostPopularOfferText),
            FilterWidget(),
            PlantVerticalGrid(),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
