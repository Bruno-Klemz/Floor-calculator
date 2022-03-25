import 'package:floor_calculator/DesignSystem/custom_text.dart';
import 'package:floor_calculator/DesignSystem/custom_text_input.dart';
import 'package:floor_calculator/HomePage/Controller/homepage_controller.dart';
import 'package:floor_calculator/LayoutConstrains/homepage_constrains.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'HomePage/View/homepage.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => CustomText()),
        Bind.factory((i) => CustomTextInput()),
        Bind.factory((i) => HomePageController()),
        Bind.factory((i) => HomePageLayoutConstrains()),
        Bind.factory((i) => TextEditingController()),
        Bind.singleton((i) => HomePage(
            customText: i(),
            customTextField: i(),
            layoutConstrains: i(),
            controller: i(),
            plantWidthController: i(),
            partLengthController: i(),
            partWidthController: i(),
            plantLengthController: i()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/home',
            child: (context, args) => HomePage(
                customText: Modular.get(),
                customTextField: Modular.get(),
                layoutConstrains: Modular.get(),
                controller: Modular.get(),
                plantWidthController: Modular.get(),
                partLengthController: Modular.get(),
                partWidthController: Modular.get(),
                plantLengthController: Modular.get())),
      ];
}
