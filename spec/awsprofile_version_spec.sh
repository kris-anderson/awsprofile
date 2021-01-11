Describe 'awsprofile --version'

  Describe 'version command'
    It 'prints version information'
      When call ./bin/awsprofile --version
      The status should be success
      The output should include "__release_version__"
    End
  End

End
