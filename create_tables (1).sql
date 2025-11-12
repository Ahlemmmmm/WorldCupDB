-- create_tables.sql

-- Create database
CREATE DATABASE worldcup;

-- Connect to the worldcup database
\c worldcup

-- Drop tables if they exist (safe to re-run)
DROP TABLE IF EXISTS games;
DROP TABLE IF EXISTS teams;

-- Create teams table
CREATE TABLE teams (
  team_id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL
);

-- Create games table
CREATE TABLE games (
  game_id SERIAL PRIMARY KEY,
  year INT NOT NULL,
  round VARCHAR(255) NOT NULL,
  winner_id INT NOT NULL REFERENCES teams(team_id),
  opponent_id INT NOT NULL REFERENCES teams(team_id),
  winner_goals INT NOT NULL,
  opponent_goals INT NOT NULL
);
