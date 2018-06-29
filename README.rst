TravisExperiment
################

A little experiment with Travis CI features and capabilities.

Goals:

- Enable Travis CI to work with multiple projects in different languages, all in a single repo
- Deploy to a generic server using SSH
- Hide server IP address

What I learned:

- | Currently for the "script" providers, there can only be 1 command in the "script" section
  | Otherwise deploy fails with something like `/home/travis/.rvm/gems/ruby-2.2.7/gems/dpl-1.9.7/lib/dpl/cli.rb:54:in `system': wrong first argument (ArgumentError)`
- | Environment variables can be encrypted in two ways:
  | `travis encrypt <VAR_NAME>=<VAR_VALUE>` and `travis encrypt <VAR_VALUE>`
  | First way doesn't seem to work with the `ssh_known_hosts` section, so use the second way and insert the result as shown in `.travis.yml` here.

Materials used:

#. https://oncletom.io/2016/travis-ssh-deploy
#. https://github.com/travis-ci/travis-ci/issues/7043
#. https://stackoverflow.com/questions/27644586/how-to-set-up-travis-ci-with-multiple-languages
#. https://docs.travis-ci.com
