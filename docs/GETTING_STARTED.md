# Getting Started with Shape

This guide will help you get started with the Shape parser ecosystem, whether you're using existing parsers, building custom parsers, or contributing to the project.

## Table of Contents

- [Installation](#installation)
- [Using Parser Libraries](#using-parser-libraries)
- [Using Validator CLIs](#using-validator-clis)
- [Building Custom Parsers](#building-custom-parsers)
- [Working with the Hub Repository](#working-with-the-hub-repository)
- [Next Steps](#next-steps)

## Installation

### Prerequisites

- **Go 1.25 or later** - [Install Go](https://golang.org/doc/install)
- **Git** - For cloning repositories

### Install a Parser Library

Each parser can be installed independently as a Go module:

```bash
# Install JSON parser
go get github.com/shapestone/shape-json

# Install YAML parser
go get github.com/shapestone/shape-yaml

# Install XML parser
go get github.com/shapestone/shape-xml

# Install CSV parser
go get github.com/shapestone/shape-csv

# Install Properties parser
go get github.com/shapestone/shape-props
```

### Install Validator CLIs

Install command-line validation tools:

```bash
# Install JSON validator CLI
go install github.com/shapestone/shape-jsonv@latest

# Install YAML validator CLI
go install github.com/shapestone/shape-yamlv@latest

# Install XML validator CLI
go install github.com/shapestone/shape-xmlv@latest

# Install CSV validator CLI
go install github.com/shapestone/shape-csvv@latest
```

Ensure your `$GOPATH/bin` is in your `$PATH`:

```bash
export PATH=$PATH:$(go env GOPATH)/bin
```

### Clone the Documentation Repository

For documentation and examples:

```bash
# Clone the documentation repository
git clone https://github.com/shapestone/shape.git
cd shape
```

This repository contains documentation and code examples only. For parser code, clone the specific parser repositories you need.

## Using Parser Libraries

### JSON Parser Example

```go
package main

import (
    "fmt"
    "log"

    "github.com/shapestone/shape-json"
)

func main() {
    // JSON data
    jsonData := `{
        "user": {
            "id": "550e8400-e29b-41d4-a716-446655440000",
            "name": "Alice",
            "age": 30
        }
    }`

    // Parse JSON
    parser := shapejson.NewParser()
    result, err := parser.Parse([]byte(jsonData))
    if err != nil {
        log.Fatalf("Parse error: %v", err)
    }

    fmt.Printf("Parsed: %+v\n", result)
}
```

### With Schema Validation

```go
package main

import (
    "fmt"
    "log"

    "github.com/shapestone/shape-json"
)

func main() {
    // Schema definition
    schema := `{
        "type": "Object",
        "properties": {
            "user": {
                "type": "Object",
                "properties": {
                    "id": { "type": "UUID" },
                    "name": { "type": "String" },
                    "age": { "type": "Integer", "min": 0, "max": 120 }
                }
            }
        }
    }`

    // JSON data to validate
    data := `{
        "user": {
            "id": "550e8400-e29b-41d4-a716-446655440000",
            "name": "Alice",
            "age": 30
        }
    }`

    // Parse and validate
    parser := shapejson.NewParser()
    result, err := parser.ParseWithSchema([]byte(data), []byte(schema))
    if err != nil {
        log.Fatalf("Validation error: %v", err)
    }

    fmt.Println("Validation successful!")
    fmt.Printf("Result: %+v\n", result)
}
```

### YAML Parser Example

```go
package main

import (
    "fmt"
    "log"

    "github.com/shapestone/shape-yaml"
)

func main() {
    // YAML data
    yamlData := `
user:
  id: 550e8400-e29b-41d4-a716-446655440000
  name: Alice
  age: 30
`

    // Parse YAML
    parser := shapeyaml.NewParser()
    result, err := parser.Parse([]byte(yamlData))
    if err != nil {
        log.Fatalf("Parse error: %v", err)
    }

    fmt.Printf("Parsed: %+v\n", result)
}
```

### XML Parser Example

```go
package main

import (
    "fmt"
    "log"

    "github.com/shapestone/shape-xml"
)

func main() {
    // XML data
    xmlData := `
<user>
    <id>550e8400-e29b-41d4-a716-446655440000</id>
    <name>Alice</name>
    <age>30</age>
</user>
`

    // Parse XML
    parser := shapexml.NewParser()
    result, err := parser.Parse([]byte(xmlData))
    if err != nil {
        log.Fatalf("Parse error: %v", err)
    }

    fmt.Printf("Parsed: %+v\n", result)
}
```

### CSV Parser Example

```go
package main

import (
    "fmt"
    "log"

    "github.com/shapestone/shape-csv"
)

func main() {
    // CSV data
    csvData := `id,name,age
550e8400-e29b-41d4-a716-446655440000,Alice,30
660e8400-e29b-41d4-a716-446655440001,Bob,25
`

    // Parse CSV
    parser := shapecsv.NewParser()
    result, err := parser.Parse([]byte(csvData))
    if err != nil {
        log.Fatalf("Parse error: %v", err)
    }

    fmt.Printf("Parsed: %+v\n", result)
}
```

## Using Validator CLIs

Command-line tools for quick validation in CI/CD pipelines.

### JSON Validation

```bash
# Validate JSON file
shape-jsonv validate data.json

# Validate with schema
shape-jsonv validate data.json --schema schema.json

# Query with JSONPath
shape-jsonv query data.json '$.users[*].name'

# Format JSON (pretty print)
shape-jsonv format data.json

# Validate multiple files
shape-jsonv validate data1.json data2.json data3.json
```

### YAML Validation

```bash
# Validate YAML file
shape-yamlv validate config.yaml

# Validate with schema
shape-yamlv validate config.yaml --schema schema.yaml

# Validate Kubernetes manifests
shape-yamlv validate deployment.yaml service.yaml

# Convert YAML to JSON
shape-yamlv convert config.yaml --to json
```

### XML Validation

```bash
# Validate XML file
shape-xmlv validate document.xml

# Validate with schema (XSD)
shape-xmlv validate document.xml --schema schema.xsd

# Query with XPath
shape-xmlv query document.xml '//user[@id="123"]'

# Validate multiple files
shape-xmlv validate doc1.xml doc2.xml
```

### CSV Validation

```bash
# Validate CSV file
shape-csvv validate data.csv

# Validate with schema
shape-csvv validate data.csv --schema schema.json

# Specify delimiter
shape-csvv validate data.tsv --delimiter '\t'

# Validate headers
shape-csvv validate data.csv --require-headers
```

### CI/CD Integration

Use validator CLIs in your CI/CD pipelines:

```yaml
# GitHub Actions example
name: Validate Data Files
on: [push, pull_request]

jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      - name: Setup Go
        uses: actions/setup-go@v4
        with:
          go-version: '1.25'

      - name: Install validators
        run: |
          go install github.com/shapestone/shape-jsonv@latest
          go install github.com/shapestone/shape-yamlv@latest

      - name: Validate JSON files
        run: shape-jsonv validate config/*.json

      - name: Validate YAML files
        run: shape-yamlv validate k8s/*.yaml
```

## Building Custom Parsers

Use shape-core infrastructure to build your own parsers.

### Install shape-core

```bash
go get github.com/shapestone/shape-core
```

### Simple Tokenizer Example

```go
package main

import (
    "fmt"
    "log"

    "github.com/shapestone/shape-core/pkg/tokenizer"
)

func main() {
    // Define matchers for your DSL
    tok := tokenizer.NewTokenizer(
        tokenizer.StringMatcherFunc("LBrace", "{"),
        tokenizer.StringMatcherFunc("RBrace", "}"),
        tokenizer.StringMatcherFunc("Equals", "="),
        tokenizer.RegexMatcherFunc("Identifier", `[a-zA-Z_]\w*`),
        tokenizer.RegexMatcherFunc("Number", `\d+`),
        tokenizer.WhitespaceMatcherFunc(),
    )

    // Tokenize input
    input := "count = 42"
    tok.Initialize(input)

    tokens, err := tok.Tokenize()
    if err != nil {
        log.Fatalf("Tokenization error: %v", err)
    }

    // Process tokens
    for _, token := range tokens {
        if token.Type() != "Whitespace" {
            fmt.Printf("%s: %s\n", token.Type(), token.Value())
        }
    }
}
```

Output:
```
Identifier: count
Equals: =
Number: 42
```

### Custom Parser Example

```go
package main

import (
    "fmt"

    "github.com/shapestone/shape-core/pkg/ast"
    "github.com/shapestone/shape-core/pkg/tokenizer"
)

type MyParser struct {
    tok    *tokenizer.Tokenizer
    tokens []tokenizer.Token
    pos    int
}

func NewMyParser() *MyParser {
    return &MyParser{
        tok: tokenizer.NewTokenizer(
            tokenizer.StringMatcherFunc("LBrace", "{"),
            tokenizer.StringMatcherFunc("RBrace", "}"),
            tokenizer.StringMatcherFunc("Colon", ":"),
            tokenizer.RegexMatcherFunc("String", `"[^"]*"`),
            tokenizer.WhitespaceMatcherFunc(),
        ),
    }
}

func (p *MyParser) Parse(input string) (ast.SchemaNode, error) {
    p.tok.Initialize(input)
    tokens, err := p.tok.Tokenize()
    if err != nil {
        return nil, err
    }

    // Filter whitespace
    p.tokens = []tokenizer.Token{}
    for _, tok := range tokens {
        if tok.Type() != "Whitespace" {
            p.tokens = append(p.tokens, tok)
        }
    }
    p.pos = 0

    return p.parseObject()
}

func (p *MyParser) parseObject() (ast.SchemaNode, error) {
    // Parse { "key": "value" }
    // Implementation details...
    return ast.NewObjectNode(make(map[string]ast.SchemaNode), ast.Position{}), nil
}

func main() {
    parser := NewMyParser()
    result, err := parser.Parse(`{ "name": "Alice" }`)
    if err != nil {
        fmt.Printf("Error: %v\n", err)
        return
    }
    fmt.Printf("Parsed: %+v\n", result)
}
```

### Complete Parser Guide

For a complete guide to implementing parsers, see:
- [Parser Implementation Guide](https://github.com/shapestone/shape-core/blob/main/docs/PARSER_IMPLEMENTATION_GUIDE.md)
- [shape-json source](https://github.com/shapestone/shape-json) - Reference implementation
- [Tokenizer documentation](https://github.com/shapestone/shape-core/blob/main/pkg/tokenizer/README.md)

## Working with Parser Repositories

### Local Development Setup

For working on multiple parsers, organize them locally:

```bash
# Create a workspace directory
mkdir shape-eco
cd shape-eco

# Clone the repositories you're working on
git clone https://github.com/shapestone/shape.git
git clone https://github.com/shapestone/shape-core.git
git clone https://github.com/shapestone/shape-json.git
# ... clone others as needed
```

### Working on Parser Code

```bash
# Navigate to the parser repository
cd shape-json

# Create feature branch
git checkout -b feature/my-feature

# Make changes, commit, push
git add .
git commit -m "feat: add new feature"
git push origin feature/my-feature
```

Then create a PR on that repository's GitHub page.

## Next Steps

### For Users

- **Explore parsers** - Try different format parsers
- **Read documentation** - Check parser-specific docs in their repositories
- **Use in projects** - Integrate parsers into your applications
- **Report issues** - File issues in specific parser repositories

### For Developers

- **Read architecture docs** - Understand Shape design
  - [shape-core Architecture](https://github.com/shapestone/shape-core/blob/main/docs/architecture/ARCHITECTURE.md)
  - [Ecosystem Overview](../ECOSYSTEM.md)
- **Study examples** - Review [shape-core examples](https://github.com/shapestone/shape-core/tree/main/examples)
- **Build a parser** - Follow [Parser Implementation Guide](https://github.com/shapestone/shape-core/blob/main/docs/PARSER_IMPLEMENTATION_GUIDE.md)
- **Contribute** - See [CONTRIBUTING.md](../CONTRIBUTING.md)

### Resources

- **Hub Repository:** https://github.com/shapestone/shape
- **shape-core:** https://github.com/shapestone/shape-core
- **Discussions:** https://github.com/shapestone/shape/discussions
- **Issues:** Report in specific submodule repositories

## Common Tasks

### Update All Submodules

```bash
# Pull latest changes for all submodules
git submodule update --remote --recursive
```

### Check Submodule Versions

```bash
# See what versions are pinned
git submodule status
```

### Run Tests Across Projects

```bash
# Run tests in shape-core
cd shape-core && go test ./... && cd ..

# Run tests in shape-json
cd shape-json && go test ./... && cd ..
```

### Build All Validator CLIs

```bash
# Build all CLIs
cd shape-jsonv && go build && cd ..
cd shape-yamlv && go build && cd ..
cd shape-xmlv && go build && cd ..
cd shape-csvv && go build && cd ..
```

## Getting Help

- **Documentation:** Start with this guide and [ECOSYSTEM.md](../ECOSYSTEM.md)
- **Examples:** See `examples/` in shape-core
- **Discussions:** https://github.com/shapestone/shape/discussions
- **Issues:** Report in specific project repositories

Welcome to the Shape ecosystem! 🎉
