# KLSTROL
An experimental app for recommending good value burger deals. Built using Ruby, Sinatra and PostgreSQL.

* The app has been built to contain CRUD functionality and is designed to be RESTful.
* The web interface was written in HTML5 and CSS3.
* As a novelty, each burger in a given deal shows a standardised score of the ratio of calories contained/price.
* This app was produced as a student project. 

# Database Information

* KLSTROL requires a PostgreSQL database to run named _klstrol_
* `psql -d klstrol -f db/klstrol.sql` sets up the tables
* db seeds are also provided (though may only work on certain days of the week due to the nature of the app).
