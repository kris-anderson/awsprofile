Describe 'awsprofile'

    Include bin/awsprofile

    Describe 'no command provided'
        It 'prints an warning that no command was provided'
            When call ./bin/awsprofile
            The status should be failure
            The output should include "** Warning **"
        End
    End

    Describe 'arrow_icon()'
        It 'outputs arrow icon and provided text'
            When call arrow_icon test
            The line 1 should eq "${BOLD}${YELLOW} ⇒ ${RESET}test"
            The lines of output should eq 1
        End
    End

    Describe 'print_warning()'
        It 'outputs warning text'
            When call print_warning test
            The line 1 should eq "${BOLD}${YELLOW}** Warning **${RESET}"
            The line 2 should eq "test"
            The lines of output should eq 2
        End
    End

    Describe 'print_error()'
        It 'outputs error text'
            When call print_error test
            The line 1 should eq "${BOLD}${RED}** Error **${RESET}"
            The line 2 should eq "test"
            The lines of output should eq 2
        End
    End

    Describe 'ok()'
        It 'outputs [ok]'
            When call ok
            The line 1 should eq "${BOLD}${GREEN}[ok]${RESET}"
            The lines of output should eq 1
        End
    End

    Describe 'failed()'
        It 'outputs [failed]'
            When call failed
            The line 1 should eq "${BOLD}${RED}[failed]${RESET}"
            The lines of output should eq 1
        End
    End

    Describe 'error()'
        It 'outputs [error]'
            When call error
            The line 1 should eq "${BOLD}${RED}[error]${RESET}"
            The lines of output should eq 1
        End
    End

    # Describe 'get_profiles()'
    #     It 'outputs profile information'
    #         When call get_profiles
    #         The status should be success
    #     End
    # End

    Describe 'no_command_provided()'
        It 'it tests as successful because no command was provided'
            When call no_command_provided
            The status should be success
        End

        It 'tests as failed because a command was provided'
            When call no_command_provided test
            The status should be failure
        End
    End

    Describe 'empty_input()'

        It 'it tests as successful because no input was provided'
            When call empty_input
            The status should be success
        End

        It 'tests as failed because a input was provided'
            When call empty_input test
            The status should be failure
        End

    End

End
