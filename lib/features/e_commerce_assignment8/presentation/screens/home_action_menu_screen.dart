import 'package:e_commerce_assignment8/core/constants/color_constants.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/presentation/bloc/bottom_navigation_bloc/bottom_navigation_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/navigation_constants.dart';

import 'cart_item_screen.dart';
import 'home_screen.dart';

class HomeActionMenuScreen extends StatelessWidget {
  const HomeActionMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.scaffoldBackgroundColor,
        body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
            builder: (context, state) {
          if (state is BottomNavigationLoaded) {
            if (state.navbarItem == NavbarItem.home) {
              return const HomeScreen();
            } else if (state.navbarItem == NavbarItem.cart) {
              return const CartItemsScreen();
            } else if (state.navbarItem == NavbarItem.orders) {
              return const HomeScreen();
            } else if (state.navbarItem == NavbarItem.wallet) {
              return const HomeScreen();
            } else if (state.navbarItem == NavbarItem.profile) {
              return const HomeScreen();
            }
            return Container();
          } else {
            BlocProvider.of<BottomNavigationBloc>(context)
                .add(const SelectBottomNavigationEvent(NavbarItem.home, 0));
            return const Center(child: CircularProgressIndicator());
          }
        }),
        bottomNavigationBar:
            BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          builder: (context, state) {
            if (state is BottomNavigationLoaded) {
              return BottomNavigationBar(
                  onTap: (index) {
                    if (index == 0) {
                      BlocProvider.of<BottomNavigationBloc>(context).add(
                          const SelectBottomNavigationEvent(
                              NavbarItem.home, 0));
                    } else if (index == 1) {
                      BlocProvider.of<BottomNavigationBloc>(context).add(
                          const SelectBottomNavigationEvent(
                              NavbarItem.cart, 1));
                    } else if (index == 2) {
                      BlocProvider.of<BottomNavigationBloc>(context).add(
                          const SelectBottomNavigationEvent(
                              NavbarItem.orders, 1));
                    } else if (index == 3) {
                      BlocProvider.of<BottomNavigationBloc>(context).add(
                          const SelectBottomNavigationEvent(
                              NavbarItem.wallet, 3));
                    } else if (index == 4) {
                      BlocProvider.of<BottomNavigationBloc>(context).add(
                          const SelectBottomNavigationEvent(
                              NavbarItem.profile, 4));
                    }
                  },
                  currentIndex: (state).index,
                  elevation: 0,
                  showUnselectedLabels: true,
                  backgroundColor: ColorConstants.scaffoldBackgroundColor,
                  selectedItemColor: ColorConstants.plantsSoldTextColor,
                  unselectedItemColor: Colors.grey,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.shopping_bag_outlined,
                        ),
                        label: 'Cart'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.shopping_cart_outlined),
                        label: 'Orders'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.wallet_outlined), label: 'Wallet'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person_outline), label: 'Profile')
                  ]);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
