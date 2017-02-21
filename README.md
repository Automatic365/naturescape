[![Code Climate](https://codeclimate.com/github/Automatic365/naturescape/badges/gpa.svg)](https://codeclimate.com/github/Automatic365/naturescape)

![](http://i68.tinypic.com/2q1t151.jpg)

**Live Demo: https://naturescape.herokuapp.com/**

## About
A website for users to find indoor activities near camping and hiking locations.

After querying the Trails API, the user's location will be passed to the Google Places API to identify nearby indoor locations based on the user's preferences. 

## Usage
After cloning or forking the project, bundle:
```
bundle
```
and initialize the database:
```
rake db:{create,migrate}
```

Launch a server
```
rails s
```
Explore.

