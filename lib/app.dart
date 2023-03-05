import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places_app/features/places/presentation/cubit/places_cubit.dart';

import 'package:places_app/features/places/presentation/pages/places_responsive_page.dart';

import 'core/services/service_locator.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PlacesCubit>(
          create: (context) => sl<PlacesCubit>(),
        )
      ],
      child: MaterialApp(
          scrollBehavior: MyCustomScrollBehavior(),
          debugShowCheckedModeBanner: false,
          title: 'Places App',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
          ),
          home: const PlacesResponsivePage()),
    );
  }
}
