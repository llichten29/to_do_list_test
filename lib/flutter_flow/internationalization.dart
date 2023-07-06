import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr'];

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
    String? enText = '',
    String? frText = '',
  }) =>
      [enText, frText][languageIndex] ?? '';

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

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

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

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // SplashScreen
  {
    'b53m70l5': {
      'en': 'Register',
      'fr': 'Enregistrer',
    },
    '2drrys1j': {
      'en': 'Login',
      'fr': 'Connexion',
    },
    '2a9180m7': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // Login
  {
    'efwxqivb': {
      'en': 'Email Address',
      'fr': 'Adresse e-mail',
    },
    '4w7s7s3n': {
      'en': 'Your email...',
      'fr': 'Votre e-mail...',
    },
    '3ufmatlh': {
      'en': 'Password',
      'fr': 'Mot de passe',
    },
    'kzmsasjy': {
      'en': 'Enter your password here...',
      'fr': 'Entrez votre mot de passe ici...',
    },
    '3ykn60dv': {
      'en': 'Login',
      'fr': 'Connexion',
    },
    '7gabp7j8': {
      'en': 'Don’t have an account yet? ',
      'fr': 'Vous n\'avez pas encore de compte?',
    },
    'hcz9q3bi': {
      'en': 'Register',
      'fr': 'Enregistrer',
    },
    'wog55uia': {
      'en': 'Please fill in a valid email address...',
      'fr': 'Veuillez saisir une adresse e-mail valide...',
    },
    '4bia006h': {
      'en': 'That password doesn\'t match.',
      'fr': 'Ce mot de passe ne correspond pas.',
    },
    'hwepwccj': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // myTasks
  {
    '5g9ngtmx': {
      'en': 'My Tasks',
      'fr': 'Mes tâches',
    },
    '0ty7baha': {
      'en': 'Search...',
      'fr': 'Recherche...',
    },
    'aawrxjsu': {
      'en': 'Option 1',
      'fr': 'Option 1',
    },
    'ae8ic6lt': {
      'en': 'date',
      'fr': 'date',
    },
    '08rbinur': {
      'en': 'date',
      'fr': 'date',
    },
    'u8vx9019': {
      'en': 'name',
      'fr': 'nom',
    },
    '4ml5kzat': {
      'en': 'Scheduled Tasks',
      'fr': 'Tâches planifiées',
    },
    '4z2eghcf': {
      'en': '--',
      'fr': '--',
    },
  },
  // Register
  {
    'q7jpte9j': {
      'en': 'Full Name',
      'fr': 'Nom et prénom',
    },
    'ohjcm90n': {
      'en': 'Enter your name here...',
      'fr': 'Entrez votre nom ici...',
    },
    'ohsot8ns': {
      'en': 'Email Address',
      'fr': 'Adresse e-mail',
    },
    'jlxr3ewz': {
      'en': 'Enter your email here...',
      'fr': 'Entrez votre email ici...',
    },
    'x96jm19j': {
      'en': 'Password',
      'fr': 'Mot de passe',
    },
    'zwf82srg': {
      'en': 'Enter your password here...',
      'fr': 'Entrez votre mot de passe ici...',
    },
    'awdh9d8q': {
      'en': 'Confirm Password',
      'fr': 'Confirmez le mot de passe',
    },
    'hvfpfznp': {
      'en': 'Confirm password here...',
      'fr': 'Confirmez le mot de passe ici...',
    },
    'pq33c8kb': {
      'en': 'Create Account',
      'fr': 'Créer un compte',
    },
    '8bcitfkh': {
      'en': 'Don’t have an account yet? ',
      'fr': 'Vous n\'avez pas encore de compte?',
    },
    'hiowmwcy': {
      'en': 'Login',
      'fr': 'Connexion',
    },
    '4ubaa65k': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // CompletedTasks
  {
    'ymjd7cna': {
      'en': 'Search...',
      'fr': 'Recherche...',
    },
    'vsun2d4j': {
      'en': 'Completed Tasks',
      'fr': 'Tâches terminées',
    },
    'yabpci9l': {
      'en': '--',
      'fr': '--',
    },
  },
  // EditProfile
  {
    'suxbh4su': {
      'en': 'Update Account Information',
      'fr': 'Mettre à jour les informations du compte',
    },
    'uoxb1fre': {
      'en': 'Full Name',
      'fr': 'Nom et prénom',
    },
    'p6rqbq9i': {
      'en': 'Please enter your full name...',
      'fr': 'S\'il vous plait entrez votre nom entier...',
    },
    'iudu2z7s': {
      'en': 'Email Address',
      'fr': 'Adresse e-mail',
    },
    '6lnkgaa2': {
      'en': 'Your email...',
      'fr': 'Votre e-mail...',
    },
    'vn3f4qpq': {
      'en': 'Save Changes',
      'fr': 'Sauvegarder les modifications',
    },
    'pf8rg01g': {
      'en': 'Please fill in a valid email address...',
      'fr': 'Veuillez saisir une adresse e-mail valide...',
    },
    'lniyfwv9': {
      'en': 'Please fill in a valid email address...',
      'fr': 'Veuillez saisir une adresse e-mail valide...',
    },
    'jg3688xa': {
      'en': 'Edit Profile',
      'fr': 'Editer le profil',
    },
    'ch0yvc94': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // TaskDetails
  {
    'w0lwy179': {
      'en': 'Due',
      'fr': 'Exigible',
    },
    '2rfds4d5': {
      'en': 'Mark As Complete',
      'fr': 'Marquer comme terminé',
    },
    'bz5y4xu1': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // MyProfile
  {
    'ghpcwjue': {
      'en': 'Welcome',
      'fr': 'Accueillir',
    },
    '7gyuqo6n': {
      'en': 'Account Information',
      'fr': 'Information sur le compte',
    },
    '9rj12cbv': {
      'en': 'Edit Profile',
      'fr': 'Editer le profil',
    },
    'x4khonrg': {
      'en': 'Change Password',
      'fr': 'Changer le mot de passe',
    },
    'h7q9ydmj': {
      'en': 'Switch to Dark Mode',
      'fr': 'Passer en mode sombre',
    },
    'gjf6cnzp': {
      'en': 'Switch to Light Mode',
      'fr': 'Passer en mode lumière',
    },
    'wzl6vsqx': {
      'en': 'Log Out',
      'fr': 'Se déconnecter',
    },
    'ufu2i6ku': {
      'en': 'App Version v0.0',
      'fr': 'Version de l\'application v0.0',
    },
    '3vfyx7au': {
      'en': '--',
      'fr': '--',
    },
  },
  // ChangePassword
  {
    'ultnuhmy': {
      'en':
          'Enter your email and we will send a reset password link to your email for you to update it.',
      'fr':
          'Entrez votre e-mail et nous vous enverrons un lien de réinitialisation du mot de passe sur votre e-mail pour que vous puissiez le mettre à jour.',
    },
    '6w4smwhe': {
      'en': 'Email address here...',
      'fr': 'Adresse mail ici...',
    },
    '985tfh73': {
      'en': 'We will send a link to your email...',
      'fr': 'Nous vous enverrons un lien sur votre e-mail...',
    },
    '614rlu18': {
      'en': 'Send Link',
      'fr': 'Envoyer un lien',
    },
    'pwblv30e': {
      'en': 'Please fill in a new password..',
      'fr': 'Veuillez saisir un nouveau mot de passe..',
    },
    '383xyszm': {
      'en': 'Change Password',
      'fr': 'Changer le mot de passe',
    },
    'clgz7pwd': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // emptyList_tasks
  {
    '0lb4desl': {
      'en': 'You don\'t have any tasks',
      'fr': 'Vous n\'avez aucune tâche',
    },
    'xkacvoc6': {
      'en': 'Create tasks by tapping the button below.',
      'fr': 'Créez des tâches en appuyant sur le bouton ci-dessous.',
    },
    'hu5hxt4f': {
      'en': 'Create Task',
      'fr': 'Créer une tâche',
    },
  },
  // CreateTask_new
  {
    'o3mzyn97': {
      'en': 'Add Task',
      'fr': 'Ajouter une tâche',
    },
    '6a7kx8st': {
      'en': 'Fill out the details below to add a new task.',
      'fr':
          'Remplissez les détails ci-dessous pour ajouter une nouvelle tâche.',
    },
    '873ifglp': {
      'en': 'Task Name',
      'fr': 'Nom de la tâche',
    },
    'vjfv7slm': {
      'en': 'Enter your task here....',
      'fr': 'Entrez votre tâche ici....',
    },
    'o0xqhnco': {
      'en': 'Details',
      'fr': 'Détails',
    },
    '8yqlogoh': {
      'en': 'Enter a description here...',
      'fr': 'Entrez une description ici...',
    },
    'rxp6jan3': {
      'en': 'Cancel',
      'fr': 'Annuler',
    },
    'zx7q3oly': {
      'en': 'Create Task',
      'fr': 'Créer une tâche',
    },
  },
  // CreateTask_Edit
  {
    'hqfcqf0t': {
      'en': 'Eddit Task',
      'fr': 'Tâche d\'édition',
    },
    '0asb52au': {
      'en': 'Fill out the details below to add a new task.',
      'fr':
          'Remplissez les détails ci-dessous pour ajouter une nouvelle tâche.',
    },
    '5vrwj44y': {
      'en': 'Task Name',
      'fr': 'Nom de la tâche',
    },
    'knt6nrl6': {
      'en': 'Enter your task here....',
      'fr': 'Entrez votre tâche ici....',
    },
    'iyy9ckv8': {
      'en': 'Details',
      'fr': 'Détails',
    },
    'hmkpu5m4': {
      'en': 'Enter a description here...',
      'fr': 'Entrez une description ici...',
    },
    '1ho53h5m': {
      'en': 'Current Due Date',
      'fr': 'Date d\'échéance actuelle',
    },
    'ykoycfmd': {
      'en': 'Cancel',
      'fr': 'Annuler',
    },
    '5jyd5gie': {
      'en': 'Update Task',
      'fr': 'Mettre à jour la tâche',
    },
  },
  // demo
  {
    '16yowz1l': {
      'en': 'Create Note',
      'fr': 'Créer une note',
    },
    'y824vxaf': {
      'en': 'Find members by searching below',
      'fr': 'Trouvez des membres en cherchant ci-dessous',
    },
    'huhtuyor': {
      'en': 'Enter your note here...',
      'fr': 'Entrez votre note ici...',
    },
    '6zx86jf1': {
      'en': 'Create Note',
      'fr': 'Créer une note',
    },
  },
  // Miscellaneous
  {
    '4jkllmz6': {
      'en': '',
      'fr': '',
    },
    '6atnb7ae': {
      'en': '',
      'fr': '',
    },
    'rfnjrxfe': {
      'en': '',
      'fr': '',
    },
    'sffo8rzk': {
      'en': '',
      'fr': '',
    },
    '98rz7dbk': {
      'en': '',
      'fr': '',
    },
    'i6gxsrvx': {
      'en': '',
      'fr': '',
    },
    'k3dbj5bh': {
      'en': '',
      'fr': '',
    },
    '5e25d4n0': {
      'en': '',
      'fr': '',
    },
    'sdxtcfjj': {
      'en': '',
      'fr': '',
    },
    '5oujtwbb': {
      'en': '',
      'fr': '',
    },
    '3wj7gm7j': {
      'en': '',
      'fr': '',
    },
    'argcb79d': {
      'en': '',
      'fr': '',
    },
    'caz1ejc6': {
      'en': '',
      'fr': '',
    },
    'f9oqilnt': {
      'en': '',
      'fr': '',
    },
    '7drppb2g': {
      'en': '',
      'fr': '',
    },
    'zpoeschh': {
      'en': '',
      'fr': '',
    },
    '3kw8u3sz': {
      'en': '',
      'fr': '',
    },
    'ghewuocn': {
      'en': '',
      'fr': '',
    },
    'gj6ggctr': {
      'en': '',
      'fr': '',
    },
    'ywyiqfsx': {
      'en': '',
      'fr': '',
    },
    'nenuu17u': {
      'en': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
