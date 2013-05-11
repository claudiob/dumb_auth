What is DumbAuth
==================

The dumbest authentication gem ever! It works like this ([as specified in the tests](test/controllers/sessions_controller_test.rb)):

* POST to the `login_path` and `logged_in?` will return `true` for the rest of the session
* DELETE to the `logout_path` and `logged_in?` will return `false` for the rest of the session

How to install
==============

Just add the `dumb_auth` gem to your `Gemfile`, bundle, and you will get access to the `login` (POST) route, `logout` (DELETE) route and `logged_in?` method, accessible both in your controllers and helpers.

Note that DumbAuth requires `ApplicationController` to exist in the app where it is installed.

Why is it useful
================

Deciding which (smart) authentication gem to use in a Rails project takes time.
Often, you do not want/need to spend this time at the *beginning* of the project: you simply want to show different pages when the user is logged in or out.
If you start with `DumbAuth`, you get exactly this, without wasting precious time at the beginning of a project.

How to contribute
=================

Fork the project, edit the code, make sure the tests pass by running `rake`, commit and submit a Github pull request.
Thanks! :)

License
=======
This project rocks and uses MIT-LICENSE.