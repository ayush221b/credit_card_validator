# credit_card_validate

*Demo* : https://creditcardvalidator.netlify.com/

Using this package you can easily validate a credit card number, and identify the brand of the credit card.

**Note:** This package can be used in Flutter for Mobile, Web and Desktop. 

### Currently Supported Brands
1. Visa
2. Mastercard
3. American Express
4. Discover

## Installing

Add the following line to your dependencies:
```
credit_card_validate: 0.0.3
```
and run `flutter packages get`

## Import

Import the package wherever you want to use it.

```
import 'package:credit_card_validate/credit_card_validate.dart';
```

## Example

For a fully functional demo, please visit https://creditcardvalidator.netlify.com/


**Validating a Credit Card Number**

```
bool isValid = CreditCardValidator.isCreditCardValid(cardNumber: '4716073082297205')
```

**Identifying Credit Card Brand**

```
String brand = CreditCardValidator.identifyCardBrand('4716073082297205');
```

*For a fully functional example, please see the [example directory](https://github.com/ayush221b/credit_card_validate/tree/master/example)*

### Demo

![Credit Card Validator Demo](https://media.giphy.com/media/kaOIRw7U6sCbFvlrb8/giphy.gif)

## Issues and Improvements

Feel free to contribute at: https://github.com/ayush221b/credit_card_validate/issues
