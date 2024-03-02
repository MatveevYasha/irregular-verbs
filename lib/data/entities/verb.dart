enum DifficultyLevel { easy, medium, hard }

class Verb {
  // The first form of the verb
  final String baseForm;

  // The second form of the verb
  final String pastSimple;

  // The third form of the verb
  final String pastParticiple;

  // Translation on choose language
  final String translation;

  // TODO: Сделать в следующих версиях
  // Is it necessary to repeat this verb, or have you already learned it
  // final bool isRepeat;

  // How much do the verb forms differ from each other
  // final DifficultyLevel difficultyLevel;

  Verb({
    required this.baseForm,
    required this.pastSimple,
    required this.pastParticiple,
    required this.translation,
  });
}
