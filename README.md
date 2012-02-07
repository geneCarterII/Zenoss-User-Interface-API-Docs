Zenoss User Interface API Docs
========

Zenoss Core Javascript API Docs

by Zenoss Inc.
<http://www.zenoss.com/>

Installation
------------

This documentation is generated using JSDuck in the same way that the extjs api docs are. [JS Duck Source Code](https://github.com/senchalabs/jsduck).

To install JSDuck simply run

    $ [sudo] gem install jsduck


Here are a couple of links about how to write documentation us JSDuck:

[Guide to writing Javascript doc strings](https://github.com/senchalabs/jsduck/wiki/Guide)


[How to write Guides and videos etc](https://github.com/senchalabs/jsduck/wiki/Advanced-Usage)

Generating Documentation
------------

To generate the documentation first install jsduck and then run the following command:

    $./generate.sh

from the this directory. The script expects $ZENHOME to be set as it symlinks the core Javascript directory.


This will generate the documentation for both our Zenoss JavaScript as well as the ExtJS core JavaScript. This is so that you can see all the properties
of our zenoss components as well as the ones they inherit.
