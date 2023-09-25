import 'package:flutter/material.dart';
import 'package:ultimate_flutter_forms/options/chips.dart';
import 'package:ultimate_flutter_forms/options/circle_buttons.dart';
import 'package:ultimate_flutter_forms/options/counter.dart';
import 'package:ultimate_flutter_forms/options/custom_date_picker.dart';
import 'package:ultimate_flutter_forms/options/custom_multi_checkbox.dart';
import 'package:ultimate_flutter_forms/options/custom_time_picker.dart';
import 'package:ultimate_flutter_forms/options/custom_toggle_buttons.dart';
import 'package:ultimate_flutter_forms/options/emoji_picker.dart';
import 'package:ultimate_flutter_forms/options/gender_dropdown.dart';
import 'package:ultimate_flutter_forms/options/likert_scale.dart';
import 'package:ultimate_flutter_forms/options/multi_option.dart';
import 'package:ultimate_flutter_forms/options/percentage_dial.dart';
import 'package:ultimate_flutter_forms/options/range_slider.dart';
import 'package:ultimate_flutter_forms/options/slider.dart';
import 'package:ultimate_flutter_forms/options/star_rating.dart';
import 'package:ultimate_flutter_forms/options/state_dropdown.dart';
import 'package:ultimate_flutter_forms/options/vertical_slider.dart';
import 'package:ultimate_flutter_forms/options/vertical_switch.dart';
import 'package:ultimate_flutter_forms/options/yes_no_radio.dart';
import 'package:ultimate_flutter_forms/options/yes_no_switch.dart';

Widget yes_no_radio() => const Center(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: YesNoRadio(),
      ),
    );

Widget yes_no_switch() => const Center(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: YesNoSwitch(),
      ),
    );

Widget vertical_switch() =>  Center(
  child: Padding(
    padding: const EdgeInsets.all(24.0),
    child: VerticalSwitch(
      value: false,
    ),
  ),
);

Widget custom_multi_checkbox() =>  Center(
  child: Padding(
    padding: const EdgeInsets.all(24.0),
    child: CustomMultiCheckbox(),
  ),
);

Widget state_dropdown() => const Center(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: StateDropdown(),
      ),
    );

Widget gender_dropdown() => const Center(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: GenderDropdown(),
      ),
    );

Widget custom_time_picker() => const Center(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: CustomTimePicker(),
      ),
    );

Widget custom_date_picker() => const Center(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: CustomDatePicker(),
      ),
    );

Widget slider() => const Center(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: SliderWidget(
          minValue: 0,
          maxValue: 20,
        ),
      ),
    );

Widget range_slider() => Center(
  child: Padding(
    padding: const EdgeInsets.all(24.0),
    child: CustomRangeSlider(
      onChanged: (RangeValues values) {},
    ),
  ),
);

Widget vertical_slider() => Center(
  child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: VerticalSlider()
  ),
);

Widget percentage_dial() => const Center(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: PercentageDial(),
      ),
    );

Widget counter() => const Center(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: CounterWidget(),
      ),
    );

Widget multi_option_modal() => const Center(
  child: Padding(
    padding: EdgeInsets.all(24.0),
    child: MultiOptionWidget(options: ['Option 1', 'Option 2', 'Option 3'],
    ),
  ),
);

Widget multi_option_dialog() => const Center(
  child: Padding(
    padding: EdgeInsets.all(24.0),
    child: MultiOptionWidget(options: ['Option 1', 'Option 2', 'Option 3'],
      useDialog: true,
    ),
  ),
);

Widget circle_buttons() => const Center(
  child: Padding(
    padding: EdgeInsets.all(24.0),
    child: CircleButtonsWidget()
  ),
);

Widget chips() => const Center(
  child: Padding(
      padding: EdgeInsets.all(24.0),
      child: ChipsWidget(options: ['Option 1', 'Option 2', 'Option 3'],)
  ),
);

Widget star_rating_5() => const Center(
  child: Padding(
      padding: EdgeInsets.all(24.0),
      child: StarRating()
  ),
);

Widget star_rating_10() => const Center(
  child: Padding(
      padding: EdgeInsets.all(24.0),
      child: StarRating(maxStars: 10,)
  ),
);

Widget emoji_picker() => const Center(
  child: Padding(
      padding: EdgeInsets.all(24.0),
      child: EmojiPicker()
  ),
);

Widget custom_toggle_buttons() => Center(
  child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: CustomToggleButtons()
  ),
);

Widget likert_scale() => Center(
  child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: LikertScale(question: 'I love Flutter',)
  ),
);
