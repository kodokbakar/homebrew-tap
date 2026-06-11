# Homebrew Tap

Homebrew tap for [`clank-cli`](https://github.com/kodokbakar/clank-cli), an HTTP load testing CLI tool built with Rust.

## Prerequisites

- macOS
- Homebrew installed

This formula currently supports:

- macOS Intel (`x86_64-apple-darwin`)
- macOS Apple Silicon (`aarch64-apple-darwin`)

Linuxbrew support is not included yet.

## Installation

```bash
brew install kodokbakar/tap/clank-cli
```

## Verify Installation

```bash
clank-cli --version
clank-cli --help
```

Expected version format:

```text
clank-cli 0.1.0
```

## Documentation

Full documentation is available in the main repository:

[https://github.com/kodokbakar/clank-cli](https://github.com/kodokbakar/clank-cli)

## Formula

Current formula:

```text
Formula/c/clank-cli.rb
```

## CI Validation

This tap uses GitHub Actions on `macos-latest` to validate the formula.

The CI workflow runs:

```text
ruby -c Formula/c/clank-cli.rb
brew audit --strict --online kodokbakar/tap/clank-cli
brew install kodokbakar/tap/clank-cli
brew test kodokbakar/tap/clank-cli
clank-cli --version
clank-cli --help
```

## Update Process

To publish a new `clank-cli` version through Homebrew:

1. Update the version in the main `clank-cli` repository `Cargo.toml`.

2. Commit the version bump.

3. Push a new release tag, for example:

   ```bash
   git tag v0.2.0
   git push origin v0.2.0
   ```

4. Wait until the `clank-cli` GitHub Actions release workflow finishes.

5. Read the SHA256 values for the new macOS release archives:

   * `clank-cli-<version>-x86_64-apple-darwin.tar.gz`
   * `clank-cli-<version>-aarch64-apple-darwin.tar.gz`

6. Update `Formula/c/clank-cli.rb`:

   * Intel macOS URL
   * Intel macOS SHA256
   * Apple Silicon macOS URL
   * Apple Silicon macOS SHA256

7. Push the formula update to this tap repository.

8. Wait until Formula CI passes.

## Local macOS Validation

If macOS is available locally:

```bash
brew install --formula ./Formula/c/clank-cli.rb
brew test ./Formula/c/clank-cli.rb
brew audit --strict --online ./Formula/c/clank-cli.rb
```