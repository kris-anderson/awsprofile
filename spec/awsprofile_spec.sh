Describe 'awsprofile'

  Describe 'no command provided'
    It 'prints an warning that no command was provided'
      When call ./bin/awsprofile
      The status should be failure
      The output should include "** Warning **"
    End
  End

End
