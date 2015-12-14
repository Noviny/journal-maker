- Add MANY articles at once, do a mass upload

Add book links to second page to add articles to book.

- Allow chapters to be added to books, articles to be added to chapters
- Make Book status mean anything (when visiting their show page)( 'new', 'editing', 'binding', 'published') (also I guess whether they are shown in 'all books')
- Viewable setting toggle option (nope, paid feature)

-Nokogiri to run through multiple objects

TOPICS
- Now its own table. Sort this out sometime.
- lots of has_and_belongs_to_many (articles, books, )
- Fuck it, learn how to use tags maybe?


- Bootstrap. This will take forever


  - can we use Nokogiri to simplify this so they just provide urls and we grab all the details?
    - Only if we set it up for the site so it knows what to find.
- Books form must be able to include articles form

- Authors and sources need the D in CRUD
- Articles apparently have no D?

- Articles _form need an author and source field
  - this needs to add authors and sources correctly if they don't exist, rather than checkbox or dropdown

Add the 'D' to CRUDs all around (articles, books)
Add admin boolean to users
Lock people out of D-ing any articles, books not theirs