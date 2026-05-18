/// Static translation table. Add a locale by adding a map with the same keys.
class AppStrings {
  const AppStrings._();

  static const Map<String, Map<String, String>> values = {
    'en': {
      'navHome': 'Home',
      'navSettings': 'Settings',
      'productsTitle': 'Products',
      'retry': 'Retry',
      'loadError': 'Could not load products.',
      'settingsTitle': 'Settings',
      'appearance': 'Appearance',
      'darkMode': 'Dark mode',
      'palette': 'Accent palette',
      'language': 'Language',
      'flavor': 'Active flavor',
      'english': 'English',
      'hindi': 'हिन्दी',
      'bengali': 'বাংলা',
    },
    'hi': {
      'navHome': 'होम',
      'navSettings': 'सेटिंग्स',
      'productsTitle': 'उत्पाद',
      'retry': 'पुनः प्रयास',
      'loadError': 'उत्पाद लोड नहीं हो सके।',
      'settingsTitle': 'सेटिंग्स',
      'appearance': 'दिखावट',
      'darkMode': 'डार्क मोड',
      'palette': 'एक्सेंट पैलेट',
      'language': 'भाषा',
      'flavor': 'सक्रिय फ्लेवर',
      'english': 'English',
      'hindi': 'हिन्दी',
      'bengali': 'বাংলা',
    },
    'bn': {
      'navHome': 'হোম',
      'navSettings': 'সেটিংস',
      'productsTitle': 'পণ্য',
      'retry': 'আবার চেষ্টা',
      'loadError': 'পণ্য লোড করা যায়নি।',
      'settingsTitle': 'সেটিংস',
      'appearance': 'অ্যাপিয়ারেন্স',
      'darkMode': 'ডার্ক মোড',
      'palette': 'অ্যাকসেন্ট প্যালেট',
      'language': 'ভাষা',
      'flavor': 'সক্রিয় ফ্লেভার',
      'english': 'English',
      'hindi': 'हिन्दी',
      'bengali': 'বাংলা',
    },
  };

  static String resolve(String locale, String key) =>
      values[locale]?[key] ?? values['en']?[key] ?? key;
}
