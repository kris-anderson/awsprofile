# awsprofile

![build](https://github.com/kris-anderson/awsprofile/workflows/build/badge.svg) ![tests](https://github.com/kris-anderson/awsprofile/workflows/tests/badge.svg) ![license type](https://img.shields.io/github/license/kris-anderson/awsprofile)

## TLDR

awsprofile allows for easy switching between your multiple AWS profiles, along with granular management of the config and credentials files.

## You May Like This If

* You don't like having a single `~/.aws/credentials` file that contains all your profiles.
* You don't like having to use the awscli `--profile` parameter in your commands.

## Tell Me More

Want to use your personal keys and config as your default AWS profile?

```bash
❯ awsprofile --set personal
```

Changed your mind and want to switch to your work profile?

```bash
❯ awsprofile --set work
```

Forgot what profile you're using and want to check before you run an `awscli` command?

```bash
❯ awsprofile --current
```

Want to see what profiles you can switch to?

```bash
❯ awsprofile --list
```

## Key features

* Switch from using a single `credential` and `config` file, to having unique files for each of your profiles.
* Utilizes basic, native OS commands, ensuring it works out of the box on:
  * macOS
  * Linux
  * FreeBSD
  * WSL (bash on Windows)
* Full POSIX compatibility
* **Lightweight** - Will not slow down your terminal.
* **Simple** - It is a symlink manager that you opperate via CLI.
* **100% open source** - You can look at the code and see what's going on.

## Installation Instructions

### macOS

```bash
brew install kris-anderson/tap/awsprofile
```

### Manual (should work on linux, BSD, and WSL)

1. Create a `~/.local/bin/` directory if you don't already have one. This location is my personal preference, since I don't want my custom commands in system locations like `/usr/bin`. If you prefer to store it somewhere else, you don't need to create this directory.

    ```bash
    mkdir -p "$HOME/.local/bin/"
    ```

2. Download and extract the latest release to the above folder location, or modify the command below to your location of choice.

    ```bash
    wget -O- https://github.com/kris-anderson/awsprofile/releases/latest/download/awsprofile.tar.gz | tar -xz -C "$HOME/.local/bin/" awsprofile
    ```

3. > If you use `bash`, you can edit `~/.profile` or `~/.bash_profile`. If you use `zsh`, you can edit `~/.zshrc`. Impliment either of the following methods:

    **Method 1:** Source the file wherever you saved it.

    ```bash
    source /path/to/awsprofile
    ```

    **Method 2:** Make sure `~/.local/bin/` is part of your environment path.

    ```bash
    export PATH="$HOME/.local/bin:$PATH"
    ````

## Initial Configuration

You need to change the structure of your `~/.aws/` folder contents. Currently, you should have two files in that folder:

```text
config
credentials
```

Copy the profile data from each of those files, and combine the content of both to create a single config.\* file for each of your profiles. For example:

```text
config.personal
config.work
config.whatever
```

Make sure the first line in each of the above files begins with:

```text
[default]
```

The content of each of those config files should look similar to this:

```text
[default]
aws_access_key_id=AK##################
aws_secret_access_key=8t######################################
region=us-west-1
output=json
```

> **Note:** You can also separate the credentials from your config files if you prefer. Keep [default] as the first line in each credential file. If you choose to do this, your ~/.aws/ directory may look like:

```text
config.personal
config.work
config.whatever
credentials.personal
credentials.work
credentials.whatever
```

Once you do this, your `aws` command will no longer work, since it's looking for the `~/.aws/config` and optionally `~/.aws/credentials` files that no longer exist. But that's where this utility comes in.

`awsprofile` allows for easy symlinking of these new files back to the original `/.aws/config` and optionally `~/.aws/credentials` files that the `aws` CLI utility is looking for.

## How it Works

After we run `awsprofile --set personal` this is what your `~/.aws/` directory will look like:

```bash
config -> /Users/myname/.aws/config.personal
config.personal
config.work
config.whatever
```

Note that there's now a `config` file in that folder, and it is symlinked to your `config.personal` file.

Run `awsprofile --set work` and your directory now looks like this:

```bash
config -> /Users/myname/.aws/config.work
config.personal
config.work
config.whatever
```
