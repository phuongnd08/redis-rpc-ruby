Changelog
----------
Version 1.0.0

* Now we only have ruby

Version 0.3.5

* Ruby: feature: use multi_json gem  [Ryan Biesemeyer]
* Ruby: feature: server.run! flushes queue but server.run does not  [Ryan Biesemeyer]
* Ruby: performance: only one call to rand instead of eight  [Ryan Biesemeyer]
* Ruby: bugfix: RedisRpc::VERSION  [Ryan Biesemeyer]
* Ruby: security: remove eval  [Ryan Biesemeyer]

Version 0.3.4

* Client now supports optional timeout.
* Server now deletes message queue when starting.
* PHP: Fixed exception handling.

Version 0.3.3

* Ruby: Added a Ruby library implementation.

Version 0.3.2

* Fixed some formatting in README.markdown that was causing problems when
  converted to reStructredText.
* Added version information to README.markdown.
* Added installation instructions to README.markdown.
* Python: Added RPC message logging using the logging module.
* Python: Added redis as an installation dependency.
* Python: Now using Distribute instead of distutils.

Version 0.3.1

* PHP: Changed composer.json predis dependency version.

Version 0.3.0

* Empty function call args and kwargs are no longer transmitted.
* PHP: Added support for the PHP language.
* PHP: Now installable with PHP Composer.
* Python: Shortened the Client and Server class names.
* Python: Debugging modified to print JSON representation.
* Python: Switched the README file back to ReStructred Text.

Version 0.2.1

* Python: Fixed MANIFEST.in to reflect filename changes.

Version 0.2.0

* Simplified the JSON RPC message format.
* Documented the JSON RPC message format.
* Python: Using HTML file for README, will it work?
* Python: Renamed calc_client to client.py.
* Python: Renamed calc_server to server.py.
* Python: Added a RemoteException class, which can be raised by the client.

Version 0.1.2

* Python: Fixed the download_url in setup.py.
* Python: Renamed the README file to README.rst to support browsing on Github.

Version 0.1.1

* Python: Added README.
* Python: Added long_description to setup.py.
* Python: Added MANIFEST.in file.
* Python: Added examples/ subdirectory to MANIFEST.
* Python: Modified examples/ directory to be consistent with README file.
* Python: Fixed the download_url in setup.py.

Version 0.1.0

* Changed to the GPL license.
* Python: Removed unused functionality from python/redisrpc.py.
* Python: Added a setup.py installer script.
