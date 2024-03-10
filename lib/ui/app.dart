import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irregular_verbs_app/ui/pages/main_page/bloc/main_bloc.dart';
import 'package:irregular_verbs_app/ui/pages/main_page/bloc/main_event.dart';
import 'package:irregular_verbs_app/ui/pages/main_page/main_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => MainBloc()..add(InitialMainEvent()),
        child: const MainPage(),
      ),
    );
  }
}
