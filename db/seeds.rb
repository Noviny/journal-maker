Article.destroy_all

a1 = Article.create :heading => 'The Blank Page', :url => 'http://magic.wizards.com/en/articles/archive/making-magic/blank-page-2015-11-23'
a2 = Article.create :heading => 'Concept vs Execution', :url => 'http://magic.wizards.com/en/articles/archive/making-magic/concept-vs-execution-2015-10-19'
a3 = Article.create :heading => "It's not easy being Green", :url => 'http://magic.wizards.com/en/articles/archive/making-magic/its-not-easy-being-green-2002-10-21-0'
a4 = Article.create :heading => 'Seeing Red', :url => 'http://magic.wizards.com/en/articles/archive/making-magic/seeing-red-2004-07-12'
a5 = Article.create :heading => 'The great White Way', :url => 'http://magic.wizards.com/en/articles/archive/making-magic/great-white-way-2003-02-03'
a6 = Article.create :heading => 'True Blue', :url => 'http://magic.wizards.com/en/articles/archive/making-magic/true-blue-2003-08-11'
a7 = Article.create :heading => 'In the Black', :url => 'http://magic.wizards.com/en/articles/archive/making-magic/black-2004-02-02'

Book.destroy_all

b1 = Book.create :name => 'Design'
b2 = Book.create :name => 'Game Design'
b3 = Book.create :name => 'Magic Color Pie'

User.destroy_all

u1 = User.create :name => 'Noviny', :email => 'benjaminconolly@gmail.com'