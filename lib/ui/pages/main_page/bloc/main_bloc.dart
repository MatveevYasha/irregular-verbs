import 'dart:math';

import 'package:irregular_verbs_app/data/provider/fetch_data_provider.dart';
import 'package:irregular_verbs_app/ui/pages/main_page/bloc/main_event.dart';
import 'package:irregular_verbs_app/ui/pages/main_page/bloc/main_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(LoadingMainState()) {
    on<MainEvent>(
      (event, emit) => switch (event) {
        final InitialMainEvent event => _initial(event, emit),
        final GetOneVerbMainEvent event => _getOneVerb(event, emit),
        final StartLearningMainEvent event => _startLearning(event, emit),
      },
    );
  }

  void _initial(InitialMainEvent event, Emitter<MainState> emit) async {
    try {
      final listOfVerbs = await FetchDataProvider().fetchFileFromAssets();

      emit(InitialMainState(listOfVerbs));
    } catch (e) {
      emit(ErrorMainState());
    }
  }

  void _getOneVerb(GetOneVerbMainEvent event, Emitter<MainState> emit) {
    // final rnd = Random();

    // final verbNumber = rnd.nextInt(event.listOfVerbs.length);

    // final verb = event.listOfVerbs[verbNumber];

    // emit(CounterMainState(verb: verb, listOfVerbs: event.listOfVerbs, count: 1));
  }

  void _startLearning(StartLearningMainEvent event, Emitter<MainState> emit) {
    final rnd = Random();

    final verbNumber = rnd.nextInt(event.listOfVerbs.length);

    final verb = event.listOfVerbs[verbNumber];

    emit(CounterMainState(listOfVerbs: event.listOfVerbs, verb: verb, count: 1));
  }

  // void _getNextWord(GetNextWordMainEvent event, Emitter<MainState> emit) {
  // if (event.count < 4) {
  //   emit(GetNextWordMainState(verb: event.verb, count: event.count + 1));
  // } else {
  //   emit(GetNextWordMainState(verb: event.verb, count: event.count + 1));
  // }
  // }
}
