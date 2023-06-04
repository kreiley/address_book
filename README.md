I have successfully completed a CRUD (Create, Read, Update, and Delete) application designed to function as an "Address Book" application.

A key feature I implemented was an extensive testing suite for the app. The tests, which I designed myself beyond just the generated ones, were thoroughly checked to ensure they passed and that the application functioned properly.

I created four entities, each with specific attributes. These include:

Person - I included various attributes such as Salutation (offering options such as Mr., Mrs., Ms.), First Name (made compulsory), Middle Name (optional), Last Name (compulsory), SSN (optional), Birth Date (with actual date function) (optional), and Comment (optional text-area).

Address - I added attributes such as Street, Town, and ZIP Code, all of which are compulsory. State was made optional, and I provided a list of countries for the 'Country' attribute. I established a one-to-many relationship between people and addresses.

Email - I included Email Address as a required attribute and added an optional Comment text area. I also established a one-to-many relationship between a person and their email addresses.

Phone Number - The Phone Number attribute was made compulsory, and an optional Comment text area was included. I instituted a one-to-many relationship between a person and their phone numbers.

For each entity, I provided the capacity for the information to be created, read, updated, and deleted.

Incorporating AJAX for these CRUD operations (at least for Create and Update) was accomplished, using jQuery with Rails to assist in this functionality.

Furthermore, I implemented simple authorization and authentication from scratch, enabling features such as signup and sign-in without using external gems.

I ensured the application could also function as an API, capable of accepting and sending requests and responses via JSON.

I utilized Bootstrap for CSS to make the user interface more pleasant and user-friendly.

Taking into account a variety of device users, I made the application responsive to be usable on small screens, such as mobile devices.

For Data Persistence, I employed a PostgreSQL database, ensuring the data types corresponded to their field and the type of data being entered.

Lastly, I used the latest stable versions of Rails and PostgreSQL database throughout the project development.
