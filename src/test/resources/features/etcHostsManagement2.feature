@rest
Feature: /etc/hosts management tests without restoring file and releasing lock

  Scenario: Modify /etc/hosts in remote SSH connection
    # Check we can add entry
    Given I open a ssh connection to '${SSH}' with user 'root' and password 'stratio'
    And I run 'cat /etc/hosts' in the ssh connection and save the value in environment variable 'initialHostsFile'
    When I save host 'bdt3.stratio.com' with ip '3.3.3.3' in /etc/hosts in the ssh connection
    And I run 'cat /etc/hosts' in the ssh connection
    Then the command output contains '3.3.3.3   bdt3.stratio.com'
    # Check backup file and lock file have been created
    When I obtain java pid and save the value in environment variable 'javaPID'
    And I run 'ls -al /etc | grep hosts' in the ssh connection
    Then the command output contains 'hosts.bdt'
    And the command output contains 'hosts.lock.!{javaPID}'
    # Check backup has not been modified
    When I run 'cat /etc/hosts.bdt' in the ssh connection and save the value in environment variable 'hostsFileBackup'
    Then the command output does not contain '3.3.3.3   bdt3.stratio.com'
    And '!{initialHostsFile}' is '!{hostsFileBackup}'

  Scenario: Modify /etc/hosts locally
    # Check we can add entry
    Given I run 'cat /etc/hosts' locally and save the value in environment variable 'initialHostsFile'
    When I save host 'bdt3.stratio.com' with ip '3.3.3.3' in /etc/hosts
    And I run 'cat /etc/hosts' locally
    Then the command output contains '3.3.3.3   bdt3.stratio.com'
    # Check backup file and lock file have been created
    When I obtain java pid and save the value in environment variable 'javaPID'
    And I run 'ls -al /etc | grep hosts' locally
    Then the command output contains 'hosts.bdt'
    And the command output contains 'hosts.lock.!{javaPID}'
    # Check backup has not been modified
    When I run 'cat /etc/hosts.bdt' locally and save the value in environment variable 'hostsFileBackup'
    Then the command output does not contain '3.3.3.3   bdt3.stratio.com'
    And '!{initialHostsFile}' is '!{hostsFileBackup}'