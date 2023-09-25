# Ultimate Flutter Forms Reference

## Demo
To demo the TextFields and user inputs, run the following command in the terminal:
```bash
monarch run
```

## Adding a new input type
1. Create the widget in the correct folder depending on its type
2. Add a new entry to the **_stories.dart file in the stories folder
3. Test in Monarch

## Contents (WIP)

### High Frequency (Commonly Used Inputs):

1. **Text Inputs**:
    - **Names**: First name, Last name, Middle name.
    - **Email Address**: Validated for proper email format.
    - **Password**: With options for visibility toggle.
    - **Address**: Street, City, State, Country.
    - **Comments/Feedback**: Multi-line text input.

2. **Numeric Inputs**:
    - **Phone Numbers**: With country code selectors.
    - **Zip Codes**: Validated for length and format based on country.
    - **Age**: Usually a number input with certain limits.
    - **Quantity**: For shopping apps, etc.
    - **Price**: With currency selector.
    - **Percentage**: With a slider or number input.

3. **Selection Inputs**:
    - **Dropdowns**: For selecting from a list.
    - **Radio Buttons**: For selecting one option from a few.
    - **Checkboxes**: For selecting multiple options.

4. **Date and Time**:
    - **Date of Birth**: With a date picker.
    - **Appointment Date/Time**: Date and time pickers.

### Medium Frequency:

1. **Specialized Text Inputs**:
    - **Username**: With checks for uniqueness.
    - **Search**: With auto-suggestions.
    - **URL**: Validated for proper URL format.
    - **Hex Color Code**: With validation and color preview.
    - **IPv4 Address**: With validation and masking.

2. **Files and Media**:
    - **Profile Picture**: Image uploader with preview.
    - **Documents**: PDF, DOCX uploaders.

3. **Advanced Selections**:
    - **Color Picker**: For customization in design apps.
    - **Rating**: Star rating or thumbs up/down.

### Low Frequency (Specialized Inputs) & Higher Implementation Difficulty:

1. **Financial Inputs**:
    - **Credit Card Numbers**: With validation and secure masking.
    - **Credit Card CVV**: With validation and masking.
    - **SSN**: Social Security Number, with proper masking and validation.
    - **Bank Account and Routing Numbers**.

2. **Identity and Verification**:
    - **Biometric Inputs**: Fingerprint or Face ID.
    - **Captcha**: For bot verification.
    - **QR Code/Barcode Scanner**: For scanning codes.

3. **Specialized Numeric Inputs**:
    - **Member IDs**: For clubs, organizations, etc.
    - **License Numbers**: Driving license, professional licenses.

4. **Interactive Inputs**:
    - **Signature**: Drawing and capturing user signatures.
    - **Location Picker**: Selecting a location on a map.

5. **Custom Inputs**:
    - **Custom Sliders**: For selecting values in a range.
    - **Dial Inputs**: For apps like alarm clocks or timers.
