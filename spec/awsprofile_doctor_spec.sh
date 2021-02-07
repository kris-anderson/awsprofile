Describe 'awsprofile --doctor'

  #
  # basic checks
  #

  Describe 'command responds'

    It 'checks for the correct ouput'
      When call ./bin/awsprofile doctor
      The status should be success
      The output should include "Checking for required command line utilities"
    End

  End

  #
  # package checks
  #

  # basename

  Describe 'checks that utility basename is installed'

    It 'prints basename ok'
      When call ./bin/awsprofile doctor
      The status should be success
      The output should include "[ok] basename"
    End

    command() { return 1; }

    It 'prints basename failed'
      When run source ./bin/awsprofile doctor
      The status should be success
      The output should include "[failed] basename"
    End

  End

  # find

  Describe 'checks that utility find is installed'

    It 'prints find ok'
      When call ./bin/awsprofile doctor
      The status should be success
      The output should include "[ok] find"
    End

    # command() { return 1; }
    Mock test_if_utility_installed
      if [ "$1" = "find" ]; then
        exit 1
      else
        echo "command: command not found" >&2
        exit 127
      fi
    End

    # It 'prints find failed'
    #   When run source ./bin/awsprofile doctor
    #   The status should be success
    #   The output should include "$(printf "find [failed]")"
    # End

    # It 'prints correct output'
    #   When call test_if_utility_installed "dsds"
    #   The status should be failure
    # End

  End

  Describe 'others tests'

    It 'prints readlink ok'
      When call ./bin/awsprofile doctor
      The status should be success
      The output should include "[ok] readlink"
    End

    It 'prints realpath ok'
      When call ./bin/awsprofile doctor
      The status should be success
      The output should include "[ok] realpath"
    End

    It 'prints credentials should not exist ok'
      When call ./bin/awsprofile doctor
      The status should be success
      The output should include "[ok] credentials should not exist"
    End

    It 'prints credentials should not exist ok'
      When call ./bin/awsprofile doctor
      The status should be success
      The output should include "[ok] credentials should not exist"
    End

    # Intercept begin
    # __begin__() {
    #   test() {
    #     if [ "$1" = "-f" ] && [ "$2" = "$HOME/.aws/credentials" ]; then
    #       return 0
    #     else
    #       return 1
    #     fi
    #   }
    # }

    # It 'prints credentials should not exist'
    #   When run source ./bin/awsprofile --doctor
    #   The output should include "$(printf "credentials should not exist [failed]")"
    # End

    It 'prints config should not exist ok'
      When call ./bin/awsprofile doctor
      The status should be success
      The output should include "[ok] config should not exist"
    End

  End

End
