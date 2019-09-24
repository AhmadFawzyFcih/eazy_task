# Skolera-Task

1-This is a simple application that simulate tracking a trip by save location(longitude and latitude) history:-

2-Task logic assumption :-

   - I have a trip model that contain name, description, Enum of statuses (ongoing, completed) and user_id and trip_history model for saving location history ... default status to trip is ongoing and you can change it to completed but you cann't change completed status to any status ... during the trip we need to track the location of driver so we built an API that store location(longitude, latitude) history so i used Redis to track location history as a cashing layer because if we used mysql only (relational DB) in this case we will have a big performance issue in reading ... Redis is a key value store it holds its database entirely in the memory so it solution for building highperformance read. 

3-I have finished :-

   - CRUD APIs for the trip.
   - Update trip status is only one direction (you cann't update status from completed to ongoing)
   - API for tracking trip location history using Redis.
   - write unit test using RSPEC for Trip model.

4-Here are the installation steps to run the project :-

   - Ruby version  : 2.6.3
   - Rails version : 6.0.0
   - Redis-server version : 5.0.5
   - Redis-server on its default port 6379
   - Database : mysql
   - cd project : bundle install
   - create databse : rails db:create
   - run the database migrations : rails db:migrate
   - run the project with this command : rails s
   - run sidekiq to run your jobs in BG with this command : bundle exec sidekiq

5-Import apis collection to your postman : https://www.getpostman.com/collections/5f17b669a87e3d3d4d03