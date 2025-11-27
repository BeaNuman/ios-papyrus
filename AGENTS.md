# Repository Guidelines

## Project Structure & Module Organization
Papyrus is a Swift Package with a single library target, `Papyrus`, under `Sources/Papyrus`. Core types live beside feature folders such as `PapyrusStore.swift`, `Queries/`, `Observers/`, and `Extensions/`. API documentation sources are stored in `Sources/Papyrus/Documentation.docc`. Tests reside in `Tests/Unit` (behavior and regression coverage) and `Tests/Performance` (microbenchmarks); keep fixtures and XCTest plans inside each target’s `Resources` or `Supporting Files`.

## Build, Test, and Development Commands
- `swift build --configuration debug` compiles the package and validates dependency graph updates.
- `swift test` mirrors the macOS 13 / Xcode 15 CI workflow defined in `.github/workflows/ci.yml`.
- `swift test --filter Unit.CollectionQueryTests` (swap the symbol as needed) runs a focused XCTest case.
- `swift test -c release --filter Performance` exercises the performance target with release optimizations.
- `swift package generate-documentation --target Papyrus` renders the DocC bundle for API review.

## Coding Style & Naming Conventions
Adopt Swift 6 idioms with four-space indentation, trailing commas for multiline collections, and explicit access control (`public`, `internal`). Types stay PascalCase, functions and properties use lowerCamelCase, and tests follow `test_feature_condition`. Continue using `// MARK:` regions and `///` DocC comments for every public API, and capture `self` weakly when referencing long-lived stores inside asynchronous closures.

## Testing Guidelines
XCTest powers all suites. Every functional change should ship with a matching test inside `Tests/Unit`; performance-sensitive work (queries, observers, merges) should also touch `Tests/Performance`. Use the helpers in `Tests/Unit/Helpers` for temporary directories or sample models, and keep test names descriptive (`test_savePersistsStruct`). Run `swift test` before pushing and include any focused commands you ran in the PR description.

## Commit & Pull Request Guidelines
Recent history favors short, imperative summaries (`fix: manually set created at timestamp (#10)`). Follow that pattern, optionally prefixing with the touched subsystem and referencing issues via `(#id)`. Pull requests should provide: a crisp problem statement, the solution outline, validation notes (`swift test`, targeted filters, or docs builds), and any migration or doc impacts. Keep branches rebased on `main`; CI enforces the same toolchain (Xcode 15.0), so flag newer SDK requirements early.

## Security & Configuration Tips
Do not commit real API keys or simulator payloads—tests already rely on generated fixtures inside `Tests/Unit/Resources`. When writing to disk, continue using the temporary-directory utilities to avoid polluting the working tree. Honor the pinned `DEVELOPER_DIR` in CI by verifying toolchain compatibility locally before using platform APIs introduced after iOS 18 / macOS 15.
