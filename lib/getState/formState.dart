
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../credit_card_widget.dart';


class MyFormState extends GetController{
static MyFormState get to => Get.find();

final MaskedTextController  cardNumberController = MaskedTextController(mask: '0000 0000 0000 0000');
final TextEditingController expiryDateController = MaskedTextController(mask: '00/00');
final TextEditingController cardHolderNameController = TextEditingController();
final TextEditingController cvvCodeController = MaskedTextController(mask: '0000');

    void cleanForm() {
      cvvCodeController.text = '';
      cardHolderNameController.text = '';
      expiryDateController.text = '';
      cardNumberController.text = '';
      update(this);
  }

}