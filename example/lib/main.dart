import 'package:flutter/material.dart';
import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Credit Card Validator Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'CC Validator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String creditCardNumber = '';
  IconData brandIcon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 250,
              child: TextField(
                onChanged: (String str) {
                  setState(() {
                    creditCardNumber = str;
                  });
                  String brand = CreditCardValidator.identifyCardBrand(str);
                  IconData ccBrandIcon;
                  if (brand != null) {
                    if (brand == 'visa') {
                      ccBrandIcon = FontAwesomeIcons.ccVisa;
                    } else if (brand == 'master_card') {
                      ccBrandIcon = FontAwesomeIcons.ccMastercard;
                    } else if (brand == 'american_express') {
                      ccBrandIcon = FontAwesomeIcons.ccAmex;
                    } else if (brand == 'discover') {
                      ccBrandIcon = FontAwesomeIcons.ccDiscover;
                    }
                  }
                  setState(() {
                    brandIcon = ccBrandIcon;
                  });
                },
                decoration: InputDecoration(
                    suffixIcon: brandIcon != null ? FaIcon(brandIcon, size: 32,) : null),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            creditCardNumber.length < 13
                ? Text('Please enter atleast 13 characters')
                : CreditCardValidator.isCreditCardValid(
                        cardNumber: creditCardNumber)
                    ? Text(
                        'The credit card number is valid.',
                        style: TextStyle(color: Colors.green),
                      )
                    : Text(
                        'The credit card number is invalid.',
                        style: TextStyle(color: Colors.red),
                      )
          ],
        ),
      ),
    );
  }
}
