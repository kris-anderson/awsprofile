% AWSPROFILE(1) __release_version__
% Kris Anderson
% __release_date__

# NAME

awsprofile - easy switching between your multiple AWS profiles

# SYNOPSIS

awsprofile --set *profile_name*

# DESCRIPTION

Switch from using a single *credential* and *config* file, to having unique files for each of your profiles.

Lightweight - Will not slow down your terminal.

Simple - It is a symlink manager that you opperate via CLI.

100% open source - You can look at the code and see what's going on.

# REQUIREMENTS

Awsprofile is out of the box portable. It runs under any Unix-like stack: macOS, Linux, *BSD, and WSL. It runs as under /bin/sh and is fully POSIX compatible. Standard utilities like command, basename, find, readlink, realpath and tr are also needed.

# OPTIONS

**-c**, **-\-current**
: print current profile

**-d**, **--doctor**
: checks for potential problems

**-h**, **-\-help**
: print help message

**-l**, **-\-list**
: list available profiles

**-s** *profile_name*, **-\-set** *profile_name*
: set profile to *profile_name*

**-v**, **-\-version**
: print version info

# EXAMPLES

**awsprofile -\-set personal**
: set profile to personal, which uses *~/.aws/config.personal* and optionally *~/.aws/credentials.personal*

**awsprofile -\-set work**
: set profile to work, which uses *~/.aws/config.work* and optionally *~/.aws/credentials.work*

**awsprofile -\-current**
: prints the currently used profile

# INITIAL CONFIGURATION

You need to change the structure of your *~/.aws/* folder contents. Currently, you should have two files in that folder:

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

**Note:** You can also separate the credentials from your config files if you prefer. Keep [default] as the first line in each credential file. If you choose to do this, your ~/.aws/ directory may look like:

```text
config.personal
config.work
config.whatever
credentials.personal
credentials.work
credentials.whatever
```

Once you do this, your *aws* command will no longer work, since it's looking for the *~/.aws/config* and optionally *~/.aws/credentials* files that no longer exist. But that's where this utility comes in.

*awsprofile* allows for easy symlinking of these new files back to the original */.aws/config* and optionally *~/.aws/credentials* files that the *aws* CLI utility is looking for.

# HOW IT WORKS

After we run *awsprofile --set personal* this is what your *~/.aws/* directory will look like:

```bash
config -> /Users/myname/.aws/config.personal
config.personal
config.work
config.whatever
```

Note that there's now a *config* file in that folder, and it is symlinked to your *config.personal* file.

Run *awsprofile --set work* and your directory now looks like this:

```bash
config -> /Users/myname/.aws/config.work
config.personal
config.work
config.whatever
```

# SEE ALSO

The source is available at:

<https://github.com/kris-anderson/awsprofile>

# REPORTING BUGS

Report bugs through ths GitHub repository:

<https://github.com/kris-anderson/awsprofile>

# COPYRIGHT

The MIT License (MIT)

# AUTHOR

Kris Anderson (kris.anderson@awsprofile.mrsudo.com)
