library credit_card_validator;

import 'package:flutter/foundation.dart';

/// The credit card number validation logic class
/// This package uses the `Luhn Algorithm` (look it up, it's really cool)
/// This validator supports the following credit cards:
/// `Visa` - `starting with 4`
/// `Master Card` - `starting with 5`
/// `American Express` - `starting with 37`
/// `Discover` - `starting with 6`
class CreditCardValidator {
  /// Validation function wrapper
  /// `return_type`: [bool]
  /// The function returns [true] if the credit card number is valid
  /// and [false] if the credit card number is invalid.
  static bool isCreditCardValid({@required String cardNumber}) {
    bool isValid = false;

    if (cardNumber != null &&
        cardNumber.length >= 13 &&
        cardNumber.length <= 19) {
      if (identifyCardBrand(cardNumber) != null) {
        if ((sumOfDoubleOfEvenPlaces(cardNumber) + sumOfOddPlaces(cardNumber)) %
                10 ==
            0) {
          isValid = true;
        }
      }
    }

    return isValid;
  }

  /// Find the sum of double of all digits in even places
  /// from right to left in the credit card number
  static int sumOfDoubleOfEvenPlaces(String cardNumber) {
    int sum = 0;
    for (int i = cardNumber.length - 2; i >= 0; i -= 2) {
      sum += getComputedDigit(int.parse(cardNumber[i]) * 2);
    }
    return sum;
  }

  /// Find the sum of all digits in odd places
  /// from right to left in the credit card number
  static int sumOfOddPlaces(String cardNumber) {
    int sum = 0;
    for (int i = cardNumber.length - 1; i >= 0; i -= 2) {
      sum += int.parse(cardNumber[i]);
    }
    return sum;
  }

  /// If the result is a 2 digit number then add the digits to
  /// get a single digit number
  static int getComputedDigit(int number) {
    if (number < 9) {
      return number;
    } else {
      return (number / 10 + number % 10).toInt();
    }
  }

  /// This function will associate the credit card number with a brand
  /// It is used internally in the validation process, but
  /// it can also be used externally to get the brand of the card,
  /// irrespective of whether it has been validated or not.
  /// `Please note that this function will only provide the brand of the card,`
  /// `and it does not mean that the credit card number is valid.`
  /// `Please use the is isCreditCardValid() method to check for validity.`
  static identifyCardBrand(String cardNumber) {
    String brand;

    if (cardNumber.startsWith('4')) {
      brand = 'visa';
    } else if (cardNumber.startsWith('5')) {
      brand = 'master_card';
    } else if (cardNumber.startsWith('37')) {
      brand = 'american_express';
    } else if (cardNumber.startsWith('6')) {
      brand = 'discover';
    }

    return brand;
  }
}
