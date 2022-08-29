Write a CRUD application that will function as an “Address Book” kind of app

IMPORTANT: Write tests for the app, we will look at these closely (these include
your own tests, not just the generated ones)
Make sure that these tests are passing and your application works

Create (please note the relationships):

Entities (4) with the following attributes:

Person
  Person Attributes:
    Salutation (a list of Mr., Mrs., Ms.)
    First Name (Required; i.e. user must provide)
    Middle Name (Optional; i.e. user does not have to
    provide)
    Last Name (Required)
    SSN (Optional)
    Birth Date (actual date function) (Optional)
    Comment (Text-area; optional)

Address
  Address Attributes
    Street (Required)
    Town (Required)
    ZIP Code (Required)
    State (Optional)
    Country (List of Countries)
    There needs to be a 1:M relation between People and
    Addresses

Email
  Email Attributes:
    Email Address (Required)
    Comment (Text-area; optional)
    There needs to be a 1:M relation between Person and Email
    
Phone Number
  Phone Attributes:
    Phone Number (Required)
    Comment (Text-area; optional)
    There needs to be a 1:M relation between Person and Phone

Each Entity should be Created, Read, Updated, and Deleted

Implement AJAX for these CRUD operations (or, at least for Create and
Update) - you CAN use jQuery with Rails

Implement simple authorization and authentication from scratch (no gems)
(signup / signin)

Application should also work as an API and accept / send requests / responses via
JSON

Use Bootstrap (https://getbootstrap.com/) for CSS to make the UI pleasant

The application needs to be responsive (usable on small screens, i.e. mobile
devices)

For Data Persistence, use PostgreSQL database

Data types should be correspondent to their field and the type of data
being entered

Versions: Use the latest stable Rails and PostgreSQL database
