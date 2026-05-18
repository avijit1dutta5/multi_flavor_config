import 'package:flavor_config/flavor_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/localization/locale_controller.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../core/theme/theme_controller.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final theme = context.watch<ThemeController>();
    final localeCtrl = context.watch<LocaleController>();

    return Scaffold(
      appBar: AppBar(title: Text(loc.t('settingsTitle'))),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SectionTitle(loc.t('flavor')),
          Card(
            child: ListTile(
              leading: const Icon(Icons.layers_outlined),
              title: Text(FlavorConfig.instance.name),
              subtitle: Text(FlavorConfig.instance.get<String>('displayName')),
            ),
          ),
          const SizedBox(height: 16),
          _SectionTitle(loc.t('appearance')),
          Card(
            child: SwitchListTile(
              title: Text(loc.t('darkMode')),
              value: theme.mode == ThemeMode.dark,
              onChanged: (_) => theme.toggleMode(),
            ),
          ),
          const SizedBox(height: 8),
          _SectionTitle(loc.t('palette')),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              for (final p in AppPalette.values)
                GestureDetector(
                  onTap: () => theme.setPalette(p),
                  child: Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [p.primary, p.secondary]),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: theme.palette == p
                            ? Theme.of(context).colorScheme.onSurface
                            : Colors.transparent,
                        width: 2.5,
                      ),
                    ),
                    child: theme.palette == p
                        ? const Icon(Icons.check, color: Colors.white)
                        : null,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          _SectionTitle(loc.t('language')),
          Card(
            child: RadioGroup<String>(
              groupValue: localeCtrl.locale.languageCode,
              onChanged: (v) => localeCtrl.setLocale(Locale(v ?? 'en')),
              child: Column(
                children: [
                  for (final l in const [
                    ('en', 'english'),
                    ('hi', 'hindi'),
                    ('bn', 'bengali'),
                  ])
                    RadioListTile<String>(
                      value: l.$1,
                      title: Text(loc.t(l.$2)),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 8, top: 4),
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      );
}
