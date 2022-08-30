# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

people = Person.create([
    {
        salutation: "Mr.",
        first_name: "Kyle",
        middle_name: "Brannon",
        last_name: "Reiley",
        ssn: "111111111",
        birth_date: "07/09/1993".to_date,
        comment: "Hello World!"
    },
    {
        salutation: "Ms.",
        first_name: "Katy",
        middle_name: "Marie",
        last_name: "Bleyl",
        ssn: "111111112",
        birth_date: "25/01/1994".to_date,
        comment: "I'm an artist."
    },
    {
        salutation: "Ms.",
        first_name: "Emilie",
        middle_name: "Joy",
        last_name: "Bufkin",
        ssn: "111111113",
        birth_date: "01/12/1993".to_date,
        comment: "I live with Kyle."
    },
    {
        salutation: "",
        first_name: "Daniel",
        middle_name: "",
        last_name: "Liu",
        ssn: "111111114",
        birth_date: "25/11/1995".to_date,
        comment: "I play volleyball."
    },
    {
        salutation: "Mrs.",
        first_name: "Natalie",
        middle_name: "",
        last_name: "DeLeon",
        ssn: "111111115",
        birth_date: "04/02/1994".to_date,
        comment: "I am married to Alex."
    },
    {
        salutation: "Mr.",
        first_name: "Alex",
        middle_name: "Darcey",
        last_name: "Gonzalez",
        ssn: "111111116",
        birth_date: "06/06/1991".to_date,
        comment: "I am married to Natalie."
    }
])

addresses = Address.create([
    {
        street: "2408 Manor Rd. Apt 201",
        town: "Austin",
        zip_code: "78722",
        state: "TX",
        country: "United States",
        person: people.first
    },
    {
        street: "2506 Manor Rd. Apt 205",
        town: "Austin",
        zip_code: "78722",
        state: "TX",
        country: "United States",
        person: people.first
    },
    {
        street: "1101 Heights Ave.",
        town: "San Antonio",
        zip_code: "78700",
        state: "TX",
        country: "United States",
        person: people.second
    },
    {
        street: "2408 Manor Rd. Apt 201",
        town: "Austin",
        zip_code: "78722",
        state: "TX",
        country: "United States",
        person: people.third
    }
])

emails = Email.create([
    {
        email_address:"kreiley6@gmail.com",
        comment:"primary",
        person: people.first
    },
    {
        email_address:"kyle@kylereiley.com",
        comment:"secondary",
        person: people.first
    },
    {
        email_address:"emiliebufkin@gmail.com",
        comment:"primary",
        person: people.third
    }

])

phones = Phone.create([
    {
        phone_number:"9795419228",
        comment:"cell",
        person: people.first
    },
    {
        phone_number:"8327153303",
        comment:"Cellular",
        person: people.third
    },
    {
        phone_number:"8795419224",
        comment:"cellphone",
        person: people.second
    }

])

users = User.create([
    {
        name:"Kyle",
        email:"kreiley6@gmail.com",
        password:"password",
        password_confirmation:"password"
    }
])


