# puppetdash-rundeck

Integrates [Puppet Dashboard](https://docs.puppetlabs.com/dashboard/) with [Rundeck](http://rundeck.org/).


## Requires


## Installation

    cd /var/www
    git clone https://github.com/skylost/puppetdash-rundeck.git
    cd puppetdash-rundeck
    chmod +x bootstrap
    sudo ./bootstrap

or

    bunble install
    thin start


## Usage

Run the puppetdash-rundeck

A list of nodes Puppet Dashboard

    $ curl localhost:3000

You get a list of nodes Puppet Dashboard in XML format
