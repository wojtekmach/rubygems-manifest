# Rubygems::Manifest

[![Build Status](https://secure.travis-ci.org/wojtekmach/rubygems-manifest.png?branch=master)](http://travis-ci.org/wojtekmach/rubygems-manifest)

Create Manifest.txt with the list of files of the current project

## Installation

    $ gem install rubygems-manifest

## Usage

Start a new project:

    $ mkdir example ; cd example
    $ touch a.txt
    $ manifest 
    >> Manifest is empty

Save manifest:

    $ git add .
    $ manifest
    >> Manifest.txt
    >> a.txt
    >> Manifest saved successfully

Check manifest:

    $ touch b.txt
    $ git add .
    $ manifest check
    >> Difference:
    >>
    >> -b.txt
    >>
    >> Manifest is invalid

    $ manifest save
    >> Manifest.txt
    >> a.txt
    >> b.txt
    >> Manifest saved successfully

    $ manifest check
    >> Manifest.txt
    >> a.txt
    >> b.txt
    >> Manifest is valid

See

    $ manifest --help

## Example scripting

### Run each test separately

    $ for i in $(manifest tests); do ruby -Ilib -Itest $i ; done

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
