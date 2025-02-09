# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)

# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)



# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# Query movies and their associated roles


# Loop through the movies and display their information
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
# DON'T CHANGE OR MOVE
Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all
Rails.logger.info "------------------------"
Rails.logger.info "----- FRESH START! -----"
Rails.logger.info "------------------------"
# Generate models and tables, according to the domain model.
# TODO!

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!
# Insert Studio
Studio.create(name: 'Warner Bros.')

# Insert Movies
Movie.create(title: 'Batman Begins', year_released: 2005, rated: 'PG-13', studio_id: 1)
Movie.create(title: 'The Dark Knight', year_released: 2008, rated: 'PG-13', studio_id: 1)
Movie.create(title: 'The Dark Knight Rises', year_released: 2012, rated: 'PG-13', studio_id: 1)

# Insert Actors
Actor.create(name: 'Christian Bale')
Actor.create(name: 'Michael Caine')
Actor.create(name: 'Liam Neeson')
Actor.create(name: 'Katie Holmes')
Actor.create(name: 'Gary Oldman')
Actor.create(name: 'Heath Ledger')
Actor.create(name: 'Aaron Eckhart')
Actor.create(name: 'Maggie Gyllenhaal')
Actor.create(name: 'Tom Hardy')
Actor.create(name: 'Joseph Gordon-Levitt')
Actor.create(name: 'Anne Hathaway')

# Insert Roles
# Batman Begins
Role.create(actor_id: 1, movie_id: 1, character_name: 'Bruce Wayne')
Role.create(actor_id: 2, movie_id: 1, character_name: 'Alfred')
Role.create(actor_id: 3, movie_id: 1, character_name: "Ra's Al Ghul")
Role.create(actor_id: 4, movie_id: 1, character_name: 'Rachel Dawes')
Role.create(actor_id: 5, movie_id: 1, character_name: 'Commissioner Gordon')

# The Dark Knight
Role.create(actor_id: 1, movie_id: 2, character_name: 'Bruce Wayne')
Role.create(actor_id: 6, movie_id: 2, character_name: 'Joker')
Role.create(actor_id: 7, movie_id: 2, character_name: 'Harvey Dent')
Role.create(actor_id: 2, movie_id: 2, character_name: 'Alfred')
Role.create(actor_id: 8, movie_id: 2, character_name: 'Rachel Dawes')

# The Dark Knight Rises
Role.create(actor_id: 1, movie_id: 3, character_name: 'Bruce Wayne')
Role.create(actor_id: 5, movie_id: 3, character_name: 'Commissioner Gordon')
Role.create(actor_id: 9, movie_id: 3, character_name: 'Bane')
Role.create(actor_id: 10, movie_id: 3, character_name: 'John Blake')
Role.create(actor_id: 11, movie_id: 3, character_name: 'Selina Kyle')
# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""
movies = Movie.select('title')
movies.each do |movie|
    put "#{movie.title}"
end
# Query the movies data and loop through the results to display the movies output.
# TODO!
movies = Movie.joins('INNER JOIN roles ON roles.movie_id = movies.id')
            .joins('INNER JOIN actors ON roles.actor_id = actors.id')
            .joins('INNER JOIN studios ON movies.studio_id= studios.id')
            .select('movies.title, movies.year_released, movies.rated, studios.name AS studio_name')
movies.each do |movie|
    puts "#{movie.title} #{movie.year_released} #{movie.rated} #{movie.studio.name}"
end
# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
#roles = Role
#roles.each do |role|
#    puts "# #{role.movie.id} #{role.actor.name} #{role.character_name}"
#end