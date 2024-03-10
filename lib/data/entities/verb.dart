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

  Verb({
    required this.baseForm,
    required this.pastSimple,
    required this.pastParticiple,
    required this.translation,
  });
}
