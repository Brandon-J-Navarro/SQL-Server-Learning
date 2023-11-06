-- 2.13 LAB - Create Movie table
-- Create a Movie table with the following columns:

-- ID - positive integer with maximum value of 50,000
-- Title - variable-length string with up to 50 characters
-- Rating - fixed-length string with 4 characters
-- ReleaseDate - date
-- Budget - decimal value representing a cost of up to 999,999 dollars, with 2 digits for cents

-- Your SQL statement goes here
CREATE TABLE Movie (
   ID SMALLINT UNSIGNED,
   Title VARCHAR(50),
   Rating CHAR(4),
   ReleaseDate Date,
   Budget DECIMAL(8,2)
);
