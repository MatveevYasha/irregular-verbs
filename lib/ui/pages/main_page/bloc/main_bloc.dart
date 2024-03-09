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
        final GetNextWordMainEvent event => _getNextWord(event, emit),
        // final StartLearningMainEvent event => _startLearning(event, emit),
      },
    );
  }

  void _initial(InitialMainEvent event, Emitter<MainState> emit) async {
    try {
      final listOfVerbs = await FetchDataProvider().fetchFileFromAssets();

      emit(CounterMainState(listOfVerbs: listOfVerbs, count: 0));
    } catch (e) {
      emit(ErrorMainState());
    }
  }

  void _getNextWord(GetNextWordMainEvent event, Emitter<MainState> emit) {
    if (event.count < 4 && event.count != 0) {
      emit(CounterMainState(verb: event.verb!, listOfVerbs: event.listOfVerbs, count: event.count + 1));
    } else {
      final rnd = Random();

      final verbNumber = rnd.nextInt(event.listOfVerbs.length);

      final verb = event.listOfVerbs[verbNumber];

      emit(CounterMainState(verb: verb, listOfVerbs: event.listOfVerbs, count: 1));
    }
  }

  // void _startLearning(StartLearningMainEvent event, Emitter<MainState> emit) {
  //   final rnd = Random();

  //   final verbNumber = rnd.nextInt(event.listOfVerbs.length);

  //   final verb = event.listOfVerbs[verbNumber];

  //   emit(CounterMainState(listOfVerbs: event.listOfVerbs, verb: verb, count: 1));
  // }
}
