enum Mode {

  vague(1, 'Vague'),

  accurate(2, 'Accurate');


  const Mode(this.number, this.value);

  final int number;

  final String value;

  static Mode getTypeByTitle(String title) =>
    Mode.values.firstWhere((mode) => mode.name == title);


  static Mode getType(int number) => Mode.values.firstWhere((mode) => mode.number == number);

  static String getValue(int number) => Mode.values.firstWhere((mode) => mode.number == number).value;

}
