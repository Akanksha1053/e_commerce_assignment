import 'package:e_commerce_assignment8/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/e_commerce_assignment8/presentation/bloc/all_items_bloc/all_items_bloc.dart';
import 'features/e_commerce_assignment8/presentation/bloc/bottom_navigation_bloc/bottom_navigation_bloc_bloc.dart';
import 'features/e_commerce_assignment8/presentation/bloc/cart_items_bloc/cart_items_bloc.dart';
import 'injection_container.dart' as dependency_injection;

import 'features/e_commerce_assignment8/presentation/screens/login_screen.dart';
import 'injection_container.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

void main() {
  dependency_injection.init();
  Injector.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AllItemsBloc>(
          create: (BuildContext context) => kiwi.KiwiContainer().resolve<AllItemsBloc>(),
        ),
        BlocProvider<CartItemsBloc>(
          create: (BuildContext context) => kiwi.KiwiContainer().resolve<CartItemsBloc>(),
        ),
        BlocProvider<BottomNavigationBloc>(
          create: (BuildContext context) => kiwi.KiwiContainer().resolve<BottomNavigationBloc>(),
        )
      ],
      child: MaterialApp(
        home: LogInScreen(),
      ),
    );
  }
}
