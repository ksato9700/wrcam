{exec} = require 'child_process'
task 'build', 'Build project from src/*.coffee to public/js/*.js', ->
  exec 'coffee --compile --output public/js/ src/', (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr
