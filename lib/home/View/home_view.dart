import 'package:calculadora_imc/colors/colors_home.dart';
import 'package:calculadora_imc/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  final controller = HomeController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: mainBackgroundColor,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            color: iconRefreshColor,
            onPressed: (){
              setState(() {
              controller.resetFields();
            });}
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Icon(Icons.person_outline, size: 120.0, color: iconPersonColor),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Peso (kg)",
                    labelStyle: TextStyle(color: labelTextFieldColor)),
                textAlign: TextAlign.center,
                style: const TextStyle(color: textFieldColor, fontSize: 25.0),
                controller: controller.weightController,
                validator:(value){
                  if(value!.isEmpty){
                    return "Insira seu Peso!";
                   }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Altura (cm)",
                    labelStyle: TextStyle(color: labelTextFieldColor)),
                textAlign: TextAlign.center,
                style: const TextStyle(color: textFieldColor, fontSize: 25.0),
                controller:controller.heightController,
                validator: (value) {
                  if(value!.isEmpty){
                    return "Insira sua Altura!";
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if(controller.formKey.currentState!.validate()){
                         controller.calculateImc();
                        }
                      });

                    },
                    child: const Text(
                      "Calcular",
                      style: TextStyle(color: textButtonCalculateColor, fontSize: 25.0),
                    ),
                   style: ElevatedButton.styleFrom(primary: buttonCalculateColor),
                  ),
                ),
              ),
              Text(
                controller.infoText,
                textAlign: TextAlign.center,
                style: const TextStyle(color: textResultColor, fontSize: 25.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
