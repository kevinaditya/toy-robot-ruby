How to run the application:

git clone git://github.com/kevinaditya/toy-robot-ruby
cd toy-robot-ruby
gem install bundler
bundle install

From the root folder type this command below:
ruby ./bin/main.rb
It will only accept STDIN

To Check the testing with Rspec:
rspec spec

Example valid Input and Output:

a)
PLACE 0,0,NORTH
MOVE
REPORT
Output: 0,1,NORTH

b)
PLACE 0,0,NORTH
LEFT
REPORT
Output: 0,0,WEST

c)
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
Output: 3,3,NORTH