require 'rubygems'

$: << File.join(File.dirname(__FILE__), "lib")
require 'cramp'
require 'cramp/model'

Arel::Table.engine = Cramp::Model::Engine.new(:username => 'root', :database => 'arel_test')

EM.run do
  users = Table(:users)
  users.where(users[:name].eq('lifo')).each {|x| puts x.inspect }
  EM.stop
end
