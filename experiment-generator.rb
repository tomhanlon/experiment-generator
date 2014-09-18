require 'fileutils'

puts "
 ######  ##       ########    ###    ########  ##     ## ########    ###    ########
##    ## ##       ##         ## ##   ##     ## ##     ## ##         ## ##   ##     ##
##       ##       ##        ##   ##  ##     ## ##     ## ##        ##   ##  ##     ##
##       ##       ######   ##     ## ########  ######### ######   ##     ## ##     ##
##       ##       ##       ######### ##   ##   ##     ## ##       ######### ##     ##
##    ## ##       ##       ##     ## ##    ##  ##     ## ##       ##     ## ##     ##
 ######  ######## ######## ##     ## ##     ## ##     ## ######## ##     ## ########

Welcome to the Clearhead Experiment Generator. What is the name of your experiment?
"
experiment_name = gets.chomp.downcase
FileUtils::mkdir_p "#{experiment_name}/css"
FileUtils::mkdir_p "#{experiment_name}/js"
author_name = `git config user.name`
author_name.gsub! "\r", ""

puts "How many variations of this test will there be? Please enter a number."
variation_count = gets.chomp.to_i

puts "Please provide a brief description of the experiment."
description = gets.chomp.downcase

puts "Will you need a global CSS file? (Yes/No)"
global_css = gets.chomp.downcase

if global_css = "yes"
  File.write("#{experiment_name}/css/#{experiment_name}-global.css", "")
end

puts "Please enter the link to the test plan."
test_plan_link = gets.chomp.downcase

variation_count.times do |variation|

  # Write js and css file per variation in  in experiment directory
  File.write("#{experiment_name}/js/#{experiment_name}-v#{variation + 1}.js", "
  /*--------------------------------------------
   *
   *  test: #{experiment_name} - v#{variation + 1}
   *  description: #{description}
   *  author: #{author_name}
   *  link to test plan: #{test_plan_link}
   *
   * ------------------------------------------*/
  ")

  File.write("#{experiment_name}/css/#{experiment_name}-v#{variation + 1}.css", "
  /*--------------------------------------------
   *
   *  test: #{experiment_name} - v#{variation + 1}
   *  description: #{description}
   *  author: #{author_name}
   *  link to test plan: #{test_plan_link}
   *
   * ------------------------------------------*/
  ")
end
