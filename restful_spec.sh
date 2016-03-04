#!/bin/sh

# Using DASH since we're not coding so much here and it is the most common shell

# API Specification
#  Route             |  Verb     |      Description
# /api/<model>      |   GET     |      Get all the <models>.
# /api/<model>     |   POST    |      Create a model.
# /api/<model>/:id | GET | Get a single model
# /api/<model>/:id | PUT | Update model
# api/<model>/:id | DELETE | Delete model


# if [ -z "which curl" ] ; then
  curl http://localhost:3000/api # GET
# fi
