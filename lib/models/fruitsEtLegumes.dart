class FruitsEtLegumes {
  int id;
  String name;
  String shortDescription;
  String portion;
  int calories;
  int vitA;
  int vitC;
  String img;

  FruitsEtLegumes(int id, String name, String shortDescription, String portion,
      int calories, int vitA, int vitC, String img) {
    this.id = id;
    this.name = name;
    this.shortDescription = shortDescription;
    this.portion = portion;
    this.calories = calories;
    this.vitA = vitA;
    this.vitC = vitC;
    this.img = img;
  }
}
