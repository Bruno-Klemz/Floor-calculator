// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homepage_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomePageController on HomePageControllerBase, Store {
  final _$resultLabelAtom = Atom(name: 'HomePageControllerBase.resultLabel');

  @override
  String get resultLabel {
    _$resultLabelAtom.reportRead();
    return super.resultLabel;
  }

  @override
  set resultLabel(String value) {
    _$resultLabelAtom.reportWrite(value, super.resultLabel, () {
      super.resultLabel = value;
    });
  }

  final _$floorMaterialAtom =
      Atom(name: 'HomePageControllerBase.floorMaterial');

  @override
  double get floorMaterial {
    _$floorMaterialAtom.reportRead();
    return super.floorMaterial;
  }

  @override
  set floorMaterial(double value) {
    _$floorMaterialAtom.reportWrite(value, super.floorMaterial, () {
      super.floorMaterial = value;
    });
  }

  final _$methodTypeAtom = Atom(name: 'HomePageControllerBase.methodType');

  @override
  String get methodType {
    _$methodTypeAtom.reportRead();
    return super.methodType;
  }

  @override
  set methodType(String value) {
    _$methodTypeAtom.reportWrite(value, super.methodType, () {
      super.methodType = value;
    });
  }

  final _$isWithErrorAtom = Atom(name: 'HomePageControllerBase.isWithError');

  @override
  bool get isWithError {
    _$isWithErrorAtom.reportRead();
    return super.isWithError;
  }

  @override
  set isWithError(bool value) {
    _$isWithErrorAtom.reportWrite(value, super.isWithError, () {
      super.isWithError = value;
    });
  }

  final _$HomePageControllerBaseActionController =
      ActionController(name: 'HomePageControllerBase');

  @override
  void calculateFloorMaterial(
      {required double plantWidth,
      required double plantLength,
      double? partWidth,
      double? partLength}) {
    final _$actionInfo = _$HomePageControllerBaseActionController.startAction(
        name: 'HomePageControllerBase.calculateFloorMaterial');
    try {
      return super.calculateFloorMaterial(
          plantWidth: plantWidth,
          plantLength: plantLength,
          partWidth: partWidth,
          partLength: partLength);
    } finally {
      _$HomePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void displayErrorMessage(String errorMessage) {
    final _$actionInfo = _$HomePageControllerBaseActionController.startAction(
        name: 'HomePageControllerBase.displayErrorMessage');
    try {
      return super.displayErrorMessage(errorMessage);
    } finally {
      _$HomePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMethodType(String newMethodType) {
    final _$actionInfo = _$HomePageControllerBaseActionController.startAction(
        name: 'HomePageControllerBase.setMethodType');
    try {
      return super.setMethodType(newMethodType);
    } finally {
      _$HomePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
resultLabel: ${resultLabel},
floorMaterial: ${floorMaterial},
methodType: ${methodType},
isWithError: ${isWithError}
    ''';
  }
}
