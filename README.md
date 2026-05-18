# multi_flavor_config

A **clean-architecture, scalable Flutter showcase**: one codebase, three
branded flavors, multi-color theming, multi-language, fully responsive
(mobile / tablet / web) and cross-platform (Android + iOS + Web).

Consumes the companion [`flavor_config`](../flavor_config) package for
type-safe per-flavor configuration.

## Highlights

- **Clean Architecture** — strict `domain` / `data` / `presentation` split per
  feature, dependency rule pointing inward.
- **Dependency Injection** — `get_it` service locator wired in
  `core/di/injector.dart`.
- **Multi-flavor** — `karnataka`, `gujarat`, `kerala` builds, each with its own
  name, base URL, seed color and feature flags (via `flavor_config`).
- **Multi-color theming** — 5 runtime-switchable accent palettes + light/dark.
- **Multi-language** — English / हिन्दी / বাংলা with a custom delegate.
- **Responsive** — bottom navigation on mobile, navigation rail on
  tablet/desktop; adaptive content grid.
- **Routing** — `go_router` with a `StatefulShellRoute` adaptive shell.
- **Tested & lint-clean** — `flutter analyze` clean, unit tests pass.

## Structure

```
lib/
├── app.dart                 # MaterialApp.router + theme/locale wiring
├── bootstrap.dart           # shared startup (flavor → DI → runApp)
├── main.dart                # default entrypoint (Karnataka)
├── main_karnataka.dart      # flavor entrypoints
├── main_gujarat.dart
├── main_kerala.dart
├── core/
│   ├── flavor/              # AppFlavor + flavor_config wiring
│   ├── di/                  # get_it injector
│   ├── theme/               # palettes, theme builder, ThemeController
│   ├── localization/        # strings, delegate, LocaleController
│   ├── network/             # ApiClient
│   ├── responsive/          # breakpoints
│   ├── router/              # go_router
│   └── widgets/             # AdaptiveScaffold
└── features/
    ├── products/
    │   ├── domain/          # entities, repository interface, use case
    │   ├── data/            # model, remote data source, repository impl
    │   └── presentation/    # controller, page, widgets
    └── settings/
        └── presentation/    # theme / language / flavor switchers
```

## Run

```bash
flutter pub get
flutter run                              # default (Karnataka)
flutter run -t lib/main_gujarat.dart     # Gujarat flavor
flutter run -t lib/main_kerala.dart      # Kerala flavor
flutter run -d chrome -t lib/main_kerala.dart   # web
```

## License

MIT © Avijit Dutta
