# Shape Ecosystem

The Shape ecosystem provides comprehensive parser infrastructure and production-ready parsers for structured data formats. This document provides an overview of all projects in the ecosystem.

## Overview

Shape is organized as independent repositories. Each parser project has its own GitHub repository and development lifecycle. This repository (`shape`) contains documentation and code examples for the ecosystem.

## Core Infrastructure

### shape-core

**Repository:** [github.com/shapestone/shape-core](https://github.com/shapestone/shape-core)

The foundation of the Shape ecosystem, providing reusable parser infrastructure:

- **AST Framework** - Type-safe node definitions for validation schemas
- **Tokenizer API** - Character stream processing with custom matchers
- **Parser Interface** - Standardized error handling and API patterns
- **Schema Validator Framework** - Type registry, function registry, rich error reporting
- **Grammar Verification** - EBNF parser, test generation, coverage tracking

**Use shape-core to:**
- Build custom domain-specific language (DSL) parsers
- Create new data format parsers
- Implement validation tools
- Build schema transformation utilities

**Documentation:**
- [shape-core README](shape-core/README.md)
- [Parser Implementation Guide](shape-core/docs/PARSER_IMPLEMENTATION_GUIDE.md)
- [Architecture Documentation](shape-core/docs/architecture/ARCHITECTURE.md)

## Parser Projects

Parser projects use shape-core's infrastructure to implement parsers for specific formats.

### Data Format Parsers

These parsers handle standard data formats with schema validation:

#### shape-json

**Repository:** [github.com/shapestone/shape-json](https://github.com/shapestone/shape-json)

JSON parser with JSONPath query support:
- RFC 8259 compliant JSON parsing
- JSONPath query expressions
- Schema validation with rich error reporting
- Support for custom validation types and functions

**Use Cases:**
- Validate JSON configuration files
- Query JSON data with JSONPath
- Transform JSON with schema-based validation

#### shape-yaml

**Repository:** [github.com/shapestone/shape-yaml](https://github.com/shapestone/shape-yaml)

YAML parser and validator:
- YAML 1.2 specification support
- Schema validation
- Multi-document support
- Anchor and alias resolution

**Use Cases:**
- Validate Kubernetes manifests
- Parse configuration files
- Validate CI/CD pipeline definitions

#### shape-xml

**Repository:** [github.com/shapestone/shape-xml](https://github.com/shapestone/shape-xml)

XML parser and validator:
- W3C XML specification support
- XPath query support
- Schema validation
- Namespace handling
- DTD and entity support

**Use Cases:**
- Validate XML documents
- Parse and query XML data
- Transform XML with schemas

#### shape-csv

**Repository:** [github.com/shapestone/shape-csv](https://github.com/shapestone/shape-csv)

CSV parser with schema validation:
- RFC 4180 compliant parsing
- Custom delimiter support
- Header row validation
- Column type validation
- Row-level validation

**Use Cases:**
- Validate data imports
- Parse structured data files
- Transform CSV with schemas

#### shape-props

**Repository:** [github.com/shapestone/shape-props](https://github.com/shapestone/shape-props)

Java properties file parser:
- Standard .properties file format
- Escaping and encoding support
- Comment preservation
- Schema validation

**Use Cases:**
- Validate application configuration
- Parse Java properties files
- Convert between formats

### Validator CLIs

Command-line tools for validating data files in CI/CD pipelines:

#### shape-jsonv

**Repository:** [github.com/shapestone/shape-jsonv](https://github.com/shapestone/shape-jsonv)

JSON validation CLI:
```bash
shape-jsonv validate data.json --schema schema.json
shape-jsonv query data.json '$.users[*].name'
```

#### shape-yamlv

**Repository:** [github.com/shapestone/shape-yamlv](https://github.com/shapestone/shape-yamlv)

YAML validation CLI:
```bash
shape-yamlv validate config.yaml --schema schema.yaml
```

#### shape-xmlv

**Repository:** [github.com/shapestone/shape-xmlv](https://github.com/shapestone/shape-xmlv)

XML validation CLI:
```bash
shape-xmlv validate document.xml --schema schema.xsd
```

#### shape-csvv

**Repository:** [github.com/shapestone/shape-csvv](https://github.com/shapestone/shape-csvv)

CSV validation CLI:
```bash
shape-csvv validate data.csv --schema schema.json
```

#### shape-textv

**Repository:** [github.com/shapestone/shape-textv](https://github.com/shapestone/shape-textv)

Text-based format validation CLI for key:value formats.

## Related Projects

### Shapestone Ecosystem

Shape is part of the broader Shapestone organization:

#### Inkling

**Repository:** [github.com/shapestone/inkling](https://github.com/shapestone/inkling)

Diagram parser that uses Shape's tokenizer infrastructure:
- Uses shape-core's tokenizer API
- Demonstrates custom DSL implementation
- Example of building on Shape infrastructure

## Using Shape Infrastructure

### For End Users

If you need to parse or validate data files:

1. **Choose a parser** - Select the parser for your format (JSON, YAML, XML, CSV, etc.)
2. **Install the CLI tool** - Use the validator CLI for quick validation
3. **Or use as a library** - Import the parser in your Go code

Example:
```bash
# Install CLI
go install github.com/shapestone/shape-jsonv@latest

# Validate a file
shape-jsonv validate data.json --schema schema.json
```

### For Parser Developers

If you want to build a custom parser:

1. **Install shape-core** - `go get github.com/shapestone/shape-core`
2. **Read the guide** - [Parser Implementation Guide](shape-core/docs/PARSER_IMPLEMENTATION_GUIDE.md)
3. **Study examples** - Review [shape-json](https://github.com/shapestone/shape-json) as reference
4. **Use the tokenizer** - Build your parser using shape-core's tokenizer API

Example:
```go
import "github.com/shapestone/shape-core/pkg/tokenizer"

// Build your custom DSL parser
tok := tokenizer.NewTokenizer(
    tokenizer.StringMatcherFunc("Keyword", "function"),
    tokenizer.RegexMatcherFunc("Identifier", `[a-zA-Z_]\w*`),
)
```

## Architecture

```
┌─────────────────────────────────────────────────────┐
│         Parser Projects & Tools                     │
│  ┌──────────┐ ┌──────────┐ ┌──────────┐            │
│  │  JSON    │ │  YAML    │ │   XML    │  ...       │
│  │  Parser  │ │  Parser  │ │  Parser  │            │
│  └────┬─────┘ └────┬─────┘ └────┬─────┘            │
│       │            │            │                   │
│       └────────────┴────────────┘                   │
│                    │                                │
│                    ▼                                │
│       ┌────────────────────────────────┐            │
│       │      shape-core                │            │
│       │  Parser Infrastructure         │            │
│       ├────────────────────────────────┤            │
│       │  AST │ Tokenizer │ Validator   │            │
│       │  Parser API │ Grammar Tools    │            │
│       └────────────────────────────────┘            │
└─────────────────────────────────────────────────────┘
```

## Repository Organization

### Documentation Repository

This repository (shapestone/shape) contains:

- **Ecosystem documentation** - High-level guides and overview
- **Code examples** - Cross-project examples showing parsers working together
- **Getting started** - Onboarding materials for users and contributors

### Independent Parser Repositories

Each parser project is an independent repository:

- **Own development workflow** - Feature branches, PRs, releases
- **Own versioning** - Semantic versioning per project
- **Own CI/CD** - Independent test and release pipelines
- **Own issues** - Separate issue tracking

Users install only the parsers they need via `go get`.

## Contributing to the Ecosystem

### Contributing to Existing Projects

1. Find the project you want to contribute to
2. Clone the repository (e.g., `git clone https://github.com/shapestone/shape-json.git`)
3. Follow the CONTRIBUTING.md in that repository
4. Submit PRs to that repository

### Adding a New Parser

To contribute a new parser to the ecosystem:

1. **Build your parser** using shape-core infrastructure
2. **Follow patterns** established by existing parsers (e.g., shape-json)
3. **Complete documentation** - README, API docs, examples
4. **Add tests** - Comprehensive test coverage
5. **Submit for review** - Open an issue to discuss adding to ecosystem

**Criteria for inclusion:**
- Uses shape-core infrastructure
- Parses a widely-used, standardized format
- Has comprehensive tests and documentation
- Follows Shape ecosystem patterns

See [shape-core CONTRIBUTING.md](shape-core/CONTRIBUTING.md) for format inclusion policy.

### Creating Custom DSL Parsers

For custom DSLs, **use shape-core as a library** rather than adding to the ecosystem:

```go
import "github.com/shapestone/shape-core/pkg/tokenizer"

// Your custom DSL parser
type MyDSLParser struct {
    tok *tokenizer.Tokenizer
}
```

Resources:
- [Parser Implementation Guide](shape-core/docs/PARSER_IMPLEMENTATION_GUIDE.md)
- [Inkling Example](https://github.com/shapestone/inkling)

## Version Compatibility

### shape-core Versions

Parser projects specify their shape-core dependency:

```go
// go.mod
require github.com/shapestone/shape-core v1.2.3
```

### Documentation Versions

This documentation repository may tag releases for major ecosystem milestones.

See individual project documentation for version compatibility and releases.

## License

All Shape ecosystem projects use Apache License 2.0 unless otherwise specified.

Copyright © 2020-2025 Shapestone

## Support

### General Questions

- **Hub Discussions:** https://github.com/shapestone/shape/discussions
- **Hub Issues:** https://github.com/shapestone/shape/issues

### Project-Specific Issues

Report issues in the specific project repository:
- shape-core: https://github.com/shapestone/shape-core/issues
- shape-json: https://github.com/shapestone/shape-json/issues
- etc.

### Security

See SECURITY.md in each project for security reporting procedures.

## Roadmap

### Current Focus

- Stabilizing core infrastructure (shape-core v1.x)
- Production-hardening data format parsers
- Comprehensive documentation and examples

### Future Directions

- Additional data format parsers (based on community needs)
- Performance optimizations
- Enhanced validation features
- Improved tooling and utilities

See individual project repositories for specific roadmaps.
