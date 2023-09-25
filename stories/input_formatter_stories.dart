import 'package:flutter/material.dart';
import 'package:ultimate_flutter_forms/text/credit_card.dart';
import 'package:ultimate_flutter_forms/text/currency.dart';
import 'package:ultimate_flutter_forms/text/cvv.dart';
import 'package:ultimate_flutter_forms/text/date.dart';
import 'package:ultimate_flutter_forms/text/hex_color.dart';
import 'package:ultimate_flutter_forms/text/ipv4.dart';
import 'package:ultimate_flutter_forms/text/limited_decimal.dart';
import 'package:ultimate_flutter_forms/text/middle_initial.dart';
import 'package:ultimate_flutter_forms/text/phone_number.dart';
import 'package:ultimate_flutter_forms/text/quantity.dart';
import 'package:ultimate_flutter_forms/text/ssn.dart';
import 'package:ultimate_flutter_forms/text/url.dart';

Widget middle_initial_formatter() => Center(
  child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'Middle Initial',
          hintText: 'M',
        ),
        inputFormatters: [MiddleInitialInputFormatter()],
      )),
);


Widget phone_formatter() => Center(
  child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'Phone Number',
          hintText: '(XXX) XXX-XXXX',
        ),
        inputFormatters: [PhoneInputFormatter()],
      )),
);

Widget ssn_formatter() => Center(
  child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'Social Security Number',
          hintText: 'XXX-XX-XXXX',
        ),
        inputFormatters: [SSNInputFormatter()],
      )),
);

Widget quantity_formatter() => Center(
      child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: TextField(
            decoration: const InputDecoration(
              labelText: 'Quantity Value',
              hintText: 'Enter value',
            ),
            inputFormatters: [QuantityInputFormatter()],
          )),
    );

Widget negative_quantity_formatter() => Center(
      child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: TextField(
            decoration: const InputDecoration(
              labelText: 'Quantity Value',
              hintText: 'Enter value',
            ),
            inputFormatters: [QuantityInputFormatter(allowNegative: true)],
          )),
    );

Widget limited_decimal_2_formatter() => Center(
      child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: TextField(
            decoration: const InputDecoration(
              labelText: 'Decimal Value',
              hintText: 'Enter decimal value',
            ),
            inputFormatters: [LimitedDecimalInputFormatter(decimalPlaces: 2)],
          )),
    );

Widget negative_limited_decimal_2_formatter() => Center(
      child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: TextField(
            decoration: const InputDecoration(
              labelText: 'Decimal Value',
              hintText: 'Enter decimal value',
            ),
            inputFormatters: [LimitedDecimalInputFormatter(decimalPlaces: 2, allowNegative: true)],
          )),
    );

Widget credit_card_formatter() => Center(
  child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'Credit Card Number',
          hintText: 'XXXX XXXX XXXX',
        ),
        inputFormatters: [CreditCardInputFormatter()],
      )),
);

Widget cvv_formatter() => Center(
  child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'CVV',
          hintText: 'XXX',
        ),
        inputFormatters: [CVVInputFormatter()],
      )),
);

Widget date_slashes_formatter() => Center(
  child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'Date',
          hintText: 'MM/DD/YYYY',
        ),
        inputFormatters: [DateInputFormatter(separator: '/')],
      )),
);

Widget date_dashes_formatter() => Center(
  child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'Date',
          hintText: 'MM-DD-YYYY',
        ),
        inputFormatters: [DateInputFormatter(separator: '-')],
      )),
);

Widget currency_formatter() => Center(
  child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'Currency',
          hintText: '1.00',
        ),
        inputFormatters: [CurrencyInputFormatter(usePrefixText: false)],
      )),
);

Widget url_formatter() => Center(
  child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'URL',
          hintText: 'https://www.example.com',
        ),
        inputFormatters: [UrlInputFormatter()],
      )),
);

Widget ipv4_formatter() => Center(
  child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'IPv4 Address',
          hintText: 'XXX.XXX.XXX.XXX',
        ),
        inputFormatters: [IPv4InputFormatter()],
      )),
);

Widget hex_color_formatter() => Center(
  child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'Hex Color',
          hintText: '#RRGGBB or RRGGBB',
        ),
        inputFormatters: [HexColorInputFormatter()],
      )),
);