# GitHot - Rails Hackathon Project

## Ideas

- Forum Engine
- Github API?

## Scope

A simple web app that utilises the github search API to display the most popular repos of the past (day/week/month/year?) and provides a simple forum interface to discuss each repo.

## Requirements

Github API Integration

Repos
- title:string
- description:text
- stars:int

Users
- email:string
- password:string
- name:string
- description/bio:text
- profile_picture:active_storage

Comments
- user:references
- body:text


### Optional Extras

- Replies System
- Comment Like System


### ERD 

![githot](docs/githot-erd.png)