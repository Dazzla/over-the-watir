over the watir
==============

Cucumber flavoured automated watir-webdriver acceptance testing for travel industry web applications. 
The intention is to build a customisable cucumber testing framework for fast deployment on travel web development projects

Status:
-------
The Configurator has been removed as an extraneous class and FlightSearchPage is no longer subclassed. Both of these classes split coherent methods.
Explicitly declared instance variables have been removed from FlightSearchPage. instance_variable_set is used in its place.

TODO:
 
* ~~Put field elements in config files~~ DONE


* Investigate white-labelling
  1. Add config for different site


* Add more scenarios


* Expand for full packages
  1. Hotels
  1. Packages


* Get FlightSearchPage methods into subclasses.
1. Possibly organise methods by element class