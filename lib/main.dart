import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/e_commerce_assignment8/presentation/bloc/all_items_bloc/all_items_bloc.dart';
import 'features/e_commerce_assignment8/presentation/bloc/bottom_navigation_bloc/bottom_navigation_bloc_bloc.dart';
import 'features/e_commerce_assignment8/presentation/bloc/cart_items_bloc/cart_items_bloc.dart';
import 'injection_container.dart' as dependency_injection;

import 'features/e_commerce_assignment8/presentation/screens/login_screen.dart';
import 'injection_container.dart';

void main() {
  dependency_injection.init();
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
          create: (BuildContext context) => sL<AllItemsBloc>(),
        ),
        BlocProvider<CartItemsBloc>(
          create: (BuildContext context) => sL<CartItemsBloc>(),
        ),
        BlocProvider<BottomNavigationBloc>(
          create: (BuildContext context) => sL<BottomNavigationBloc>(),
        )
      ],
      child: MaterialApp(
        home: LogInScreen(),
      ),
    );
  }
}
