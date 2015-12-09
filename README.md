# Scraper / Woot

## Installation
    mix deps.get
## Usage
    iex -S mix
    ScraperWoot.start("test.txt")

## Motivation
I wanted to portray the shirts I have and all of these are from woot. I had a list in Evernote which when copy/pasted shows as in {{test.txt}} file.

I wrote a small program which would get the data from Elixir and print them out

## Uses
 Uses https://github.com/edgurgel/httpoison for getting the html
 Uses https://github.com/philss/floki for parsing the html

