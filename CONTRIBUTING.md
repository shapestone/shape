# Contributing to Shape Ecosystem

Thank you for your interest in contributing to the Shape ecosystem! This guide covers contributions to the documentation repository and provides guidance for contributing to individual parser projects.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Repository Structure](#repository-structure)
- [Contributing to Documentation](#contributing-to-documentation)
- [Contributing to Parser Projects](#contributing-to-parser-projects)
- [Adding New Parsers](#adding-new-parsers)
- [Building Custom Parsers](#building-custom-parsers)

## Code of Conduct

All Shape projects adhere to the Contributor Covenant Code of Conduct. By participating, you are expected to uphold this code. Please report unacceptable behavior to conduct@shapestone.dev.

## Repository Structure

The Shape ecosystem consists of **independent repositories**:

### This Documentation Repository (shapestone/shape)

Contains:
- Ecosystem documentation
- Getting started guides
- Cross-project code examples

**Contribute here for:**
- Documentation improvements
- Getting started guides
- Cross-project examples

### Parser Repositories

Each parser is an independent repository:
- **[shape-core](https://github.com/shapestone/shape-core)** - Core infrastructure
- **[shape-json](https://github.com/shapestone/shape-json)** - JSON parser
- **[shape-yaml](https://github.com/shapestone/shape-yaml)** - YAML parser
- **[shape-xml](https://github.com/shapestone/shape-xml)** - XML parser
- And more...

**Contribute to parser repos for:**
- Bug fixes in parsers
- New features in specific parsers
- Core infrastructure improvements
- Parser-specific documentation

## Contributing to Documentation

To contribute to this documentation repository:

### 1. Fork and Clone

```bash
# Fork the repository on GitHub
git clone https://github.com/YOUR_USERNAME/shape.git
cd shape
```

### 2. Create a Feature Branch

```bash
git checkout -b docs/improve-getting-started
```

### 3. Make Your Changes

Types of contributions welcome:
- **Documentation improvements** - Clarify guides, fix typos
- **Getting started enhancements** - Better onboarding
- **Examples** - Cross-project usage examples
- **Ecosystem guides** - Architecture, patterns, best practices

### 4. Commit and Push

```bash
git add .
git commit -m "docs: improve getting started guide"
git push origin docs/improve-getting-started
```

### 5. Create Pull Request

Open a PR on GitHub with:
- Clear description of changes
- Motivation for changes
- Any relevant issue references

## Contributing to Parser Projects

To contribute to a specific parser, work directly in that project's repository.

### Clone the Parser Repository

```bash
# Clone the parser repository
git clone https://github.com/shapestone/shape-json.git
cd shape-json

# Create feature branch
git checkout -b feature/my-feature

# Make changes, commit, push
git add .
git commit -m "feat: add new feature"
git push origin feature/my-feature
```

Then create a PR in that repository.

### Finding the Right Repository

Each parser has its own repository:

- **shape-core:** https://github.com/shapestone/shape-core
- **shape-json:** https://github.com/shapestone/shape-json
- **shape-yaml:** https://github.com/shapestone/shape-yaml
- **shape-xml:** https://github.com/shapestone/shape-xml
- **shape-csv:** https://github.com/shapestone/shape-csv

See each repository for specific contribution guidelines.

## Adding New Parsers

Want to add a new parser to the Shape ecosystem?

### Step 1: Build Your Parser

1. **Use shape-core infrastructure**
   ```bash
   go get github.com/shapestone/shape-core
   ```

2. **Follow the implementation guide**
   - See [Parser Implementation Guide](https://github.com/shapestone/shape-core/blob/main/docs/PARSER_IMPLEMENTATION_GUIDE.md)
   - Study [shape-json](https://github.com/shapestone/shape-json) as reference

3. **Create comprehensive tests**
   - Unit tests for all components
   - Integration tests
   - Grammar verification tests

4. **Write documentation**
   - README with usage examples
   - API documentation
   - Installation guide

### Step 2: Verify Your Parser

Before proposing for inclusion, ensure:

- ✅ **Uses shape-core** - Built on Shape infrastructure
- ✅ **Widely-used format** - Parses a standard, widely-adopted format
- ✅ **High quality** - Comprehensive tests, documentation
- ✅ **Follows patterns** - Consistent with existing parsers
- ✅ **License compatible** - Apache 2.0 license

**Format inclusion criteria:**

✅ **Include:** JSON, XML, YAML, CSV, Properties, TOML, INI, etc.
❌ **Don't include:** Custom DSLs, proprietary formats, niche formats

### Step 3: Propose for Inclusion

1. **Open an issue** in this documentation repository (shapestone/shape)
2. **Provide details:**
   - Format specification (RFC, W3C, etc.)
   - Repository URL
   - Why it belongs in the ecosystem
   - Adoption/usage evidence
3. **Wait for review** - Maintainers will evaluate

If accepted:
- Your repository will be listed in ecosystem documentation
- Added to README and guides

## Building Custom Parsers

For custom domain-specific languages (DSLs), **use shape-core as a library**:

### Example: Custom DSL Parser

```go
package main

import "github.com/shapestone/shape-core/pkg/tokenizer"

func main() {
    // Build your custom parser using Shape's tokenizer
    tok := tokenizer.NewTokenizer(
        tokenizer.StringMatcherFunc("Keyword", "function"),
        tokenizer.RegexMatcherFunc("Identifier", `[a-zA-Z_]\w*`),
        tokenizer.StringMatcherFunc("LParen", "("),
        tokenizer.StringMatcherFunc("RParen", ")"),
    )

    // Implement your parser logic
    // ...
}
```

### Resources for Custom Parsers

- [Parser Implementation Guide](https://github.com/shapestone/shape-core/blob/main/docs/PARSER_IMPLEMENTATION_GUIDE.md)
- [Tokenizer Documentation](https://github.com/shapestone/shape-core/blob/main/pkg/tokenizer/README.md)
- [Inkling Example](https://github.com/shapestone/inkling) - DSL parser using Shape

Custom DSL parsers:
- Live in their own repositories
- Use shape-core as a dependency
- Are not added to the Shape ecosystem (unless they parse a widely-used standard format)

## Development Guidelines

### Code Style

- Follow Go best practices
- Use `gofmt` for formatting
- Run `golangci-lint` for linting
- Maintain test coverage above 90%

### Commit Messages

Use [Conventional Commits](https://www.conventionalcommits.org/):

```
feat: add support for X
fix: resolve issue with Y
docs: update getting started guide
test: add tests for Z
refactor: simplify W
perf: optimize V
chore: update dependencies
```

### Testing

All code changes must include tests:

```bash
# Run tests
go test ./...

# Check coverage
go test -cover ./...
```

### Documentation

Update documentation for:
- New features
- API changes
- Breaking changes
- Usage examples

## Pull Request Process

### For Documentation Repository

1. Fork this repository
2. Create feature branch
3. Make documentation changes
4. Submit PR with clear description
5. Address review feedback
6. Maintainers will merge when approved

### For Parser Repositories

1. Fork the parser repository
2. Create feature branch
3. Make code/doc changes
4. Add tests
5. Submit PR to parser repository
6. Follow that repository's review process

See individual repository CONTRIBUTING.md for specific requirements.

## Questions?

- **General questions:** [Discussions](https://github.com/shapestone/shape/discussions)
- **Documentation issues:** [Issues](https://github.com/shapestone/shape/issues)
- **Parser-specific:** See individual parser repositories

## Recognition

Contributors are recognized in:
- Repository contributor lists
- Release notes
- CHANGELOG entries

Thank you for contributing to Shape! 🎉
