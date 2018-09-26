# updatejenkinsvariables.sh
modifies config.xml files for a bunch of cloned  Jenkins jobs.
1.-Install the script in the Jenkins server.
2.- Create a Jenkins job pointing to it; with string parameters (parameterised)
3.- the execute shell in Jenkins may be like: ~
#!/bin/bash
cd $SCRIPTS
./updatejenkinsvariables.sh $VARIABLE $DESCRIPTION $VALUE
4.- Then go to http://jenkins.jencomart.com/jenkins/manage and Reload Configuration From Disk
