import 'package:irregular_verbs_app/data/entities/verb.dart';

sealed class MainEvent {}

class InitialMainEvent extends MainEvent {}

// class StartLearningMainEvent extends MainEvent {
//   final List<Verb> listOfVerbs;

//   StartLearningMainEvent({required this.listOfVerbs});
// }

class GetNextWordMainEvent extends MainEvent {
  final List<Verb> listOfVerbs;
  final Verb? verb;
  final int count;

  GetNextWordMainEvent({
    required this.listOfVerbs,
    required this.count,
    this.verb,
  });
}
