import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'credit_card_model.dart';
import 'form_config.dart';
import 'getState/formState.dart';

class CreditCardForm extends StatefulWidget {
  const CreditCardForm({
    Key key,
    this.cardNumber,
    this.expiryDate,
    this.cardHolderName,
    this.cvvCode,
    @required this.onCreditCardModelChange,
    this.themeColor,
    this.textColor = Colors.black,
    this.cursorColor,
    @required this.formConfig,
    this.submmited
  }) : super(key: key);

  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;
  final void Function(CreditCardModel) onCreditCardModelChange;
  final Color themeColor;
  final Color textColor;
  final Color cursorColor;
  final FormConfig formConfig;
  final bool submmited;
  

  @override
  _CreditCardFormState createState() => _CreditCardFormState();
}

class _CreditCardFormState extends State<CreditCardForm> {
  String cardNumber;
  String expiryDate;
  String cardHolderName;
  String cvvCode;
  bool isCvvFocused = false;
  Color themeColor;
  bool submmited =false;

  void Function(CreditCardModel) onCreditCardModelChange;
  CreditCardModel creditCardModel;

  //final MaskedTextController _cardNumberController = MaskedTextController(mask: '0000 0000 0000 0000');
  //final TextEditingController _expiryDateController = MaskedTextController(mask: '00/00');
  //final TextEditingController _cardHolderNameController = TextEditingController();
  //final TextEditingController _cvvCodeController = MaskedTextController(mask: '0000');

  FocusNode cvvFocusNode = FocusNode();

  void textFieldFocusDidChange() {
    creditCardModel.isCvvFocused = cvvFocusNode.hasFocus;
    onCreditCardModelChange(creditCardModel);
  }

  void createCreditCardModel() {
    cardNumber = widget.cardNumber ?? '';
    expiryDate = widget.expiryDate ?? '';
    cardHolderName = widget.cardHolderName ?? '';
    cvvCode = widget.cvvCode ?? '';

    creditCardModel = CreditCardModel(
        cardNumber, expiryDate, cardHolderName, cvvCode, isCvvFocused);
  }

  @override
  void initState() {
    super.initState();
    Get.put<MyFormState>(MyFormState());
    createCreditCardModel();
    onCreditCardModelChange = widget.onCreditCardModelChange;
    cvvFocusNode.addListener(textFieldFocusDidChange);
     MyFormState.to.cardNumberController.addListener(() {
      setState(() {
        cardNumber =  MyFormState.to.cardNumberController.text;
        creditCardModel.cardNumber = cardNumber;
        onCreditCardModelChange(creditCardModel);
      });
    });

     MyFormState.to.expiryDateController.addListener(() {
      setState(() {
        expiryDate =  MyFormState.to.expiryDateController.text;
        creditCardModel.expiryDate = expiryDate;
        onCreditCardModelChange(creditCardModel);
      });
    });

     MyFormState.to.cardHolderNameController.addListener(() {
      setState(() {
        cardHolderName =  MyFormState.to.cardHolderNameController.text;
        creditCardModel.cardHolderName = cardHolderName;
        onCreditCardModelChange(creditCardModel);
      });
    });

    MyFormState.to.cvvCodeController.addListener(() {
      setState(() {
        cvvCode =  MyFormState.to.cvvCodeController.text;
        creditCardModel.cvvCode = cvvCode;
        onCreditCardModelChange(creditCardModel);
      });
    });
  }

  @override
  void didChangeDependencies() {
    themeColor = widget.themeColor ?? Theme.of(context).primaryColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
  
    return Theme(
      data: ThemeData(
        primaryColor: themeColor.withOpacity(0.8),
        primaryColorDark: themeColor,
      ),
      child: GetBuilder<MyFormState>(
          init: MyFormState(),
          builder: (_) {
          return Form(
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  margin: const EdgeInsets.only(left: 16, top: 16, right: 16),
                  child: TextFormField(
                    controller:  _.cardNumberController,
                    cursorColor: widget.cursorColor ?? themeColor,
                    style: TextStyle(
                      color: widget.textColor,
                    ),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: '${widget.formConfig.cardNumberLabel}',
                      hintText: 'xxxx xxxx xxxx xxxx',
                    ),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
                  child: TextFormField(
                    controller:  _.expiryDateController,
                    cursorColor: widget.cursorColor ?? themeColor,
                    style: TextStyle(
                      color: widget.textColor,
                    ),
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: '${widget.formConfig.expiryDateLabel}',
                        hintText: '${widget.formConfig.expiryDateLabelHintText}'),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
                  child: TextField(
                    focusNode: cvvFocusNode,
                    controller:  _.cvvCodeController,
                    cursorColor: widget.cursorColor ?? themeColor,
                    style: TextStyle(
                      color: widget.textColor,
                    ),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: '${widget.formConfig.cvvCodeLabel}',
                      hintText: 'XXXX',
                    ),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    onChanged: (String text) {
                      setState(() {
                        cvvCode = text;
                      });
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
                  child: TextFormField(
                    controller:  _.cardHolderNameController,
                    cursorColor: widget.cursorColor ?? themeColor,
                    style: TextStyle(
                      color: widget.textColor,
                    ),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: '${widget.formConfig.cardHolderNameLabel}',
                    ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
