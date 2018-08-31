## Tree Top Engineering Problem:

The question below is meant to give candidates a sense of the sort of work we do. Please submit solutions in the form of a readme + working code. The problems should take under 3 hours to complete. Code may be in any language.

Write an API endpoint that returns a filtered set of organizations from the data provided:

[organization_sample_data.csv](https://s3-us-west-2.amazonaws.com/sample-coding-dataset/organization_sample_data.csv)

Example API: 
> GET /organizations?category=Greek&city=Washington

Fields: 
* Id: numeric id 
* Name: string //organization name 
* City: string //US city name 
* State: string //US state name 
* Postal: string //US postal code 
* Category: string //categorization of org

Additional query params: 
* Orderby: string //fieldname to order the results by 
* Direction: string //ASC or DSC

The expected response is a JSON collection of organizations: {

```json
"organizations": [
{
"id":"102", "name":"Sigma Kappa Zeta Chapter", "city":"Washington", "state":"DC", "postal":"20052", "category":"Greek" }, ... ] }
```

All query parameters are optional.

At a minimum: 
* Your API endpoint URL is /organizations 
* Your API should correctly filter any combination of API parameters 
* Results should be properly ordered if the orderby parameter is included

When you're done, push your code to a GitHub repository and send us the link. Also, please include a brief write-up in a README on what else you'd want to improve or add if you were going to spend more time on it, along with instructions for building and executing the program on either Linux or MacOS.


### Thoughts on approach to challenge

I am using Rails to create the API application (https://guides.rubyonrails.org/api_app.html)
At first I thought not to use Rails, as it appears to be so "dev bootcampy" but I am
1) comfortable with Ruby and Rails, this approach gives me a lot so I can
2) focus on the challenge at hand.

So the first thing I think about, after reading the challenge, is about the data I am to work with.

I look at the .csv and start designing the data schema.

I see two distinct models in the data - Organization and Category

So let's start with the data.
Create the models and let's store the data from the .csv into a database.



I started with a Category and Organizations model with a many-to-many relation between
the two, but after reading the task once again decided to make this very simple
and have the category just be an attribute of the Organization model.

This is one thing that I would improve on to allow more than one category per organization
but let's focus on the task at hand - creating the api with filters.



I've normalized the data from the csv
(titleized the values, change "NULL" to null, stripped whitespace)
and did not import duplicate records (name, postal, and category all match)
I think it is clear in the challenge that id is not a field to be used
as a query parameter, at least I read that as that field does not have a //
after the value and who would actually know the identifier.
If a client requested an organization with an id filter I would expect that
client to be using a different endpoint than "/organizations"
more like "/organizations/:id"

The data loader outputs all invalid records to a data/import_errors file
so we know which records were not imported.



The "/organizations" endpoint is a simple query to the database with an
optional SQL where clause or order clause based on the URL query parameters.

It is not dynamically extensible but I think that the organization filters are
clearly laid out. This might be another thing to improve. 

## Prerequisites

This is a Ruby application and you will need this language runtime. 

The application was developed and tested to the version of ruby in the `.ruby-version` file.

A package manager is preferred so that the `.ruby-version` file is recognized but there is nothing 
version specific about this application so any recent Ruby version should work.

See https://www.ruby-lang.org/en/documentation/installation/ on instructions for your Operating System.

Also this application does require a few gems and frameworks, I did choose a Rails app, so after installing Ruby
you will need the dependency management gem `bundler`

Running `gem install bundler` should suffice. 

Finally running `./bin/setup` will create all the rest of the necessary pieces. 

## Usage

`./bin/rails server` will get the application running on port `:3000`. 

Open a browser or make a command line request (e.g. curl) to 
[http://localhost:3000/organizations](http://localhost:3000/organizations) 
to see the json output from the "/organizations" endpoint.

Add query parameters to verify filtering and ordering/sorting. 

## Test suite and code coverage

`bundle exec rspec spec` will run the test suite and output the tests.

`open coverage/index.html` will open a browser with the test coverage.