import 'package:floor_calculator/LayoutConstrains/homepage_constrains.dart';
import 'package:flutter/material.dart';

import '../DesignSystem/CustomText.dart';
import '../DesignSystem/CustomTextInput.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final layoutConstrains = HomePageLayoutConstrains();
  final isSimpleMethodPressed = false;
  final customText = CustomText();
  final customTextField = CustomTextInput();

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
              _mapMethodTypeToWidget(
                  isSimpleMethodPressed: isSimpleMethodPressed),
              _buildMainButton('Calcular', const Color(0xFF16C5F0))
            ],
          ),
        ),
      ),
    ));
  }

  Row _buildChangeMethodTypeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildChangeMethodTypeButton(
            label: 'Simplificada',
            assetName: 'assets/single_gear.png',
            isPressed: isSimpleMethodPressed),
        _buildChangeMethodTypeButton(
            label: 'Complexa',
            assetName: 'assets/multi_gear.png',
            isPressed: !isSimpleMethodPressed)
      ],
    );
  }

  Widget _buildChangeMethodTypeButton(
      {required String label,
      required String assetName,
      required bool isPressed}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: layoutConstrains.changeMethodTypeButtonWidth,
        height: layoutConstrains.changeMethodTypeButtonHeight,
        decoration: BoxDecoration(
            color: isPressed ? const Color(0xFF16C5F0) : Colors.white,
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
                color: isPressed ? Colors.white : const Color(0xFFBDBDBD),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: layoutConstrains.methodTypeButtonElementsPadding),
                child: customText.buildCustomText(
                    label,
                    isPressed ? Colors.white : const Color(0xFFBDBDBD),
                    layoutConstrains.methodTypeButtonLabelFontSize,
                    FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  Widget _mapMethodTypeToWidget({required bool isSimpleMethodPressed}) {
    final controllerModel = HomePageControllerModel();
    switch (isSimpleMethodPressed) {
      case false:
        Map<String, TextEditingController> controllerMap = controllerModel
            .getControllerMap(isSimpleMethodPressed: isSimpleMethodPressed);
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTextInputContainer(
              mainLabel: 'Planta',
              controller1: controllerMap['plantWidth'] as TextEditingController,
              controller2:
                  controllerMap['plantLength'] as TextEditingController,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: layoutConstrains.textInputBetweenContainersPadding),
              child: _buildTextInputContainer(
                mainLabel: 'Peça',
                controller1:
                    controllerMap['pieceWidth'] as TextEditingController,
                controller2:
                    controllerMap['pieceLength'] as TextEditingController,
              ),
            ),
          ],
        );

      default:
        Map<String, TextEditingController> controllerMap = controllerModel
            .getControllerMap(isSimpleMethodPressed: isSimpleMethodPressed);
        return Container();
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
                    controller1,
                    layoutConstrains.textInputHeight,
                    layoutConstrains.textInputWidth),
                customTextField.buildCustomTextInput(
                    controller2,
                    layoutConstrains.textInputHeight,
                    layoutConstrains.textInputWidth)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainButton(String label, Color backgroundColor) {
    return SizedBox(
      width: layoutConstrains.calculateButtonWidth,
      height: layoutConstrains.calculateButtonHeight,
      child: ElevatedButton(
        onPressed: () {},
        child: customText.buildCustomText(
            label, Colors.white, 24, FontWeight.w400),
        style: ElevatedButton.styleFrom(
            primary: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  layoutConstrains.calculateButtonBorderRadius),
            )),
      ),
    );
  }
}

class HomePageControllerModel {
  Map<String, TextEditingController> getControllerMap(
      {required bool isSimpleMethodPressed}) {
    if (isSimpleMethodPressed) {
      Map<String, TextEditingController> controllerMap = {
        'plantWidth': TextEditingController(),
        'plantLength': TextEditingController(),
      };
      return controllerMap;
    } else {
      Map<String, TextEditingController> controllerMap = {
        'plantWidth': TextEditingController(),
        'plantLength': TextEditingController(),
        'pieceWidth': TextEditingController(),
        'pieceLength': TextEditingController(),
      };

      return controllerMap;
    }
  }
}
