Describe 'awsprofile help'

    Describe 'help command'
        It 'prints help information'
            When call ./bin/awsprofile help
            The status should be success
            The output should include "awsprofile <command> [options]"
        End
    End

End
