# DPL

Fork this repository and clone your newly created repository. At the end of the challenge, push your code to your repository and create a pull request to this repository.

## Be sure to read all user stories BEFORE beginning your work
---

## Setup

* Fork this repository
* Clone down your forked repository
* Perform the usual setup steps after cloning a Rails application:
  - `bundle install`
  - `rails db:{create,migrate,seed}`
---

### Submission

When you have completed this challenge, submit by creating a Pull Request back to the turingschool-examples repo. Include the following information:

* Your Name
* A reflection on how you felt you did with this challenge and what story you got through
---
### Requirements

* TDD all new work
* any model METHODS you write must be fully tested.
* any model RELATIONSHIPS you create must be fully tested.
---
### Not Required

* No visual styling is required or expected
* No model testing for validations are required
---

### Challenge Description

DPL is an app that tracks Libraries, the books that they have, and the authors of those books. Libraries have many books. Books belong to a Library. Books have many Authors and Authors have many Books. Authors should have a name and birth year.

Two migrations have been made for you. The one to many relationship has been set up. You will need to create migrations for the many to many relationship between books and authors. You do not need to do model testing for validations, just make sure you test any relationships and model methods that you create.


(Note: The plural of Library is Libraries.)

## User Stories

```
Story 1 of 3
As a visitor, when I visit a book's show page
I see the book's name and genre
And I see a list of authors for that book.
And I see the name of the Library it belongs to
```

```
Story 2 of 3
As a visitor
when I visit a book's show page
I see the average age of the authors for that book
```

```
Story 3 of 3
As a visitor
When I visit a Library's show page
I see the name of that library
and i see a link to view all of the authors that have written books that the library has
When I click on that link
I am taken to a Library's authors index page 
and I can see a unique list of names of all the authors that this library has
```

```
Extension
As a visitor
When I visit a library's show page
I can see the three most popular authors that are available in the library
(Popularity is based on how many books the author has in the library)
```
