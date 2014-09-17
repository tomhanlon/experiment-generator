require "clearhead/version"

module Clearhead
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
  experiment_name = gets.chomp
  FileUtils::mkdir_p "#{experiment_name}"
  author_name = `git config user.name`

  puts "How many variations of this test will there be? Please enter a number."
  variation_count = gets.chomp.to_i

  puts "Please provide a brief description of the experiment."
  description = gets.chomp.to_i

  variation_count.times do |variation|

    # Write js and css file per variation in  in experiment directory
    File.write("#{experiment_name}/#{experiment_name}-v#{variation + 1}.js", "
    /*--------------------------------------------
     *
     *  test: #{experiment_name}
     *  description: #{description} - v#{variation + 1}
     *  author: #{author_name}
     *
     * ------------------------------------------*/
    ")

    File.write("#{experiment_name}/#{experiment_name}-v#{variation + 1}.css", "
    /*--------------------------------------------
     *
     *  test: #{experiment_name}
     *  description: #{description} - v#{variation + 1}
     *  author: #{author_name}
     *
     * ------------------------------------------*/
    ")
  end
end
