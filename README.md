# Alpha Blog

> Making a full-stack blog in Rails from a udemy course. Updated to Rails 6.

## Structure
1. *CRUD - C = New/Create, R = Read/Show, U = Edit/update, D = Destroy*

2. Articles, Categories and Users Models - Everything is made from stratch without using Auth gems.

3. Only Admins can create categories, they can RUD articles and users.

4. All Articles are public, but only users who create it can UD it.

5. Bootstrap for styling the App.

## Setup on Heroku
1. Clone this repo:
    ```bash
    $ git clone https://github.com/cdadityang/alpha-blog.git
    ```

2. Check locally if the app is working properly:
    ```bash
    $ cd alpha-blog
    $ bundle install --without production
    $ rake db:migrate
    $ rails s
    ```

3. Goto localhost:3000 and check all the working.

4. Create a app on Heroku and then add your app/keys for this app. [You can look here on how to do that](https://devcenter.heroku.com/articles/git). **Note: You will need Heroku CLI**

5. Push code to heroku: (heroku will automatically setup pg database)
    ```bash
    $ git push heroku master
    $ heroku run rake db:migrate
    ```

6. Ezzy Pezzy - Go to the URL provided by heroku when you created the app.
