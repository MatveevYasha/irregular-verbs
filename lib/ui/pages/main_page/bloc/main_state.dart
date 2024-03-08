import 'dart:collection';

import 'package:irregular_verbs_app/data/entities/verb.dart';

sealed class MainState {}

class LoadingMainState extends MainState {
  LoadingMainState();
}

class InitialMainState extends MainState {
  final List<Verb> _listOfVerbs;

  InitialMainState([
    List<Verb> listOfVerbs = const <Verb>[],
  ]) : _listOfVerbs = listOfVerbs;

  List<Verb> get listOfVerbs => UnmodifiableListView(_listOfVerbs);
}

class CounterMainState extends MainState {
  final List<Verb> listOfVerbs;
  final Verb verb;
  final int count;

  CounterMainState({
    required this.listOfVerbs,
    required this.verb,
    required this.count,
  });
}

class ErrorMainState extends MainState {
  ErrorMainState();
}
