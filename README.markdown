Welcome to Filo
===============

Filo is a simple application to store links to stuff on the web that you want to read later.
Yes, it's been *heavily* inspired by Instapaper, and I wrote the version just a few weeks after Instapaper's launch as a means to investigate a few alternatives in shaping the user experience. 

Recently I decided to rewrote the application and move it to Heroku. While I was at it, I also thouth to open source it, so here it is.

Things you may find interesting here:
-------------------------------------

* fully localized, using Rails i18n framework
* iPhone interface, powered by jqTouch
* Heroku ready
* uses thoughtbot's Clearance for authentication. This may change in the future.
* Cucumber stories covering a good deal of the application's features.

Getting started on Heroku
-------------------------

These are the steps if you want to install your own copy of Filo in the cloud:

$ git clone http://github.com/bru/filo.git
$ cd filo
$ heroku create
$ git push heroku master
$ heroku rake db:migrate

TODO 
----

* a lot. I have plenty of stories left in the icebox. Look this space for changes. On the other hand, feel free to fork and creovate.