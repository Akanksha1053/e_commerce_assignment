import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/navigation_constants.dart';

part 'bottom_navigation_bloc_event.dart';
part 'bottom_navigation_bloc_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(BottomNavigationInitial(NavbarItem.home, 0)) {
    on<SelectBottomNavigationEvent>((event, emit) {
      switch (event.navbarItem) {
        case NavbarItem.home:
          emit(const BottomNavigationLoaded(NavbarItem.home, 0));
          break;
        case NavbarItem.cart:
          emit(const BottomNavigationLoaded(NavbarItem.cart, 1));
          break;
        case NavbarItem.orders:
          emit(const BottomNavigationLoaded(NavbarItem.orders, 2));
          break;
        case NavbarItem.wallet:
          emit(const BottomNavigationLoaded(NavbarItem.wallet, 3));
          break;
        case NavbarItem.profile:
          emit(const BottomNavigationLoaded(NavbarItem.profile, 4));
          break;
      }
    });
  }
}
