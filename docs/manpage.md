% AWSPROFILE(1) **release_version**
% Kris Anderson
% **release_date**

# NAME

awsprofile - easy switching between your multiple AWS profiles

# SYNOPSIS

awsprofile set _profile_name_

# DESCRIPTION

Switch from using a single _credential_ and _config_ file, to having unique files for each of your profiles.

Lightweight - Will not slow down your terminal.

Simple - It is a symlink manager that you opperate via CLI.

100% open source - You can look at the code and see what's going on.

# REQUIREMENTS

Awsprofile is out of the box portable. It runs under any Unix-like stack: macOS, Linux, \*BSD, and WSL. It runs as under /bin/sh and is fully POSIX compatible. Standard utilities like command, basename, find, readlink, realpath and tr are also needed.

# OPTIONS

**current**
: print current profile

**doctor**
: checks for potential problems

**help**
: print help message

**list**
: list available profiles

**set** _profile_name_
: set profile to [_profile_name_]

**version**
: print version info

# EXAMPLES

**awsprofile set personal**
: set profile to personal, which uses _~/.aws/config.personal_ and optionally _~/.aws/credentials.personal_

**awsprofile set work**
: set profile to work, which uses _~/.aws/config.work_ and optionally _~/.aws/credentials.work_

**awsprofile current**
: prints the currently used profile

# INITIAL CONFIGURATION

You need to change the structure of your _~/.aws/_ folder contents. Currently, you should have two files in that folder:

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

Once you do this, your _aws_ command will no longer work, since it's looking for the _~/.aws/config_ and optionally _~/.aws/credentials_ files that no longer exist. But that's where this utility comes in.

_awsprofile_ allows for easy symlinking of these new files back to the original _/.aws/config_ and optionally _~/.aws/credentials_ files that the _aws_ CLI utility is looking for.

# HOW IT WORKS

After we run _awsprofile set personal_ this is what your _~/.aws/_ directory will look like:

```bash
config -> /Users/myname/.aws/config.personal
config.personal
config.work
config.whatever
```

Note that there's now a _config_ file in that folder, and it is symlinked to your _config.personal_ file.

Run _awsprofile set work_ and your directory now looks like this:

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
