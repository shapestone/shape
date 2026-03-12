# Shape - Parser Infrastructure Ecosystem

> **Documentation and quick-start hub for the Shape parser ecosystem — Go libraries and tools for parsing structured data formats.**

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

**Organization:** [github.com/shapestone](https://github.com/shapestone)

Shape is a comprehensive parser infrastructure ecosystem for structured data formats. This repository contains **documentation and code examples** for the Shape ecosystem.

## What is Shape?

Writing a parser from scratch is tedious and error-prone. Shape solves this by providing a shared infrastructure layer — a reusable Abstract Syntax Tree (AST) framework, tokenizer API, and schema validator — that every parser in the ecosystem builds on. The result is a family of consistent, well-tested parsers for JSON, YAML, XML, CSV, Properties, and more, all sharing the same conventions and interfaces.

Shape provides a complete parser ecosystem built on reusable infrastructure:

- **[shape-core](https://github.com/shapestone/shape-core)** - Core parser infrastructure (Abstract Syntax Tree (AST), tokenizer, validator, grammar)
- **Data Format Parsers** - Production-ready parsers for JSON, YAML, XML, CSV, and more
- **Tools & Utilities** - Validation, transformation, and analysis tools

## Who It's For

**Go developers using parsers** — drop-in libraries for parsing and validating JSON, YAML, XML, CSV, and Properties files with schema validation, rich error reporting, and query support (JSONPath, XPath).

**Infrastructure and tooling developers** — use `shape-core` to build your own parser on a proven foundation. The tokenizer, Abstract Syntax Tree (AST) framework, and grammar verification layer handle the hard parts, so you can focus on your domain-specific language (DSL) or format.

## Repository Structure

The Shape ecosystem is organized as **independent repositories**:

- **[shape](https://github.com/shapestone/shape)** - This repository: Documentation and code examples
- **[shape-core](https://github.com/shapestone/shape-core)** - Core parser infrastructure
- **[shape-json](https://github.com/shapestone/shape-json)** - JSON parser
- **[shape-yaml](https://github.com/shapestone/shape-yaml)** - YAML parser
- **[shape-xml](https://github.com/shapestone/shape-xml)** - XML parser
- **[shape-csv](https://github.com/shapestone/shape-csv)** - CSV parser
- **[shape-http](https://github.com/shapestone/shape-http)** - HTTP/1.1 parser
- **[shape-properties](https://github.com/shapestone/shape-properties)** - Properties parser

Each parser is a separate Git repository that can be used independently.

## What's in This Repository?

This repository (`shape`) contains:

- **Documentation** - Ecosystem overview, guides, and tutorials
- **Examples** - Cross-project code examples showing how parsers work together
- **Getting Started** - Onboarding materials for new users and contributors

**This repository does NOT contain parser code** - each parser lives in its own repository.

## Quick Start

### Install a Parser

Install individual parsers using `make` or `go get` directly:

```bash
# Install JSON parser
make install-json

# Install YAML parser
make install-yaml

# Install all parsers at once
make install-all
```

### Install Validator CLI Tools

Command-line interface (CLI) validator tools can be installed with a single command:

```bash
make install-tools
```

### Use the Core Infrastructure

To build your own parser:

```bash
make install-core
```

See the [Getting Started Guide](docs/GETTING_STARTED.md) for detailed instructions.

### Make Target Reference

| Target | Purpose |
|---|---|
| `make help` | Print all available targets |
| `make install-core` | Install shape-core (parser infrastructure) |
| `make install-json` | Install shape-json (JSON parser) |
| `make install-yaml` | Install shape-yaml (YAML parser) |
| `make install-xml` | Install shape-xml (XML parser) |
| `make install-csv` | Install shape-csv (CSV parser) |
| `make install-properties` | Install shape-properties (Properties parser) |
| `make install-all` | Install all parser libraries |
| `make install-tools` | Install all validator CLI tools |

## Parser Projects

### Data Format Parsers

Production-ready parsers for standard data formats:

- **[shape-json](https://github.com/shapestone/shape-json)** - JSON parser with JSONPath query support
- **[shape-yaml](https://github.com/shapestone/shape-yaml)** - YAML parser and validator
- **[shape-xml](https://github.com/shapestone/shape-xml)** - XML parser and validator
- **[shape-csv](https://github.com/shapestone/shape-csv)** - CSV parser with schema validation
- **[shape-http](https://github.com/shapestone/shape-http)** - HTTP/1.1 parser and marshaler
- **[shape-properties](https://github.com/shapestone/shape-properties)** - Java properties file parser

### Validator CLIs

Command-line interface (CLI) tools for validating data files:

- **shape-jsonv** - JSON validation command-line interface (CLI)
- **shape-yamlv** - YAML validation CLI
- **shape-xmlv** - XML validation CLI
- **shape-csvv** - CSV validation CLI
- **shape-textv** - Text-based format validation CLI

## Core Infrastructure

**[shape-core](https://github.com/shapestone/shape-core)** provides the foundational components:

- **Abstract Syntax Tree (AST) Framework** - Type-safe node definitions for validation schemas
- **Tokenizer API** - Build custom parsers with matchers
- **Parser Interface** - Standardized parsing patterns
- **Schema Validator Framework** - Semantic validation with custom types
- **Grammar Verification** - EBNF-based parser correctness verification

## Features

### For Users

- **Multiple Format Support** - Parse JSON, YAML, XML, CSV, and Properties files
- **Schema Validation** - Validate data against schemas with rich error reporting
- **Query Support** - JSONPath and XPath query capabilities
- **CLI Tools** - Ready-to-use validation tools for CI/CD pipelines
- **Production Ready** - Battle-tested in production environments

### For Developers

- **Reusable Infrastructure** - Build new parsers on proven foundations
- **Extensible** - Add custom types and validation functions
- **Well Documented** - Comprehensive guides and examples
- **LLM-Friendly** - Grammars and guides optimized for AI-assisted development
- **High Performance** - Efficient parsing and validation

## Use Cases

### Parse and Validate Data

```go
import "github.com/shapestone/shape-json"

// Parse JSON with schema validation
parser := shapejson.NewParser()
result, err := parser.Parse(jsonData)
```

### Build Custom Parsers

```go
import "github.com/shapestone/shape-core/pkg/tokenizer"

// Use Shape's tokenizer for your domain-specific language (DSL)
tok := tokenizer.NewTokenizer(
    tokenizer.StringMatcherFunc("LBrace", "{"),
    tokenizer.RegexMatcherFunc("Identifier", `[a-zA-Z_]\w*`),
)
```

### Validate Data Files

```bash
# Validate JSON files
shape-jsonv validate data.json --schema schema.json

# Validate YAML files
shape-yamlv validate config.yaml
```

## Documentation

- **[Getting Started](docs/GETTING_STARTED.md)** - Quick start guide
- **[Ecosystem Overview](ECOSYSTEM.md)** - Complete ecosystem documentation
- **[Contributing](CONTRIBUTING.md)** - Contribution guidelines

### Parser-Specific Documentation

Each parser has its own documentation in its repository:

- [shape-core docs](https://github.com/shapestone/shape-core#readme)
- [shape-json docs](https://github.com/shapestone/shape-json#readme)
- [shape-yaml docs](https://github.com/shapestone/shape-yaml#readme)
- [shape-xml docs](https://github.com/shapestone/shape-xml#readme)

## Development

### Local Development Setup

If you're working on multiple parsers, you can organize them locally:

```bash
# Recommended local structure
mkdir shape-eco
cd shape-eco

# Clone repositories you're working on
git clone https://github.com/shapestone/shape.git
git clone https://github.com/shapestone/shape-core.git
git clone https://github.com/shapestone/shape-json.git
# ... clone others as needed
```

### Working on a Parser

```bash
# Navigate to the parser repository
cd shape-json

# Create feature branch
git checkout -b feature/my-feature

# Make changes and commit
git commit -m "feat: add new feature"
git push origin feature/my-feature
```

### Working on Core Infrastructure

```bash
# Navigate to shape-core
cd shape-core

# Development as usual
git checkout -b feature/my-feature
# ... make changes ...
```

## Requirements

- Go 1.25 or later
- Git

## Related Projects

Shape is part of the broader Shapestone ecosystem:

- **[Inkling](https://github.com/shapestone/inkling)** - Diagram parser using Shape's tokenizer

## License

All Shape projects are licensed under the Apache License 2.0.

Copyright © 2020-2025 Shapestone

## Status

Shape is production-ready:

- ✅ 10+ parser projects built on shape-core
- ✅ Production-tested infrastructure
- ✅ Comprehensive test coverage
- ✅ Complete documentation
- ✅ Active development and maintenance

## Support

- **Documentation:** Start with this repository
- **Issues:** Report issues in the specific parser repository
- **Discussions:** https://github.com/shapestone/shape/discussions
- **Security:** See individual project SECURITY.md files

## Contributing

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

For contributing to specific parsers or core infrastructure, see the CONTRIBUTING.md in the respective repository.
