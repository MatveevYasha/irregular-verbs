import 'package:irregular_verbs_app/data/entities/verb.dart';

sealed class MainState {}

class LoadingMainState extends MainState {
  LoadingMainState();
}

class CounterMainState extends MainState {
  final List<Verb> listOfVerbs;
  final int count;
  final Verb? verb;

  CounterMainState({
    required this.listOfVerbs,
    required this.count,
    this.verb,
  });
}

class ErrorMainState extends MainState {
  ErrorMainState();
}
