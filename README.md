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



Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
