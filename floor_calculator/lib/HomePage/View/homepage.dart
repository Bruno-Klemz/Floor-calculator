import 'package:floor_calculator/LayoutConstrains/homepage_constrains.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../DesignSystem/custom_text.dart';
import '../../DesignSystem/custom_text_input.dart';
import '../Controller/homepage_controller.dart';

class HomePage extends StatelessWidget {
  HomePage(
      {Key? key,
      required this.layoutConstrains,
      required this.customText,
      required this.customTextField,
      required this.controller,
      required this.plantWidthController,
      required this.partLengthController,
      required this.partWidthController,
      required this.plantLengthController})
      : super(key: key);

  HomePageLayoutConstrains layoutConstrains;
  CustomText customText;
  CustomTextInput customTextField;
  HomePageController controller;
  TextEditingController plantWidthController;
  TextEditingController plantLengthController;
  TextEditingController partWidthController;
  TextEditingController partLengthController;

  @override
  Widget build(BuildContext context) {
    layoutConstrains.screenPadding = MediaQuery.of(context).size.height * 0.075;
    return Scaffold(
        body: SingleChildScrollView(
      physics: MediaQuery.of(context).viewInsets.bottom != 0
          ? null
          : const NeverScrollableScrollPhysics(),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xFF330076),
        child: Padding(
          padding: EdgeInsets.all(layoutConstrains.screenPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildChangeMethodTypeRow(),
              Observer(builder: (_) {
                return _mapMethodTypeToWidget();
              }),
              Column(
                children: [
                  Observer(builder: (_) {
                    return _mapFloorMaterialToText();
                  }),
                  Observer(builder: (_) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: layoutConstrains.resultTextPadding),
                      child: _buildMainButton(
                        'Calcular',
                      ),
                    );
                  })
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

  Text _mapFloorMaterialToText() {
    if (controller.floorMaterial == 0 && controller.isWithError == false) {
      return customText.buildCustomText(
          controller.resultLabel, const Color(0xFFBDBDBD), 16, FontWeight.w500);
    } else if (controller.floorMaterial == 0 &&
        controller.isWithError == true) {
      return customText.buildCustomText(
          controller.resultLabel, Colors.red, 16, FontWeight.w500);
    } else if (controller.floorMaterial != 0 &&
        controller.isWithError == true) {
      return customText.buildCustomText(
          controller.resultLabel, Colors.red, 16, FontWeight.w500);
    } else {
      return customText.buildCustomText(
          controller.resultLabel, const Color(0xFF16C5F0), 16, FontWeight.w500);
    }
  }

  Row _buildChangeMethodTypeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildChangeMethodTypeButton(
            label: 'Simplificada',
            assetName: 'assets/single_gear.png',
            key: 'Simple'),
        _buildChangeMethodTypeButton(
            label: 'Complexa',
            assetName: 'assets/multi_gear.png',
            key: 'Complex')
      ],
    );
  }

  void _resetFields() {
    plantWidthController.text = '';
    plantLengthController.text = '';
    partWidthController.text = '';
    partLengthController.text = '';
    controller.floorMaterial = 0;
    controller.isButtonActive = false;
  }

  Widget _buildChangeMethodTypeButton(
      {required String label, required String assetName, required String key}) {
    return GestureDetector(
      key: Key(key),
      onTap: () {
        _resetFields();
        controller.setMethodType(key);
      },
      child: Observer(
        builder: (_) {
          return Container(
            width: layoutConstrains.changeMethodTypeButtonWidth,
            height: layoutConstrains.changeMethodTypeButtonHeight,
            decoration: BoxDecoration(
                color: controller.methodType == key
                    ? const Color(0xFF16C5F0)
                    : Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(
                    layoutConstrains.methodTypeButtonBorderRadius))),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: layoutConstrains.methodTypeButtonElementsPadding),
                  child: Image.asset(
                    assetName,
                    width: layoutConstrains.methodTypeButtonAssetSize,
                    height: layoutConstrains.methodTypeButtonAssetSize,
                    color: controller.methodType == key
                        ? Colors.white
                        : const Color(0xFFBDBDBD),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: layoutConstrains.methodTypeButtonElementsPadding),
                    child: customText.buildCustomText(
                        label,
                        controller.methodType == key
                            ? Colors.white
                            : const Color(0xFFBDBDBD),
                        layoutConstrains.methodTypeButtonLabelFontSize,
                        FontWeight.w500)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _mapMethodTypeToWidget() {
    switch (controller.methodType) {
      case 'Complex':
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTextInputContainer(
              mainLabel: 'Planta',
              controller1: plantWidthController,
              controller2: plantLengthController,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: layoutConstrains.textInputBetweenContainersPadding),
              child: _buildTextInputContainer(
                mainLabel: 'Peça',
                controller1: partWidthController,
                controller2: partLengthController,
              ),
            ),
          ],
        );

      default:
        return _buildTextInputContainer(
          mainLabel: 'Planta',
          controller1: plantWidthController,
          controller2: plantLengthController,
        );
    }
  }

  Widget _buildTextInputContainer(
      {required String mainLabel,
      required TextEditingController controller1,
      required TextEditingController controller2}) {
    return Container(
      width: layoutConstrains.textInputContainerWidth,
      height: layoutConstrains.textInputContainerHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(layoutConstrains.textInputContainerBorderRadius),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: layoutConstrains.textInputContainerPadding),
            child: customText.buildCustomText(
                mainLabel, const Color(0xFF16C5F0), 24, FontWeight.bold),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 9.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  customText.buildCustomText(
                      'Larg', const Color(0xFF16C5F0), 18, FontWeight.w400),
                  customText.buildCustomText(
                      'Comp', const Color(0xFF16C5F0), 18, FontWeight.w400),
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(top: 22.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  customTextField.buildCustomTextInput(
                      controller: controller1,
                      textFieldHeight: layoutConstrains.textInputHeight,
                      textFieldWidth: layoutConstrains.textInputWidth,
                      key: 'Width'),
                  customTextField.buildCustomTextInput(
                      controller: controller2,
                      textFieldHeight: layoutConstrains.textInputHeight,
                      textFieldWidth: layoutConstrains.textInputWidth,
                      key: 'Length',
                      homePageController: controller)
                ]),
          ),
        ],
      ),
    );
  }

  Widget _buildMainButton(String label) {
    return SizedBox(
      width: layoutConstrains.calculateButtonWidth,
      height: layoutConstrains.calculateButtonHeight,
      child: ElevatedButton(
        onPressed: () {
          if (controller.methodType == 'Simple') {
            try {
              controller.calculateFloorMaterial(
                plantWidth: double.parse(plantWidthController.text),
                plantLength: double.parse(plantLengthController.text),
              );
            } catch (e) {
              controller.displayErrorMessage('Digite todos os campos!');
            }
          } else {
            controller.calculateFloorMaterial(
              plantWidth: double.parse(plantWidthController.text),
              plantLength: double.parse(plantLengthController.text),
              partWidth: double.parse(partWidthController.text),
              partLength: double.parse(partLengthController.text),
            );
          }
        },
        child: customText.buildCustomText(
            label, Colors.white, 24, FontWeight.w400),
        style: ElevatedButton.styleFrom(
            primary: controller.isButtonActive
                ? const Color(0xFF16C5F0)
                : const Color(0xFFBDBDBD),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  layoutConstrains.calculateButtonBorderRadius),
            )),
      ),
    );
  }
}
