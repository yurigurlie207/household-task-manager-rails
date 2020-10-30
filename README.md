# household-task-manager-rails
This is my Ruby on Rails project for the Full Stack Web Developer course at the Flatiron School. This web application will be the same as my Sinatra project, except it uses the Rails framework. It is a task manager that helps a household create and manage tasks and subtasks. 


OVERVIEW
I took a long hiatus after getting through the materials on Rails (around 1.5 months) before getting back to the portfolio project for this section. This bit will document how I decided to approach getting my head back into the work knowing that I will have more dedicated but still sporadic time to spend on completing this project. I'm using this as to track my work patterns more realistically and with more "mindful awareness" so I can make better future coursework/project plans. I don't want to pressure or rush myself, so I will just document activities on a day-to-day basis.

10/3/20
- reviewed the project requirements
- set up the github repo and generated new rails app
- made the decision to make the same web app as my Sinatra project since it meets the project scope


10/7/20
- added in raw code from models/controllers/views/migrations for user from Sinatra project
- added in sessions/cookies/omniauth code from rails labs

(Still need to be cleaned up,tailored, debugged, and refactored)

10/8/20
The work I'm doing today integrates a bit reorganizing code, but as well as reviewing some of the topic. Due to this, it looks a bit less like live coding, and more like learning through breaking up some code chunks, which may mean I'm putting things together out of order, as I gather bits of pieces of information I need to put together the main goal for today: get the user model, and authentication set up along with the web app parts needed to walk through the entire user login/authenticaion process.This may also mean I go off in some tangents as I read through some of the course work again.

So far, the only thing I've confirmed is up and running is my web app is now up on the rails server. I have not run any other code. I think I will do this once I have the code merged and updated to all the rails syntax for the process flow required for user creation and login.

10/11/20
It's been confusing, trying to relearn everything, while putting the pieces together needed for my app. 
Spending some time on the options of signing up, logging in, logging in and/or signing up through GitHub auth. This looks a bit messy, the way I'm approaching constructing my code, but writing my code here and there is a sign of me filling in some gaps of knowledge, albiet it's looking like poor coding practice. 

I still need to review this so I'm using my syntax efficiently:
https://medium.com/@kerenlerner/render-and-redirect-which-to-use-106ff653ee9a

Completed the code logic in the sessions create route method. The next time I get back to this will be to start debugging the entire user login/signup story as I have gathered all the code, and roughly put it together.

10/27/20
It's never a good idea to separate your personal life too much from your work life. Otherwise, how will you know how to strike a balance? So after another stint of what I'd like to call productive (some mandatory , and some objectively optional) procrastination from my project, I've cleared up the needed mental clutter to start back again. I readily thank the structure of the FS program for helping me mindfully make up small tasks to tackle so that it's not as difficult to return to my project after a break.

Today's goals: try to get the welcome template to render with the signin/signup form options 
Ran user model migration

10/28/20
Fixed some routes and templates. Got the Developer Authentication screen to load and submit. Next steps to include checking to see if the data saved, and to get the github authentication to work as well before moving onto user sign up with forms.

10/29/20
Decided to work with user sign up first, since the user info isn't saving into the database through my developer auth. 
Got Signup to work first/logout working

10/30/20
Let's get signin to work. Then I can continue to work on developer/Git Hub Auth. 
All worked, but one issue remains. How do I go about creating a new user in my app if after authentication through GitHub, the user doesn't already exist? Specifically, how do I create a password? Do I just redirect them to the sign up page, or do I generate the password for them?
