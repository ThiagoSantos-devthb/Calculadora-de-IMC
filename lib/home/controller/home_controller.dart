import 'package:calculadora_imc/home/imc_model/person_model.dart';
import 'package:flutter/material.dart';

class HomeController{


  //
  // double weight = 0.0 ;
  // double height = 0.0;

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();



  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String infoText = "Informe seus dados!";


  void calculateImc(){
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100;

    final imc = PersonModel(height: height, weight: weight).getImc();

    if(imc < 18.6){
    infoText = "Abaixo do Peso (${imc.toStringAsPrecision(4)})";
    } else if(imc >= 18.6 && imc < 24.9){
    infoText = "Peso Ideal (${imc.toStringAsPrecision(4)})";
    } else if(imc >= 24.9 && imc < 29.9){
    infoText = "Levemente Acima do Peso (${imc.toStringAsPrecision(4)})";
    } else if(imc >= 29.9 && imc < 34.9){
    infoText = "Obesidade Grau I (${imc.toStringAsPrecision(4)})";
    } else if(imc >= 34.9 && imc < 39.9){
    infoText = "Obesidade Grau II (${imc.toStringAsPrecision(4)})";
    } else if(imc >= 40){
    infoText = "Obesidade Grau III (${imc.toStringAsPrecision(4)})";
    }
  }


  void resetFields(){

    weightController.text = "";
    heightController.text = "";

    infoText = "Informe seus dados!";
    formKey = GlobalKey<FormState>();

  }
}