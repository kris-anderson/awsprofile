Describe 'awsprofile doctor'

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

    Describe 'checks required utilities are installed'

        It 'prints ok basename'
            When call ./bin/awsprofile doctor
            The status should be success
            The output should include "[ok] basename"
        End

        It 'prints ok find'
            When call ./bin/awsprofile doctor
            The status should be success
            The output should include "[ok] find"
        End

        It 'prints ok readlink'
            When call ./bin/awsprofile doctor
            The status should be success
            The output should include "[ok] readlink"
        End

        It 'prints ok realpath'
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
