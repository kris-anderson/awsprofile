Describe 'awsprofile initial-setup'

    Describe 'initial-setup command'
        It 'prints initial setup instructions'
            When call ./bin/awsprofile initial-setup
            The status should be success
            The output should include "Take the content from these files:"
        End
    End

End
