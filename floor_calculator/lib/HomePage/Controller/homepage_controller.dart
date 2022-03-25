import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'homepage_controller.g.dart';

class HomePageController = HomePageControllerBase with _$HomePageController;

abstract class HomePageControllerBase with Store {
  @observable
  String resultLabel = 'Material necessário: m²';

  @observable
  double floorMaterial = 0;

  @observable
  String methodType = 'Simple';

  @observable
  bool isWithError = false;

  @action
  void calculateFloorMaterial(
      {required double plantWidth,
      required double plantLength,
      double? partWidth,
      double? partLength}) {
    try {
      if (methodType == 'Simple') {
        floorMaterial = _calculateSimpleMethod(
            plantWidth: plantWidth, plantLength: plantLength);

        isWithError = false;
        resultLabel = 'Material necessário: $floorMaterial m²';
      } else {
        floorMaterial = _calculateComplexMethod(
            plantWidth: plantWidth,
            plantLength: plantLength,
            partWidth: partWidth as double,
            partLength: partLength as double);
        isWithError = false;
        resultLabel = 'Material necessário: $floorMaterial m²';
      }
    } catch (e) {
      displayErrorMessage('Valores inválidos, tente novamente!');
    }
  }

  @action
  void displayErrorMessage(String errorMessage) {
    isWithError = true;
    resultLabel = errorMessage;
  }

  @action
  void setMethodType(String newMethodType) {
    methodType = newMethodType;
  }

  double _calculateSimpleMethod(
      {required double plantWidth, required double plantLength}) {
    double floorMaterial = plantLength * plantWidth * 1.35;
    return floorMaterial;
  }

  double _calculateComplexMethod(
      {required double plantWidth,
      required double plantLength,
      required double partWidth,
      required double partLength}) {
    int partsNumberWidth = _correctPartsNumber(plantWidth, partWidth);
    int partsNumberLength = _correctPartsNumber(plantLength, partLength);
    int totalPartsNumber = partsNumberWidth * partsNumberLength;
    double totalPartsArea = partWidth * partLength;
    double totalFloorMaterial = totalPartsNumber * totalPartsArea;
    return totalFloorMaterial;
  }

  int _correctPartsNumber(double plantValue, double partValue) {
    double divisionRest = plantValue % partValue;
    if (divisionRest != 0) {
      int partsNumber = (plantValue ~/ partValue) + 1;
      return partsNumber;
    } else {
      int partsNumber = plantValue ~/ partValue;
      return partsNumber;
    }
  }
}
