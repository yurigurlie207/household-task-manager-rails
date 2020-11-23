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

11/1/20
Decided to just generate a random password for the user if they don't exist in system, and use third party auth. This person most likely will continue to use third party to login, and if they try to login through app, they won't know the password, but password recovery/reset isn't within the scope of this project, so I don't need to build this part out. 

DONE - next steps...reread project docs and decide how I was to proceed. User validation/error checking on user login flow? Or start building in the rest of the app? I can do my thinking through the week and start doing some work next weekend.

11/14/20
Man, another long hiatus. I think I'll do validations and error messages at the very end of this project for now, once the task and subtask structure has also been built in just so I can tackle it all in one fell swoop.

Today, I will try to set up the task (and potentially subtask models).

11/15/20
Okay, so yesterday became a day of reviewing some nested forms concepts. Today I will just try to put it to practice with Task/Subtask relationships, and not worry about anything else like validations, refactoring, formatting, etc. Maybe I can also brainstorm how the user flow will work since this is going to be different than my previous project. 

11/20/20
Today, I've committed to a standing desk. In other news, I did some thinking about my user interface for task/subtask creation. I would like to allow users to continuously add subtasks to a task through either the new or show task forms. Kind of like how one would add education or work experience to a work profile. Eventually, I would also like to allow the user to create a new subtask, and then choose the task that subtask belongs to. That's it. No more, no less. Otherwise it'll get too crazy.
Upon further reflection, I might have to skill up (AJAX?) to do what I want? So let's keep it simple for now, and just have one set of subtask attributes come up for task creation, and then link the rest of the subtasks through new subtask creation and assigning them the proper task.

11/21/20
Might only have an hour to work today, so let's make today's approach about envisioning what a user might see when it comes to creating tasks, and adding in some general user views from the Task/Subtask views. Tomorrow, I will get started on the user/subtask join table relationships.working.

11/22/20
Getting started on the join table, to see if I can assign subtasks to users.
Great - looks like the subtask user assignments work! This just need to be worked into the subtask routes as well.

11/23/20
Updated the subtask and task show pages to display info. Will add full versions later.
Next:
1. I want to add the views from the User profile page so they can see all the subtasks/tasks they are assigned to.
2. Build in the edit and update functions for user/task/subtasks.

Okay, trying to build a delete link:
https://stackoverflow.com/questions/9711356/how-to-create-a-link-to-delete-action-in-rails-using-paths-and-link-to
