## Webscraper

#### How to run:

We're using Python to scrape information of the desired stores.

(Any other version should work but could introduce problems with some of the packages used and/or our code)

    Python 3.8.10

Initially to be able to run the scrapper you will need certain packages, to auto install them (sudo permissions may be needed):

    pip install -r requirements.txt
    or
    sudo pip install -r requirements.txt

This will install the following packages:

- bs4 (BeautifulSoup)
- requests
- sqlalchemy
- datetime

Before running the script, we have hardcoded the location of our mysql server in the file main.py:

    connection_string = "mysql+mysqlconnector://user:password@ip:port/database"

To run the program/script, use the following command:

    python3 main.py

Creating a crontab to make the script run every 24 hours:

    sudo crontab -e

Inside the file:

    2 4 * * * python3 main.py

This will make the program run at 04:02 every day.

Overview of how it works:

1. Create a connection to the database
2. Get the products that are being tracked from the db
3. [Loop / Cycle] Find product in list
4. Scrape from one store
5. Send info to the database
6. [Repeat for each store]
7. [Repeat loop]

## Hack_Dashboard

### Overview of the Project

1. Has a back office for administrators to add new wine products to keep track.
2. Display and Filters wines
3. Check the prices for that particular product and provide the price history as well.

### Requirement

- PHP 8.1
- MySQL or MariaDB

### How to run

#### Development

`cd` into the hack_dashboard folder

Start the server

    php artisan serve

Start the front-end development server

    npm run dev

#### Production

    cd dashboard
    composer install
    npm install
    npm run build

Set database values in .env
Import databse

    php artisan key:generate

    sudo chgrp -R www-data storage bootstrap/cache
    sudo chmod -R ug+rwx storage bootstrap/cache

    php artisan serve

Laravel has great documentation on how to deploy here:
https://laravel.com/docs/10.x/deployment

### Technologies

1. It's powered by a Laravel Backend, that uses the MVC architecture.
2. The front end uses React to provide better interactivity and user experience.
3. Uses Inertia that allows the creation of fully client-side rendered, single-page apps, without the complexity that comes with modern SPAs.
