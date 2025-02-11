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
studio = Studio.new
studio["name"] = "Warner Bros."
studio.save

# Insert Movies
movie1 = Movie.new
movie1["title"] = "Batman Begins"
movie1["year_released"] = 2005
movie1["rated"] = "PG-13"
movie1["studio_id"] = studio.id
movie1.save

movie2 = Movie.new
movie2["title"] = "The Dark Knight"
movie2["year_released"] = 2008
movie2["rated"] = "PG-13"
movie2["studio_id"] = studio.id
movie2.save

movie3 = Movie.new
movie3["title"] = "The Dark Knight Rises"
movie3["year_released"] = 2012
movie3["rated"] = "PG-13"
movie3["studio_id"] = studio.id
movie3.save

# Insert Actors
actor1 = Actor.new
actor1["name"] = "Christian Bale"
actor1.save

actor2 = Actor.new
actor2["name"] = "Michael Caine"
actor2.save

actor3 = Actor.new
actor3["name"] = "Liam Neeson"
actor3.save

actor4 = Actor.new
actor4["name"] = "Katie Holmes"
actor4.save

actor5 = Actor.new
actor5["name"] = "Gary Oldman"
actor5.save

actor6 = Actor.new
actor6["name"] = "Heath Ledger"
actor6.save

actor7 = Actor.new
actor7["name"] = "Aaron Eckhart"
actor7.save

actor8 = Actor.new
actor8["name"] = "Maggie Gyllenhaal"
actor8.save

actor9 = Actor.new
actor9["name"] = "Tom Hardy"
actor9.save

actor10 = Actor.new
actor10["name"] = "Joseph Gordon-Levitt"
actor10.save

actor11 = Actor.new
actor11["name"] = "Anne Hathaway"
actor11.save

# Insert Roles for Batman Begins
role1 = Role.new
role1["movie_id"] = movie1.id
role1["actor_id"] = actor1.id # Christian Bale
role1["character_name"] = "Bruce Wayne"
role1.save

role2 = Role.new
role2["movie_id"] = movie1.id
role2["actor_id"] = actor2.id # Michael Caine
role2["character_name"] = "Alfred"
role2.save

role3 = Role.new
role3["movie_id"] = movie1.id
role3["actor_id"] = actor3.id # Liam Neeson
role3["character_name"] = "Ra's Al Ghul"
role3.save

role4 = Role.new
role4["movie_id"] = movie1.id
role4["actor_id"] = actor4.id # Katie Holmes
role4["character_name"] = "Rachel Dawes"
role4.save

role5 = Role.new
role5["movie_id"] = movie1.id
role5["actor_id"] = actor5.id # Gary Oldman
role5["character_name"] = "Commissioner Gordon"
role5.save

# Insert Roles for The Dark Knight
role6 = Role.new
role6["movie_id"] = movie2.id
role6["actor_id"] = actor1.id # Christian Bale again as Bruce Wayne
role6["character_name"] = "Bruce Wayne"
role6.save

role7 = Role.new
role7["movie_id"] = movie2.id
role7["actor_id"] = actor6.id # Heath Ledger as Joker
role7["character_name"] = "Joker"
role7.save

role8 = Role.new
role8["movie_id"] = movie2.id
role8["actor_id"] = actor7.id # Aaron Eckhart as Harvey Dent
role8["character_name"] = "Harvey Dent"
role8.save

role9 = Role.new
role9["movie_id"] = movie2.id
role9["actor_id"] = actor2.id # Michael Caine again as Alfred 
role9["character_name"] = "Alfred"
role9.save

# Role 10: Maggie Gyllenhaal as Rachel Dawes in The Dark Knight
role10 = Role.new
role10["movie_id"] = movie2.id
role10["actor_id"] = actor8.id # Maggie Gyllenhaal
role10["character_name"] = "Rachel Dawes"
role10.save

# Role 11: Christian Bale as Bruce Wayne in The Dark Knight Rises
role11 = Role.new
role11["movie_id"] = movie3.id
role11["actor_id"] = actor1.id # Christian Bale
role11["character_name"] = "Bruce Wayne"
role11.save

# Role 12: Gary Oldman as Commissioner Gordon in The Dark Knight Rises
role12 = Role.new
role12["movie_id"] = movie3.id
role12["actor_id"] = actor5.id # Gary Oldman
role12["character_name"] = "Commissioner Gordon"
role12.save

# Role 13: Tom Hardy as Bane in The Dark Knight Rises
role13 = Role.new
role13["movie_id"] = movie3.id
role13["actor_id"] = actor9.id # Tom Hardy
role13["character_name"] = "Bane"
role13.save

# Role 14: Joseph Gordon-Levitt as John Blake in The Dark Knight Rises
role14 = Role.new
role14["movie_id"] = movie3.id
role14["actor_id"] = actor10.id # Joseph Gordon-Levitt
role14["character_name"] = "John Blake"
role14.save

# Role 15: Anne Hathaway as Selina Kyle (Catwoman) in The Dark Knight Rises
role15 = Role.new
role15["movie_id"] = movie3.id
role15["actor_id"] = actor11.id # Anne Hathaway
role15["character_name"] = "Selina Kyle"
role15.save


# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!
movies = Movie.all
movies.each do |movie|
    studio = Studio.find_by({ "id" => movie.studio_id})
    puts "#{movie.title}".ljust(25) + "#{movie.year_released}".ljust(10) + "#{movie.rated}".ljust(10) + "#{studio["name"]}".ljust(10)
end
# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
roles = Role.all
roles.each do |role|
    movie = Movie.find_by({"id" => role.movie_id})
    actor = Actor.find_by({"id" => role.actor_id})
    puts "#{movie["title"]}".ljust(25) + "#{actor["name"]}".ljust(25) + "#{role.character_name}".ljust(25)
end