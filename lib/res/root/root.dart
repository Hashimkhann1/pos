import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/res/theme/light_theme.dart';
import 'package:pos/view/splash_view/splash_view.dart';
import 'package:pos/view_model/bloc/loading_bloc/loading_bloc/loading_bloc.dart';
import 'package:pos/view_model/bloc/store_data_bloc/store_data_bloc/store_data_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => LoadingBloc()),
          BlocProvider(create: (_) => StoreDataBloc())
        ],
        child: MaterialApp(
          title: 'Point of Sale',
          debugShowCheckedModeBanner: false,
          theme: LightTheme.lightTheme,
          home: const SplashView(),
          // home: AllProductsView(),
        )
    );
  }
}