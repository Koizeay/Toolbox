# Toolbox - By Koizeay

## Description
The goal of this project is to create a toolbox mobile app with a lot of tools to help you in your daily life or just to have fun.

The app is developed to support both Android and iOS, no web or desktop support is planned.

## Download
You can download **Toolbox** on Android and iOS via the following links

- [Play Store (Android)](https://play.google.com/store/apps/details?id=com.koizeay.toolbox)
- [App Store (iOS)](https://apps.apple.com/app/toolbox-by-koizeay/id6466197390)
- [GitHub Releases (Android APK)](https://github.com/Koizeay/Toolbox/releases)

## Contribute
If you want to contribute to this project, you can do it by adding new tools or by improving the existing ones.
You can also help by translating the app in your language.\
**Once you have finished, you can create a pull request and I will review it to add your changes to the app.**

### Download and build the project
To build this project you need to have [Flutter](https://flutter.dev/) installed on your computer (it's very easy).\
Then you can clone this repository and open the Flutter project with your IDE (e.g. *Android Studio* or *Visual Studio Code*).\
Now, you have to create a new file called `musicanalyzer.dart` in the `lib/secret` folder (create it if it doesn't exist) and add the following code:
```dart
Future<String> getMusicAnalyzerApiToken(String audioFilePath) async {
  return "TOKEN";
}

Future<String> getMusicAnalyzerApiKey() async {
  return "KEY";
}
```
Before running the project, you need to run this command in the terminal (in the project folder):
```bash
flutter pub get
```
Finally you can run the project on your device, on an emulator or on a simulator.


*Warning*, some tools require an API key and/or token to work, if you want to use them while developing, you need to add your own API key and/or token in the corresponding .dart file (in the `lib/secret` folder).

### Add a new tool
**Warning**, if you want to add a new tool, you need to have some knowledge in Flutter and Dart.\
Be sure to respect the code style of the project (see below).\
To add a new tool, please follow these steps:
1. Create a new file in the `lib/pages` folder with the name of your tool finished by `_page.dart` (e.g. `my_tool_page.dart`). You can copy/paste the content of the `lib/pages/templates/tool_template_page.dart` file to start.
2. Code your tool in the new file, you can install packages if needed (via [pub.dev](https://pub.dev)).
3. Add your tool to the `lib/hierarchy.dart` file by importing it and adding it to the `toolMap` map and in the correct folder (using the `hierarchy` list).

### Improve an existing tool
If you want to improve an existing tool, you can do it by editing the corresponding file in the `lib/pages` folder.\
Please respect the code style of the project (see below).

### Translate the app
**It's very easy to translate the app and you don't need to know how to code.** \
If you want to translate the app in a new language, you can do it by adding a file called `strings_{language_code}.i18n.json` in the `assets/translations` folder (e.g. `strings_fr.i18n.json` for French).\
You can copy/paste the content of the `assets/translations/strings.i18n.json` file to start.\
Then you can translate the strings in the file.\
Once you have finished, you need to run this command in the terminal (in the project folder):
```bash
flutter pub run slang
```
Finally you need to add the `<string>{language_code}</string>` line to the `CFBundleLocalizations` list in the `ios/Runner/Info.plist` file.

## Code style and little rules
You can write your code as you want but please respect these rules:
- Please use English for the code and the comments.
- Please use the `camelCase` notation for the variables and the functions.
- Please use the `PascalCase` notation for the classes.
- Please use the `snake_case` notation for the files.
- Please use the `FilledButton` widget for the buttons.
- Please always use a `OutlineInputBorder` for the text fields border.
- Please keep the `SafeArea` widget in the pages.
- Please keep the `SingleChildScrollView` widget in the pages to avoid overflow.
- Please keep the `GestureDetector` widget as the root of the pages if there is at least one text field in the page.
- Please do not add more than 3 actions in the `AppBar`.
- Please do not add actions in the `AppBar` if there are not `IconButton`.
- Please always add a tooltip to the `IconButton` in the `AppBar`.
- Please do not import the `flutter/cupertino.dart` file.
- Please always use localized strings (see the "Translate the app" section).
- If you want to use an API or resources hosted on the internet
  - Please add a fallback in case the user doesn't have an internet connection.
  - Please add an action button in the `AppBar` opening an `AlertDialog` showing the data sources and licenses.
    - Please use the `Icons.copyright` icon for the action button.
- Please never change the key of a tool in the `hierarchy.dart` file.
- Please avoid using `SnackBar` and `BottomSheet`, prefer using `AlertDialog`.
- Please respect the naming of the shared preferences keys (can be found in `lib/core/shared_preferences.dart`).
  - Please never rename a key.
- Please use the files in the `lib/core` folder to do some actions, you can add new files or functions if needed.
  - Please use the `lib/core/dialogs.dart` file to create dialogs.
    - You can still use the `showDialog` function if you need to create a custom dialog.
  - Please use the `lib/core/http_requests.dart` file to make HTTP requests.
  - Please use the `lib/core/online_file`file to download files or get its content from the internet.
  - Please use the `lib/core/shared_preferences.dart` file to define the shared preferences keys.
  - Please use the `lib/core/url.dart` file to open URLs outside the app or check if an URL is valid.
- Please avoid using custom fonts, prefer using the default ones.
- Please do not use custom colors, a theme is already defined.
- Please do not use custom icons, you can use the `Icons` class.
- Please respect the assets structure.
- **Have fun**.

## Contact
If you have any question, you can contact me by email at [me@koizeay.com](mailto:me@koizeay.com)

## Screenshots
<p float="left">
  <img src="https://raw.githubusercontent.com/Koizeay/Toolbox/main/.github/screenshot01.png" alt="Screenshot 01" height="400">
  <img src="https://raw.githubusercontent.com/Koizeay/Toolbox/main/.github/screenshot02.png" alt="Screenshot 02" height="400">
  <img src="https://raw.githubusercontent.com/Koizeay/Toolbox/main/.github/screenshot03.png" alt="Screenshot 03" height="400">
  <img src="https://raw.githubusercontent.com/Koizeay/Toolbox/main/.github/screenshot04.png" alt="Screenshot 04" height="400">
  <img src="https://raw.githubusercontent.com/Koizeay/Toolbox/main/.github/screenshot05.png" alt="Screenshot 05" height="400">
  <img src="https://raw.githubusercontent.com/Koizeay/Toolbox/main/.github/screenshot06.png" alt="Screenshot 06" height="400">
  <img src="https://raw.githubusercontent.com/Koizeay/Toolbox/main/.github/screenshot07.png" alt="Screenshot 07" height="400">
  <img src="https://raw.githubusercontent.com/Koizeay/Toolbox/main/.github/screenshot08.png" alt="Screenshot 08" height="400">
  <img src="https://raw.githubusercontent.com/Koizeay/Toolbox/main/.github/screenshot09.png" alt="Screenshot 09" height="400">
  <img src="https://raw.githubusercontent.com/Koizeay/Toolbox/main/.github/screenshot10.png" alt="Screenshot 19" height="400">
</p>

## License
**This project is under the [Mozilla Public License 2.0](https://www.mozilla.org/en-US/MPL/2.0/).**

_Please note that icons, images and other assets are not included in the license._

_This project was (up to and including version 1.18.0) under the [GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.html)._\
_You can read the declaration of the license change [here](https://koizeay.com/static/toolbox/license_change_from_gpl-3.0_to_mpl-2.0.pdf)._

## Credits
- [Koizeay](https://koizeay.com) - Main developer
- [Icons8](https://www.icons8.com/) - Tools icons + App icon