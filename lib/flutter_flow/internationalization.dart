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
      'en': 'Bars',
    },
    'ph7gsw49': {
      'hu': '1096 értékelés',
      'en': '1096 reviews',
    },
    'r15600dc': {
      'hu': 'Események',
      'en': 'Events',
    },
    'zcmb4wcr': {
      'hu': 'Elérhető helyek',
      'en': 'Available locations',
    },
    '66yff30v': {
      'hu': 'Foglalok!',
      'en': 'I\'m booking!',
    },
    'lkfwvmrd': {
      'hu': 'Foglalások',
      'en': 'Reservations',
    },
  },
  // Events_user
  {
    'dv3ho1eh': {
      'hu': 'Események keresése',
      'en': 'Search for events',
    },
    'iwhgjnj3': {
      'hu': 'Hello World',
      'en': 'Hello World',
    },
    '0hpwjbv7': {
      'hu': 'XX',
      'en': 'XX',
    },
    '5lufkisr': {
      'hu': 'Elérhető',
      'en': 'Available',
    },
    '2g5ewfxo': {
      'hu': 'Foglalás',
      'en': 'Reservation',
    },
    'ssxql336': {
      'hu': 'Home',
      'en': 'Home',
    },
  },
  // Bars_user
  {
    'zonfpqvs': {
      'hu': 'Bárok keresése',
      'en': 'Find bars',
    },
    'kaku0mac': {
      'hu': 'Max kapacitás:',
      'en': 'Max capacity:',
    },
    'zmkvzkf5': {
      'hu': 'Home',
      'en': 'Home',
    },
  },
  // Profile_user
  {
    'buhm6tl1': {
      'hu': 'Profil',
      'en': 'Profile',
    },
    'qiuth01c': {
      'hu': 'Elaine Edwards',
      'en': 'Elaine Edwards',
    },
    'csppmt8c': {
      'hu': 'elaine.edwards@google.com',
      'en': 'elaine.edwards@google.com',
    },
    'um957l2s': {
      'hu': 'Sötét Módra Váltás',
      'en': 'Switch to Dark Mode',
    },
    '2gfx7yml': {
      'hu': 'Switch to Light Mode',
      'en': 'Switch to Light Mode',
    },
    'iv671xe9': {
      'hu': 'Fiók beállítások',
      'en': 'Account settings',
    },
    'v4p3npbb': {
      'hu': 'Jelszó módosítása',
      'en': 'Change password',
    },
    'xscvd7ge': {
      'hu': 'Profil beállítások',
      'en': 'Profile settings',
    },
    '1zoi7bl3': {
      'hu': 'Adatvédelmi tájékoztató',
      'en': 'Privacy Policy',
    },
    't5ihrbyp': {
      'hu': 'Értesítési beállítások',
      'en': 'Notification settings',
    },
    'a8u4spyw': {
      'hu': 'Nyelv',
      'en': 'Language',
    },
    'jtktcv9h': {
      'hu': 'Kijelentkezés',
      'en': 'Logout',
    },
    'cszkm7en': {
      'hu': '__',
      'en': '__',
    },
  },
  // Notification_user
  {
    'h7ffo5lg': {
      'hu': 'Friend Request',
      'en': 'Friend Request',
    },
    'jv0qssus': {
      'hu': 'John Smith has requested to be friends.',
      'en': 'John Smith has requested to be friends.',
    },
    'k4968vlr': {
      'hu': 'Haily Brown',
      'en': 'Hailey Brown',
    },
    'c4k034ib': {
      'hu': '@brownisthenewblack',
      'en': '@brownisthenewblack',
    },
    'jjn3qyxw': {
      'hu': '2 hours ago',
      'en': '2 hours ago',
    },
    '4f0bu9pr': {
      'hu': 'Friend Request',
      'en': 'Friend Request',
    },
    'ko39ti0y': {
      'hu': 'John Smith has requested to be friends.',
      'en': 'John Smith has requested to be friends.',
    },
    'j559d4qy': {
      'hu': 'John Smith',
      'en': 'John Smith',
    },
    'cy90hghk': {
      'hu': '@johnsmithly',
      'en': '@johnsmithly',
    },
    'g64y1zc5': {
      'hu': '2 hours ago',
      'en': '2 hours ago',
    },
    's1uzkdat': {
      'hu': 'New Comment!',
      'en': 'New Comment!',
    },
    'dpq4ntwe': {
      'hu': '\"You are so awesome! Keep it up!\"',
      'en': '\"You are so awesome! Keep it up!\"',
    },
    '66bf6bnx': {
      'hu': '2 hours ago',
      'en': '2 hours ago',
    },
    'd41q2jp3': {
      'hu': 'New Like!',
      'en': 'New Like!',
    },
    'byxzpel6': {
      'hu': 'You have a new like from John Smith.',
      'en': 'You have a new like from John Smith.',
    },
    'it8yexzx': {
      'hu': '2 hours ago',
      'en': '2 hours ago',
    },
    '8345q1uk': {
      'hu': 'Értesítések',
      'en': 'Notifications',
    },
    's0bfl94w': {
      'hu': 'Home',
      'en': 'Home',
    },
  },
  // forgot_password_user
  {
    '510nox90': {
      'hu': 'Back',
      'en': 'Back',
    },
    '74mfbxmo': {
      'hu': 'Elfelejtett jelszó',
      'en': 'Forgot password?',
    },
    '2d216euf': {
      'hu':
          'Küldünk Neked egy e-mailt a jelszó visszaállításához szükséges linkkel. Kérjük, add meg a fiókokhoz tartozó e-mail címet.',
      'en':
          'We will send you an email with a link to reset your password. Please enter the email address associated with your account.',
    },
    'mjwtva3g': {
      'hu': '',
      'en': '',
    },
    '68dnyew0': {
      'hu': 'Adja meg e-mail címét...',
      'en': 'Enter your email address...',
    },
    '8q48a0t3': {
      'hu': 'Send Link',
      'en': 'Send Link',
    },
    'xbeier9i': {
      'hu': 'Vissza',
      'en': 'Back',
    },
    'p24ouufj': {
      'hu': 'Home',
      'en': 'Home',
    },
  },
  // password_management_user
  {
    'pj29yqbr': {
      'hu': 'Vissza',
      'en': 'Back',
    },
    'otij5yr1': {
      'hu': 'Back',
      'en': 'Back',
    },
    'ljv0diqj': {
      'hu': 'Jelszó módosítás',
      'en': 'Change password',
    },
    'u097d69z': {
      'hu': 'Régi jelszó',
      'en': 'Old password',
    },
    'a4pjt3dr': {
      'hu': 'Elfelejtett jelszó?',
      'en': 'Forgot password?',
    },
    'xrrkdtpo': {
      'hu': 'Add meg a régi jelszavad',
      'en': 'Enter your old password.',
    },
    'qbvd437d': {
      'hu': 'Új jelszó',
      'en': 'New password',
    },
    'qwy5ngy8': {
      'hu': 'Min. 6 karakter',
      'en': 'Min. 6 characters',
    },
    'vwwfmt7g': {
      'hu': 'Mentés',
      'en': 'Rescue',
    },
    'h0hnb00y': {
      'hu': 'Home',
      'en': 'Home',
    },
  },
  // Event_details_user
  {
    'zsflx2x1': {
      'hu': 'Verdák Quiznight',
      'en': 'Verdák Quiznight',
    },
    'm1fz12y5': {
      'hu': '2024 Nov 10., Monday, 6:00 PM',
      'en': '2024 Nov 10, Monday, 6:00 PM',
    },
    'hk8n5oj9': {
      'hu': 'Párduc Bár',
      'en': 'Panther Bar',
    },
    'wg7m8i09': {
      'hu': '23 elérhető hely',
      'en': '23 available places',
    },
    'z781q6ax': {
      'hu': 'Foglalok!',
      'en': 'I\'m booking!',
    },
    'zxjclqkx': {
      'hu': 'Az eseményről',
      'en': 'About the event',
    },
    'lo42b3ow': {
      'hu':
          '🏎️ Készen állsz egy száguldó estére?\nCsatlakozz hozzánk a Párduc Bárban, ahol egy különleges \"Verdák\" tematikájú quiznight keretében mérheted össze tudásod barátaiddal és más rajongókkal! Legyen szó a Villám McQueen legendás idézeteiről, a Radiátor-fürdő titkairól vagy a Pixar-filmek apró részleteiről, itt minden a Verdák világáról fog szólni.\n\n🎉 Mi vár rád?\n\nInteraktív kvízkérdések és játékok\nSzuper nyeremények az est legjobbjainak\nEgyedülálló hangulat a Párduc Bár elegáns környezetében\nKülönleges Verdák témájú italok és snackek\n📝 Hogyan jelentkezhetsz?\nHozd el a csapatodat (maximum 5 fő), vagy játssz egyedül! Regisztrálj előre a Párduc Bár weboldalán vagy személyesen a helyszínen. A helyek száma korlátozott, ezért ne maradj le!\n\n🚦 Tedd próbára a tudásodat, és élvezd az estét egy igazán különleges társaságban!\nNe felejtsd otthon a Verdák-rajongói kedvedet – várunk téged és barátaidat január 21-én a Párduc Bárban!\n\n💨 Villám McQueen szavaival élve: KACHOW!',
      'en':
          '🏎️ Are you ready for a fast-paced evening?\nJoin us at Párduc Bar, where you can test your knowledge with your friends and other fans in a special \"Verdák\" themed quiz night! Whether it\'s legendary quotes from Lightning McQueen, the secrets of the Radiator Bath or the little details of Pixar films, everything will be about the world of Verdák here.\n\n🎉 What awaits you?\n\nInteractive quiz questions and games\nSuper prizes for the best of the evening\nUnique atmosphere in the elegant surroundings of Párduc Bar\nSpecial Verdák-themed drinks and snacks\n📝 How to register?\nBring your team (maximum 5 people) or play alone! Register in advance on the Párduc Bar website or in person at the venue. The number of places is limited, so don\'t miss out!\n\n🚦 Test your knowledge and enjoy the evening in a truly special company!\nDon\'t forget your Verdák fan spirit at home – we\'re waiting for you and your friends at the Párduc Bar on January 21st!\n\n💨 In the words of Lightning McQueen: KACHOW!',
    },
    '54yzk90w': {
      'hu': 'Részletek',
      'en': 'Details',
    },
    'vns208cg': {
      'hu': 'Duration',
      'en': 'Duration',
    },
    'g9nwgde1': {
      'hu': '2.5 hours',
      'en': '2.5 hours',
    },
    'z2vh4kpm': {
      'hu': 'Dress Code',
      'en': 'Dress Code',
    },
    'cfj6isiy': {
      'hu': 'Smart Casual',
      'en': 'Smart Casual',
    },
    '87cli5dp': {
      'hu': 'Age Restriction',
      'en': 'Age Restriction',
    },
    'mc74plaf': {
      'hu': '18+',
      'en': '18+',
    },
  },
  // bar_details_user
  {
    'iw0ak780': {
      'hu': 'Tuk Tuk Bár',
      'en': 'Tuk Tuk Bar',
    },
    'grzay1ui': {
      'hu': 'Koktél Bár',
      'en': 'Cocktail Bar',
    },
    'mycy22y5': {
      'hu': 'Zárva',
      'en': 'Closed',
    },
    'ya80yes6': {
      'hu': '| Nyitás 17:00',
      'en': '| Opening 17:00',
    },
    'tu6t2m7e': {
      'hu': '4.8',
      'en': '4.8',
    },
    's9v6mr4w': {
      'hu': '• (1094 értékelés)',
      'en': '• (1094 reviews)',
    },
    'sqsberac': {
      'hu': 'A bár teljes kapacitása:',
      'en': 'Total bar capacity:',
    },
    'h60u3bvq': {
      'hu': '210 fő',
      'en': '210 people',
    },
    '2kst3rzy': {
      'hu': 'a bár címe (kattra google mapsre dob)',
      'en': 'the address of the bar (click to take you to google maps)',
    },
    'qgeku0ce': {
      'hu': 'Képek',
      'en': 'Pictures',
    },
    'r7aq3goy': {
      'hu': 'Menü',
      'en': 'Menu',
    },
    '2ytwssep': {
      'hu': 'Foglalás',
      'en': 'Reservation',
    },
    'khphruns': {
      'hu': 'Események (2)',
      'en': 'Events (2)',
    },
    'm4wj8u4q': {
      'hu': 'Jazz Est',
      'en': 'Jazz Evening',
    },
    'pu31agjg': {
      'hu': 'Péntek, 21:00',
      'en': 'Friday, 9:00 PM',
    },
    '5zhotawu': {
      'hu': 'Megyek',
      'en': 'I\'m going.',
    },
    '5hucoe3i': {
      'hu': 'Foglalási kuponok',
      'en': 'Booking coupons',
    },
    'itc4hpnr': {
      'hu': 'Ingyenes Shot',
      'en': 'Free Shot',
    },
    'il025d4h': {
      'hu': '5+ fős társaságnak',
      'en': 'For a group of 5+ people',
    },
    'c9njxetg': {
      'hu': 'Ingyenes Shot',
      'en': 'Free Shot',
    },
    'chfxuy4s': {
      'hu': '5+ fős társaságnak',
      'en': 'For a group of 5+ people',
    },
    'upkr6bk9': {
      'hu': 'Ingyenes Shot',
      'en': 'Free Shot',
    },
    'cdf8psq2': {
      'hu': '5+ fős társaságnak',
      'en': 'For a group of 5+ people',
    },
    'eqz2y9xy': {
      'hu': 'Ingyenes Shot',
      'en': 'Free Shot',
    },
    'gpkn1s6t': {
      'hu': '5+ fős társaságnak',
      'en': 'For a group of 5+ people',
    },
    'p5f98f5c': {
      'hu': 'Ingyenes Shot',
      'en': 'Free Shot',
    },
    'ocp58woi': {
      'hu': '5+ fős társaságnak',
      'en': 'For a group of 5+ people',
    },
    'n8mpu3gf': {
      'hu': 'Ingyenes Shot',
      'en': 'Free Shot',
    },
    '6t4vkc95': {
      'hu': '5+ fős társaságnak',
      'en': 'For a group of 5+ people',
    },
    'cb8n7lh8': {
      'hu': 'Ingyenes Shot',
      'en': 'Free Shot',
    },
    'rzl6l6r1': {
      'hu': '5+ fős társaságnak',
      'en': 'For a group of 5+ people',
    },
    '2ew4jn6n': {
      'hu': 'Vissza',
      'en': 'Back',
    },
  },
  // images
  {
    'ury959kc': {
      'hu': 'Képek',
      'en': 'Pictures',
    },
    'm6ldn345': {
      'hu': 'Home',
      'en': 'Home',
    },
  },
  // Gradient_Card
  {
    'lr5um9l5': {
      'hu': 'Verdák Quiznight ',
      'en': 'Verdák Quiznight',
    },
    '2667oisc': {
      'hu': 'Szerda, 20:00',
      'en': 'Wednesday, 8:00 PM',
    },
    '31o2cajx': {
      'hu': 'Megyek',
      'en': 'I\'m going.',
    },
  },
  // temp1_foglalsiKuponok
  {
    'dnn8a2nh': {
      'hu': 'Csoportos akciók (3)',
      'en': 'Group promotions (3)',
    },
    '7uxp5zlq': {
      'hu': 'Ingyenes Shot',
      'en': 'Free Shot',
    },
    'c9dgxore': {
      'hu': '5+ fős társaságnak',
      'en': 'For a group of 5+ people',
    },
    'db7ficja': {
      'hu': 'Ingyenes Shot',
      'en': 'Free Shot',
    },
    '2gslc29u': {
      'hu': '5+ fős társaságnak',
      'en': 'For a group of 5+ people',
    },
    'czbc2tpo': {
      'hu': 'Ingyenes Shot',
      'en': 'Free Shot',
    },
    'burhdg69': {
      'hu': '5+ fős társaságnak',
      'en': 'For a group of 5+ people',
    },
    'zzxtrnvi': {
      'hu': 'Ingyenes Shot',
      'en': 'Free Shot',
    },
    'wfa83ljf': {
      'hu': '5+ fős társaságnak',
      'en': 'For a group of 5+ people',
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
