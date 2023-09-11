# Toolbox - By Koizeay

## Description
The goal of this project is to create a toolbox mobile app with a lot of tools to help you in your daily life or just to have fun.

The app is developed to support both Android and iOS, no web or desktop support is planned.

## Contribute
If you want to contribute to this project, you can do it by adding new tools or by improving the existing ones.
You can also help by translating the app in your language.\
**Once you have finished, you can create a pull request and I will review it to add your changes to the app.**

### Download and build the project
To build this project you need to have [Flutter](https://flutter.dev/) installed on your computer (it's very easy).\
Then you can clone this repository and open the Flutter project with your IDE (e.g. *Android Studio*).\
Finally you can run the project on your device, on an emulator or on a simulator.

### Add a new tool
**Warning**, if you want to add a new tool, you need to have some knowledge in Flutter and Dart.\
Be sure to respect the code style of the project (see below).\
To add a new tool, please follow these steps:
1. Create a new file in the `lib/pages` folder with the name of your tool finished by `_page.dart` (e.g. `my_tool_page.dart`). You can copy/paste the content of the `lib/pages/templates/tool_template_page.dart` file to start.
2. Code your tool in the new file, you can install packages if needed (via [pub.dev](https://pub.dev)).
3. Add your tool to the `lib/pages/home_page.dart` file by importing it and adding it to the `tools` list.

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
- Please use the `ElevatedButton` widget for the buttons.
- Please keep the `SafeArea` widget in the pages.
- Please respect the naming of the shared preferences keys (can be found in `lib/core/shared_preferences.dart`).
- Please don't change the color of the app widgets, a theme is already defined.
- Please respect the assets structure.
- **Have fun**.

## Contact
If you have any question, you can contact me by email at [me@koizeay.com](mailto:me@koizeay.com)

## Screenshots
<p float="left">
  <img src="https://raw.githubusercontent.com/Koizeay/Toolbox/main/.github/screenshot01.jpg" alt="Home page screenshot" height="400">
  <img src="https://raw.githubusercontent.com/Koizeay/Toolbox/main/.github/screenshot02.jpg" alt="Home page screenshot" height="400">
  <img src="https://raw.githubusercontent.com/Koizeay/Toolbox/main/.github/screenshot03.jpg" alt="Home page screenshot" height="400">
  <img src="https://raw.githubusercontent.com/Koizeay/Toolbox/main/.github/screenshot04.jpg" alt="Home page screenshot" height="400">
  <img src="https://raw.githubusercontent.com/Koizeay/Toolbox/main/.github/screenshot05.jpg" alt="Home page screenshot" height="400">
</p>

## License
This project is under the [GNU GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html)

## Credits
- [Koizeay](https://koizeay.com) - Developer
- [Flaticon](https://www.flaticon.com/) - Tools icons
- [Icons8](https://www.icons8.com/) - App icon