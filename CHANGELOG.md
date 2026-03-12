# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.9.0] - 2026-03-12

### Added
- Comprehensive ecosystem documentation: `README.md`, `ECOSYSTEM.md`, `CONTRIBUTING.md`,
  `docs/GETTING_STARTED.md`, and `.gitignore` for the Shape parser infrastructure hub
- Apache 2.0 `LICENSE` file
- `Makefile` with `install-core`, `install-all`, `install-tools`, and per-parser targets
- `shape-http` parser to the ecosystem listing
- GitHub Actions release workflow triggered on semver tags (`.github/workflows/release.yml`)

### Changed
- `README.md`: added one-liner summary, "Who It's For" section, expanded acronyms,
  and make-based Quick Start instructions
- `CONTRIBUTING.md`: replaced raw `go test` commands with `make` references
- Renamed `shape-props` to `shape-properties` across `ECOSYSTEM.md`, `README.md`,
  and `docs/GETTING_STARTED.md`

### Fixed
- Replaced modified `LICENSE` text with verbatim Apache 2.0 license
- Corrected contact email domain in `CONTRIBUTING.md`
- Removed build status badge from documentation-only repository (`README.md`)

[Unreleased]: https://github.com/shapestone/shape/compare/v0.9.0...HEAD
[0.9.0]: https://github.com/shapestone/shape/releases/tag/v0.9.0
