import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irregular_verbs_app/data/entities/verb.dart';

import 'package:irregular_verbs_app/data/provider/fetch_data_provider.dart';
import 'package:irregular_verbs_app/ui/pages/main_page/bloc/main_bloc.dart';
import 'package:irregular_verbs_app/ui/pages/main_page/bloc/main_event.dart';
import 'package:irregular_verbs_app/ui/pages/main_page/bloc/main_state.dart';
import 'package:irregular_verbs_app/ui/pages/main_page/widgets/divider_widget.dart';
import 'package:irregular_verbs_app/ui/pages/main_page/widgets/text_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<MainBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Irregular Verbs'),
        centerTitle: true,
      ),
      body: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return switch (state) {
            LoadingMainState() => const CircularProgressIndicator(),
            InitialMainState() => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Click on the button to start!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          bloc.add(StartLearningMainEvent(listOfVerbs: state.listOfVerbs));
                        },
                        child: const Text('Start'))
                  ],
                ),
              ),
            CounterMainState() => SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextWidget(
                      number: 1,
                      title: state.verb.baseForm,
                      wordNumber: 1,
                    ),
                    const DividerWidget(),
                    TextWidget(
                      number: 2,
                      title: state.verb.pastSimple,
                      wordNumber: 2,
                    ),
                    const DividerWidget(),
                    TextWidget(
                      number: 3,
                      title: state.verb.pastParticiple,
                      wordNumber: 3,
                    ),
                    const DividerWidget(),
                    TextWidget(
                      number: 4,
                      title: state.verb.translation,
                      wordNumber: 4,
                    ),
                    const SizedBox(height: 100),
                    FloatingActionButton(
                      onPressed: () {
                        bloc.add(GetOneVerbMainEvent(
                          listOfVerbs: state.listOfVerbs,
                          verb: state.verb,
                          count: state.count,
                        ));
                      },
                    ),
                  ],
                ),
              ),
            ErrorMainState() => const Center(
                child: Text(
                  'An error has occurred, try restarting the application',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
          };
        },
      ),
    );
  }
}
