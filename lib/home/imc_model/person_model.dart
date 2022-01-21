class PersonModel{

  final double weight;
  final double height;

  PersonModel({required this.height, required this.weight});

  double getImc(){
    return weight / (height * height);
  }

}