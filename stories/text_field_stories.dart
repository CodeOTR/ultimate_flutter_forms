import 'package:flutter/material.dart';
import 'package:ultimate_flutter_forms/text/confirm_password.dart';
import 'package:ultimate_flutter_forms/text/credit_card.dart';
import 'package:ultimate_flutter_forms/text/currency.dart';
import 'package:ultimate_flutter_forms/text/cvv.dart';
import 'package:ultimate_flutter_forms/text/date.dart';
import 'package:ultimate_flutter_forms/text/decimal.dart';
import 'package:ultimate_flutter_forms/text/email.dart';
import 'package:ultimate_flutter_forms/text/first_name.dart';
import 'package:ultimate_flutter_forms/text/hex_color.dart';
import 'package:ultimate_flutter_forms/text/ipv4.dart';
import 'package:ultimate_flutter_forms/text/last_name.dart';
import 'package:ultimate_flutter_forms/text/limited_decimal.dart';
import 'package:ultimate_flutter_forms/text/middle_initial.dart';
import 'package:ultimate_flutter_forms/text/password.dart';
import 'package:ultimate_flutter_forms/text/phone_number.dart';
import 'package:ultimate_flutter_forms/text/quantity.dart';
import 'package:ultimate_flutter_forms/text/range.dart';
import 'package:ultimate_flutter_forms/text/ssn.dart';
import 'package:ultimate_flutter_forms/text/url.dart';
import 'package:ultimate_flutter_forms/text/zip_code.dart';

Widget first_name_text_field() => const Center(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: FirstNameField(),
      ),
    );

Widget last_name_text_field() => const Center(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: LastNameField(),
      ),
    );

Widget middle_initial_text_field() => const Center(
  child: Padding(
    padding: EdgeInsets.all(24.0),
    child: MiddleInitialField(),
  ),
);

Widget password_text_field() => const Center(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: PasswordField(),
      ),
    );

Widget confirm_password_text_field() => Center(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: ConfirmPasswordField(passwordController: TextEditingController(text: 'password'),),
      ),
    );

Widget zip_code_5_text_field() => const Center(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: ZipCodeField(),
      ),
    );

Widget zip_code_5_4_text_field() => const Center(
  child: Padding(
    padding: EdgeInsets.all(24.0),
    child: ZipCodeField(isExtendedFormat: true),
  ),
);

Widget phone_number_text_field() => const Center(
  child: Padding(
    padding: EdgeInsets.all(24.0),
    child: PhoneNumberField()
  ),
);

Widget email_text_field() => const Center(
  child: Padding(
    padding: EdgeInsets.all(24.0),
    child: EmailField(),
  ),
);

Widget ssn_text_field() => const Center(
  child: Padding(
    padding: EdgeInsets.all(24.0),
    child: SSNField(),
  ),
);

Widget non_negative_quantity_text_field() => const Center(
  child: Padding(
    padding: EdgeInsets.all(24.0),
    child: QuantityField(),
  ),
);

Widget negative_quantity_text_field() => const Center(
  child: Padding(
    padding: EdgeInsets.all(24.0),
    child: QuantityField(allowNegative: true),
  ),
);

Widget decimal_text_field() => const Center(
  child: Padding(
    padding: EdgeInsets.all(24.0),
    child: DecimalField(),
  ),
);

Widget negative_decimal_text_field() => const Center(
  child: Padding(
    padding: EdgeInsets.all(24.0),
    child: DecimalField(allowNegative: true),
  ),
);

Widget limited_decimal_2_text_field() => const Center(
  child: Padding(
    padding: EdgeInsets.all(24.0),
    child: LimitedDecimal(decimalPlaces: 2),
  ),
);

Widget range_text_field() => const Center(
  child: Padding(
    padding: EdgeInsets.all(24.0),
    child: RangeField(min: 0, max: 10),
  ),
);

Widget credit_card_text_field() => const Center(
  child: Padding(
    padding: EdgeInsets.all(24.0),
    child: CreditCardField(),
  ),
);

Widget cvv_text_field() => const Center(
  child: Padding(
    padding: EdgeInsets.all(24.0),
    child: CVVField(),
  ),
);

Widget cvv_amex_text_field() => const Center(
  child: Padding(
    padding: EdgeInsets.all(24.0),
    child: CVVField(isAmex: true),
  ),
);

Widget date_slashes_text_field() => const Center(
  child: Padding(
    padding: EdgeInsets.all(24.0),
    child: DateField(),
  ),
);

Widget date_dashes_text_field() => const Center(
  child: Padding(
    padding: EdgeInsets.all(24.0),
    child: DateField(separator: '-'),
  ),
);

Widget currency_prefix_text_field() => const Center(
  child: Padding(
    padding: EdgeInsets.all(24.0),
    child: CurrencyField( ),
  ),
);

Widget currency_text_field() => const Center(
  child: Padding(
    padding: EdgeInsets.all(24.0),
    child: CurrencyField(usePrefixText: false ),
  ),
);

Widget url_text_field() => const Center(
  child: Padding(
    padding: EdgeInsets.all(24.0),
    child: URLTextFormField(),
  ),
);

Widget ipv4_text_field() => const Center(
  child: Padding(
    padding: EdgeInsets.all(24.0),
    child: IPv4Field(),
  ),
);

Widget hex_color_text_field() => const Center(
  child: Padding(
    padding: EdgeInsets.all(24.0),
    child: HexColorField(),
  ),
);