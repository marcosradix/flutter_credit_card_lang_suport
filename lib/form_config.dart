class FormConfig {
  
 const FormConfig({
     this.cardNumberLabel = 'Card number',
     this.expiryDateLabel = 'Expired Date',
     this.expiryDateLabelHintText = 'MM/YY',
     this.cvvCodeLabel = 'CVV',
     this.cardHolderNameLabel = 'Card Holder',
     this.isCvvFocusedLabel = false});

   final String cardNumberLabel;
   final String expiryDateLabel;
   final String cardHolderNameLabel;
   final String expiryDateLabelHintText;
   final String cvvCodeLabel;
   final bool isCvvFocusedLabel;


}