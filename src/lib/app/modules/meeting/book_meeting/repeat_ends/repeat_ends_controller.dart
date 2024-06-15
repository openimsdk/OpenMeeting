import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RepeatEndsController extends GetxController {
  final int? endsInDays;
  final int? maxLimit;
  RepeatEndsController({required this.endsInDays, required this.maxLimit});

  final endsIn = DateTime.now().millisecondsSinceEpoch.obs;
  final limitCount = 7.obs;
  final inputController = TextEditingController();
  final focusNode = FocusNode();
  final checkedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    if (endsInDays != 0) {
      endsIn.value = endsInDays!;
    }
    if (maxLimit != 0) {
      limitCount.value = maxLimit!;
      inputController.text = limitCount.value.toString();
    }

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        checkedIndex.value = 1;
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
