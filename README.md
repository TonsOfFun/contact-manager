##Objective

The Contact Manager should be able to read our clients’ contact list which they store in

a CSV file. Here is the test data they have provided to us:

INPUT

`first_name,last_name,email,phone`

OUTPUT

`Last: last_name, First: first_name, Phone: phone, E-Mail: email`




##Notes

* Should be a method that allows to find a single contact by email in O(1) time (Hash Lookup is Linear so we'll use that).

* Should be able to print all the contacts which last name starts with a given letter, sorted by the last name.

* Should stand the test of time.

##Usage
Bundle

`bundle`

Run tests

`rspec`
