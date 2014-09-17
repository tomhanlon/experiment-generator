require 'fileutils'
require "clearhead/version"


module Clearhead


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

  puts "How many variations of this test will there be? Please enter a number."
  variation_count = gets.chomp.to_i

  puts "Please provide a brief description of the experiment."
  description = gets.chomp.downcase

  puts "Do you need a global CSS file for this experiment?"
  global_css = gets.chomp.downcase

  if global_css == "yes"
    File.write("#{experiment_name}/css/#{experiment_name}-global.css", "
    /*--------------------------------------------
     *
     *  test: #{experiment_name}-global-css
     *  description: #{description}
     *  author: #{author_name}
     *
     * ------------------------------------------*/
    ")
  end

  variation_count.times do |variation|

    # Write js and css file per variation in  in experiment directory
    File.write("#{experiment_name}/js/#{experiment_name}-v#{variation + 1}.js", "
    /*--------------------------------------------
     *
     *  test: #{experiment_name}-v#{variation + 1}.js
     *  description: #{description}
     *  author: #{author_name}
     *
     * ------------------------------------------*/
    ")

    File.write("#{experiment_name}/css/#{experiment_name}-v#{variation + 1}.css", "
    /*--------------------------------------------
     *
     *  test: #{experiment_name}-v#{variation + 1}.css
     *  description: #{description}
     *  author: #{author_name}
     *
     * ------------------------------------------*/
    ")
  end
end
