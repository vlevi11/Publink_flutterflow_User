import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['hu', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? huText = '',
    String? enText = '',
  }) =>
      [huText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage_user
  {
    'xwbwh6t4': {
      'hu': 'Bárok',
      'en': '',
    },
    'ph7gsw49': {
      'hu': '1096 értékelés',
      'en': '',
    },
    'r15600dc': {
      'hu': 'Események',
      'en': '',
    },
    'zcmb4wcr': {
      'hu': 'Elérhető helyek',
      'en': '',
    },
    '66yff30v': {
      'hu': 'Foglalok!',
      'en': '',
    },
  },
  // Events_user
  {
    'dv3ho1eh': {
      'hu': 'Események keresése',
      'en': '',
    },
    'iwhgjnj3': {
      'hu': 'Hello World',
      'en': '',
    },
    '0hpwjbv7': {
      'hu': 'XX',
      'en': '',
    },
    '5lufkisr': {
      'hu': 'Elérhető',
      'en': '',
    },
    '2g5ewfxo': {
      'hu': 'Foglalás',
      'en': '',
    },
    'ssxql336': {
      'hu': 'Home',
      'en': '',
    },
  },
  // Bars_user
  {
    'zonfpqvs': {
      'hu': 'Bárok keresése',
      'en': '',
    },
    'kaku0mac': {
      'hu': 'Max kapacitás:',
      'en': '',
    },
    'zmkvzkf5': {
      'hu': 'Home',
      'en': '',
    },
  },
  // Profile_user
  {
    'buhm6tl1': {
      'hu': 'Profil',
      'en': '',
    },
    'qiuth01c': {
      'hu': 'Elaine Edwards',
      'en': '',
    },
    'csppmt8c': {
      'hu': 'elaine.edwards@google.com',
      'en': '',
    },
    'um957l2s': {
      'hu': 'Sötét Módra Váltás',
      'en': '',
    },
    '2gfx7yml': {
      'hu': 'Switch to Light Mode',
      'en': '',
    },
    'iv671xe9': {
      'hu': 'Fiók beállítások',
      'en': '',
    },
    'v4p3npbb': {
      'hu': 'Jelszó módosítása',
      'en': '',
    },
    'xscvd7ge': {
      'hu': 'Profil beállítások',
      'en': '',
    },
    '1zoi7bl3': {
      'hu': 'Adatvédelmi tájékoztató',
      'en': '',
    },
    't5ihrbyp': {
      'hu': 'Értesítési beállítások',
      'en': '',
    },
    'a8u4spyw': {
      'hu': 'Nyelv',
      'en': '',
    },
    'jtktcv9h': {
      'hu': 'Kijelentkezés',
      'en': '',
    },
    'cszkm7en': {
      'hu': '__',
      'en': '',
    },
  },
  // Notification_user
  {
    'h7ffo5lg': {
      'hu': 'Friend Request',
      'en': '',
    },
    'jv0qssus': {
      'hu': 'John Smith has requested to be friends.',
      'en': '',
    },
    'k4968vlr': {
      'hu': 'Haily Brown',
      'en': '',
    },
    'c4k034ib': {
      'hu': '@brownisthenewblack',
      'en': '',
    },
    'jjn3qyxw': {
      'hu': '2 hours ago',
      'en': '',
    },
    '4f0bu9pr': {
      'hu': 'Friend Request',
      'en': '',
    },
    'ko39ti0y': {
      'hu': 'John Smith has requested to be friends.',
      'en': '',
    },
    'j559d4qy': {
      'hu': 'John Smith',
      'en': '',
    },
    'cy90hghk': {
      'hu': '@johnsmithly',
      'en': '',
    },
    'g64y1zc5': {
      'hu': '2 hours ago',
      'en': '',
    },
    's1uzkdat': {
      'hu': 'New Comment!',
      'en': '',
    },
    'dpq4ntwe': {
      'hu': '\"You are so awesome! Keep it up!\"',
      'en': '',
    },
    '66bf6bnx': {
      'hu': '2 hours ago',
      'en': '',
    },
    'd41q2jp3': {
      'hu': 'New Like!',
      'en': '',
    },
    'byxzpel6': {
      'hu': 'You have a new like from John Smith.',
      'en': '',
    },
    'it8yexzx': {
      'hu': '2 hours ago',
      'en': '',
    },
    '8345q1uk': {
      'hu': 'Notifications',
      'en': '',
    },
    's0bfl94w': {
      'hu': 'Home',
      'en': '',
    },
  },
  // forgot_password_user
  {
    '510nox90': {
      'hu': 'Back',
      'en': '',
    },
    '74mfbxmo': {
      'hu': 'Forgot Password',
      'en': '',
    },
    '2d216euf': {
      'hu':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'en': '',
    },
    'mjwtva3g': {
      'hu': 'Your email address...',
      'en': '',
    },
    '68dnyew0': {
      'hu': 'Enter your email...',
      'en': '',
    },
    '8q48a0t3': {
      'hu': 'Send Link',
      'en': '',
    },
    'xbeier9i': {
      'hu': 'Back',
      'en': '',
    },
    'p24ouufj': {
      'hu': 'Home',
      'en': '',
    },
  },
  // password_management_user
  {
    'pj29yqbr': {
      'hu': 'Back',
      'en': '',
    },
    'otij5yr1': {
      'hu': 'Back',
      'en': '',
    },
    'ljv0diqj': {
      'hu': 'Jelszó módosítás',
      'en': '',
    },
    'u097d69z': {
      'hu': 'Régi jelszó',
      'en': '',
    },
    'a4pjt3dr': {
      'hu': 'Elfelejtett jelszó?',
      'en': '',
    },
    'xrrkdtpo': {
      'hu': 'Add meg a régi jelszavad',
      'en': '',
    },
    'qbvd437d': {
      'hu': 'Új jelszó',
      'en': '',
    },
    'qwy5ngy8': {
      'hu': 'Min. 6 karakter',
      'en': '',
    },
    'vwwfmt7g': {
      'hu': 'Mentés',
      'en': '',
    },
    'h0hnb00y': {
      'hu': 'Home',
      'en': '',
    },
  },
  // Event_details_user
  {
    'zsflx2x1': {
      'hu': 'Verdák Quiznight',
      'en': '',
    },
    'm1fz12y5': {
      'hu': '2024 Nov 10., Monday, 6:00 PM',
      'en': '',
    },
    'hk8n5oj9': {
      'hu': 'Párduc Bár',
      'en': '',
    },
    'wg7m8i09': {
      'hu': '23 elérhető hely',
      'en': '',
    },
    'z781q6ax': {
      'hu': 'Foglalok!',
      'en': '',
    },
    'zxjclqkx': {
      'hu': 'Az eseményről',
      'en': '',
    },
    'lo42b3ow': {
      'hu':
          '🏎️ Készen állsz egy száguldó estére?\nCsatlakozz hozzánk a Párduc Bárban, ahol egy különleges \"Verdák\" tematikájú quiznight keretében mérheted össze tudásod barátaiddal és más rajongókkal! Legyen szó a Villám McQueen legendás idézeteiről, a Radiátor-fürdő titkairól vagy a Pixar-filmek apró részleteiről, itt minden a Verdák világáról fog szólni.\n\n🎉 Mi vár rád?\n\nInteraktív kvízkérdések és játékok\nSzuper nyeremények az est legjobbjainak\nEgyedülálló hangulat a Párduc Bár elegáns környezetében\nKülönleges Verdák témájú italok és snackek\n📝 Hogyan jelentkezhetsz?\nHozd el a csapatodat (maximum 5 fő), vagy játssz egyedül! Regisztrálj előre a Párduc Bár weboldalán vagy személyesen a helyszínen. A helyek száma korlátozott, ezért ne maradj le!\n\n🚦 Tedd próbára a tudásodat, és élvezd az estét egy igazán különleges társaságban!\nNe felejtsd otthon a Verdák-rajongói kedvedet – várunk téged és barátaidat január 21-én a Párduc Bárban!\n\n💨 Villám McQueen szavaival élve: KACHOW!',
      'en': '',
    },
    '54yzk90w': {
      'hu': 'Részletek',
      'en': '',
    },
    'vns208cg': {
      'hu': 'Duration',
      'en': '',
    },
    'g9nwgde1': {
      'hu': '2.5 hours',
      'en': '',
    },
    'z2vh4kpm': {
      'hu': 'Dress Code',
      'en': '',
    },
    'cfj6isiy': {
      'hu': 'Smart Casual',
      'en': '',
    },
    '87cli5dp': {
      'hu': 'Age Restriction',
      'en': '',
    },
    'mc74plaf': {
      'hu': '18+',
      'en': '',
    },
  },
  // bar_details_proba1
  {
    'iw0ak780': {
      'hu': 'Tuk Tuk Bár',
      'en': '',
    },
    'grzay1ui': {
      'hu': 'Koktél Bár',
      'en': '',
    },
    'tu6t2m7e': {
      'hu': '4.8',
      'en': '',
    },
    's9v6mr4w': {
      'hu': '• (1094 értékelés)',
      'en': '',
    },
    'mycy22y5': {
      'hu': 'Zárva',
      'en': '',
    },
    'ya80yes6': {
      'hu': '| Nyitás 17:00',
      'en': '',
    },
    'qgeku0ce': {
      'hu': 'Képek',
      'en': '',
    },
    'r7aq3goy': {
      'hu': 'Menü',
      'en': '',
    },
    '2ytwssep': {
      'hu': 'Foglalás',
      'en': '',
    },
    'khphruns': {
      'hu': 'Események (2)',
      'en': '',
    },
    'm4wj8u4q': {
      'hu': 'Jazz Est',
      'en': '',
    },
    'pu31agjg': {
      'hu': 'Péntek, 21:00',
      'en': '',
    },
    '5zhotawu': {
      'hu': 'Megyek',
      'en': '',
    },
    'srnn6xdq': {
      'hu': 'Csoportos akciók (3)',
      'en': '',
    },
    'uc34o2w1': {
      'hu': 'Ingyenes Shot',
      'en': '',
    },
    'q662jcjv': {
      'hu': '5+ fős társaságnak',
      'en': '',
    },
    'rzb4g18v': {
      'hu': '20% Kedvezmény',
      'en': '',
    },
    '6pffp8wd': {
      'hu': '8+ fős társaságnak',
      'en': '',
    },
    'vdtmc1uy': {
      'hu': 'Ingyen Csapolás',
      'en': '',
    },
    'egrx4yff': {
      'hu': '10+ fős társaságnak',
      'en': '',
    },
    '2ew4jn6n': {
      'hu': 'Vissza',
      'en': '',
    },
  },
  // images
  {
    'ury959kc': {
      'hu': 'Képek',
      'en': '',
    },
    'm6ldn345': {
      'hu': 'Home',
      'en': '',
    },
  },
  // Gradient_Card
  {
    'lr5um9l5': {
      'hu': 'Verdák Quiznight ',
      'en': '',
    },
    '2667oisc': {
      'hu': 'Szerda, 20:00',
      'en': '',
    },
    '31o2cajx': {
      'hu': 'Megyek',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'flwrhgbp': {
      'hu': '',
      'en': '',
    },
    'vmv1w2qx': {
      'hu': '',
      'en': '',
    },
    'xqusyfug': {
      'hu': '',
      'en': '',
    },
    '0cq73o4f': {
      'hu': '',
      'en': '',
    },
    'tcu8aokx': {
      'hu': '',
      'en': '',
    },
    '78o7dap6': {
      'hu': '',
      'en': '',
    },
    'ryg8xbct': {
      'hu': '',
      'en': '',
    },
    '8eel779j': {
      'hu': '',
      'en': '',
    },
    'taomtnd7': {
      'hu': '',
      'en': '',
    },
    'srxw8qvh': {
      'hu': '',
      'en': '',
    },
    'gsenjiag': {
      'hu': '',
      'en': '',
    },
    'eharxs5h': {
      'hu': '',
      'en': '',
    },
    'a0kxe6ry': {
      'hu': '',
      'en': '',
    },
    'kyzzkmfw': {
      'hu': '',
      'en': '',
    },
    'a9467h89': {
      'hu': '',
      'en': '',
    },
    't27a7o70': {
      'hu': '',
      'en': '',
    },
    '6u7csmnl': {
      'hu': '',
      'en': '',
    },
    'fynhxf1q': {
      'hu': '',
      'en': '',
    },
    '4mqd3fk4': {
      'hu': '',
      'en': '',
    },
    '2envaiac': {
      'hu': '',
      'en': '',
    },
    'vfcy56kw': {
      'hu': '',
      'en': '',
    },
    'bptrp9uy': {
      'hu': '',
      'en': '',
    },
    'd3fc29z7': {
      'hu': '',
      'en': '',
    },
    'tq22u8eg': {
      'hu': '',
      'en': '',
    },
    '2fpwpu3g': {
      'hu': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
