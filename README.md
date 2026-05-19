# Multi-Flavor Config

> One Flutter codebase. Three branded apps. Switchable themes, languages, and a
> layout that feels right whether you're on a phone, a tablet, or the web.

I built this as a reference project for something I keep running into at work:
you ship "the same app" for three different clients (or regions, or brands),
and somehow it always turns into three half-forked codebases. This is my answer
to that — a single, clean-architecture Flutter app where the *only* thing that
changes per brand is a small config block.

[![Flutter](https://img.shields.io/badge/Flutter-3.35-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.9-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Architecture](https://img.shields.io/badge/architecture-clean-success)](#how-its-organized)
[![License](https://img.shields.io/badge/license-MIT-blue)](#license)

---

## What's in the box

- **Three flavors out of the box** — Karnataka, Gujarat, and Kerala builds.
  Each one gets its own display name, API base URL, brand seed color, and
  feature flags. No `if (flavor == ...)` scattered across the codebase — it all
  lives in one place.
- **Clean Architecture, honestly applied** — every feature is split into
  `domain` / `data` / `presentation`, and dependencies only ever point inward.
  Nothing in `domain` knows Flutter exists.
- **Theme switching at runtime** — five accent palettes, plus light/dark. Pick
  one from Settings and watch the whole app re-skin instantly.
- **Three languages** — English, हिन्दी, and বাংলা, wired through a custom
  localization delegate.
- **Actually responsive** — bottom navigation on phones, a navigation rail on
  tablets and desktop, and a content grid that adapts to the space it's given.
- **Cross-platform** — runs on Android, iOS, and the web from the same source.
- **Clean bill of health** — `flutter analyze` passes with zero warnings and
  the tests are green.

## A quick taste

Each flavor is just a tiny config block. This is the whole story:

```dart
FlavorConfig.initialize(
  name: 'kerala',
  values: {
    'displayName': 'Kerala Power',
    'baseUrl': 'https://fakestoreapi.com',
    'seedColor': 0xFF10B981,
    'enableBetaTab': true,
  },
);
```

Type-safe accessors keep the rest of the app from ever touching raw strings:

```dart
String  get displayName => get<String>('displayName');
Color   get seedColor   => Color(get<int>('seedColor'));
bool    get enableBetaTab => getOr<bool>('enableBetaTab', false);
```

## Getting it running

This app depends on a companion package, **`flavor_config`**, which it expects
as a sibling folder (it's referenced as a local path dependency in
`pubspec.yaml`). Lay the folders out like this:

```
your-workspace/
├── flavor_config/          # the companion config package
└── multi_flavor_config/    # this repo
```

Then:

```bash
flutter pub get

# Default build (Karnataka)
flutter run

# Pick a flavor
flutter run -t lib/main_gujarat.dart
flutter run -t lib/main_kerala.dart

# Run it on the web
flutter run -d chrome -t lib/main_kerala.dart
```

Each `main_<flavor>.dart` is a one-liner that boots the right flavor — the
shared startup path lives in `bootstrap.dart`.

## How it's organized

```
lib/
├── app.dart                 # MaterialApp.router + theme/locale wiring
├── bootstrap.dart           # shared startup: flavor → DI → runApp
├── main.dart                # default entrypoint (Karnataka)
├── main_karnataka.dart      # flavor entrypoints
├── main_gujarat.dart
├── main_kerala.dart
├── core/
│   ├── flavor/              # AppFlavor + flavor_config wiring
│   ├── di/                  # get_it service locator
│   ├── theme/               # palettes, theme builder, ThemeController
│   ├── localization/        # strings, delegate, LocaleController
│   ├── network/             # ApiClient
│   ├── responsive/          # breakpoints
│   ├── router/              # go_router shell
│   └── widgets/             # AdaptiveScaffold
└── features/
    ├── products/
    │   ├── domain/          # entities, repository interface, use case
    │   ├── data/            # model, remote data source, repository impl
    │   └── presentation/    # controller, page, widgets
    └── settings/
        └── presentation/    # theme / language / flavor switchers
```

The flow is deliberately boring (in a good way): an entrypoint picks a flavor →
`bootstrap` initializes config and the DI graph → `go_router`'s
`StatefulShellRoute` drives an adaptive shell that swaps navigation UI based on
screen width.

## Tech choices

| Concern              | What I used                                  |
|----------------------|----------------------------------------------|
| State / DI           | `get_it` + `provider`                        |
| Navigation           | `go_router` (`StatefulShellRoute`)           |
| Per-flavor config    | `flavor_config` (companion package)          |
| Networking           | `http`                                       |
| Localization         | `flutter_localizations` + a custom delegate  |

## License

MIT © Avijit Dutta — use it, fork it, learn from it.
