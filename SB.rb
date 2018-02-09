#!/usr/bin/ruby -w
# -*- coding : utf-8 -*-

stdin = File.open("name_array.txt","r")#File Pointer
s = stdin.gets
s.gsub!("\]","")
s.gsub!("\[","")
s.gsub!("\"","")
s.gsub!("\n","")
s.gsub!(" ","")
v = s.split(",")

#delete the string that contains special char(En not judge Cn)
v.each do |i|
  if(i=~/[#.*$&%\+\-\\\/\?\d]/)
    v.delete(i)
  end
end

=begin
i=0
v.each do
  puts "#{v.at(i)}"
  i+=1
end   #Test Moudle-1
=end

#name list with emergence times
struct_node = {}
submit_cnt=0
v.each do |i|
  word = i
  struct_node[word]||=0
  struct_node[word]+=1
  submit_cnt+=1
end

struct_node=struct_node.sort{|x,y| y[1]<=>x[1]}#sort! doesn't exist?
attend_cnt=struct_node.length
#puts struct_node[0]
#puts struct_node[0][0]

=begin
struct_node.each do |i|
  puts "#{i}"
end   #Test Moudle-2
=end

puts "Valid Submit: #{submit_cnt}"
puts "Valid Attendant: #{attend_cnt}"

#attach the json
struct_node = Hash[struct_node]
stdout = File.open("input_ruby.json","w")
stdout.puts(struct_node)
