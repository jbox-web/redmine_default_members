## ![logo](https://raw.github.com/jbox-web/redmine_default_members/gh-pages/images/redmine_logo.png) Redmine Default Project Members Plugin

[![GitHub license](https://img.shields.io/github/license/jbox-web/redmine_default_members.svg)](https://github.com/jbox-web/redmine_default_members/blob/devel/LICENSE)
[![GitHub release](https://img.shields.io/github/release/jbox-web/redmine_default_members.svg)](https://github.com/jbox-web/redmine_default_members/releases/latest)
[![Code Climate](https://codeclimate.com/github/jbox-web/redmine_default_members.png)](https://codeclimate.com/github/jbox-web/redmine_default_members)
[![Build Status](https://travis-ci.org/jbox-web/redmine_default_members.svg?branch=devel)](https://travis-ci.org/jbox-web/redmine_default_members)

### A Redmine plugin to add default members on project creation, easy ;)

This plugin allows to create default members on project creation, based on Redmine groups.

## Installation

Assuming that you have Redmine installed :

```sh
## Before install the plugin, stop Redmine!

# Switch user
root# su - redmine

# Clone Redmine Default Members plugin
redmine$ cd REDMINE_ROOT/plugins
redmine$ git clone https://github.com/jbox-web/redmine_default_members.git
redmine$ cd redmine_default_members/
redmine$ git checkout 1.0.0

# Install gems and migrate database
redmine$ cd REDMINE_ROOT/
redmine$ bundle install --without development test

## After install the plugin, start Redmine!
```

## Contribute

You can contribute to this plugin in many ways such as :
* Helping with documentation
* Contributing code (features or bugfixes)
* Reporting a bug
* Submitting translations
