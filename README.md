# GitHub "Clone"

View the deployed application here [GitHub Clone](https://evening-ravine-96663.herokuapp.com)

A "clone" of the GitHub newsfeed and personal profile page.

Uses the GitHub OmniAuth authentication library to authenticate users through GitHub OAuth 2.0.

Consumes GitHub's REST API version 3 to display the user's account information, including:
  * profile picture
  * location
  * email
  * repositories
  * starred repositories
  * followers and following
  * a summary feed of their recent activity and commits.
  * a summary feed of recent activity of users they are following

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

* Rails 5+
* Ruby 2.4 +
* Postgresql

### Installing

Clone down the application and bundle:

```
git clone https://github.com/annaroyer/GH_clone
bundle
```
start rails server
```
rails s
```
visit localhost:3000 in your browser

## Running the tests

To run the tests: 
```
rspec
```
Tests include model and feature specs.

## Built With

* [faraday](https://github.com/lostisland/faraday) - HTTP client library used to make requests to the GitHub Api

## Contributing

I encourage pull requests with contributions and suggestions.

## Acknowledgments

See the original project spec here: [Api Curious](http://backend.turing.io/module3/projects/apicurious) 

