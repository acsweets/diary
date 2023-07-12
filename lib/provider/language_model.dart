import 'package:flutter/cupertino.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageModel extends ChangeNotifier {
  ///主题色
  Locale locale = languageSupports.values.first;

  ///更新语言
  void updateLocale(Locale locale) {
    this.locale = locale;
    notifyListeners();
  }

  static Map<String, Locale> languageSupports = {
    "简体中文": AppLocalizations.supportedLocales[2],
    "fr": AppLocalizations.supportedLocales[1],
    "English": AppLocalizations.supportedLocales[0],
  };
}
