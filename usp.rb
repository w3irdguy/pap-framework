require 'tty-prompt'
require 'pastel'

prompt = TTY::Prompt.new
def anima 
  3.times do 
    puts "\e[92mBye \e[0m\e[94mBye\e[0m "
    system "sleep 0.3"
    puts "\e[93mBye \e[0m\e[91mBye\e[0m "
  end
end
loop do
  cmd = prompt.ask("\e[92mpap1 >\e[0m\e[93m")
  case cmd
    when "hack-devices"
      loop do
        choices = [
        {name: 'metasploit-framework', value: 1},
        {name: 'kali-console', value: 2},
        {name: 'cilocks', value: 3},
        {name: 'Exit', value: 4}

        ]
      
        user_input = prompt.select("Select an action?", choices)
        case user_input
          when 1
             puts "Staring Metasploit-Framework"
             system "msfconsole"
          when 2
            loop do
              print "\e[92mkali > \e[0m\e[93m"
              input = gets.chomp
              system "#{input}"
              if input == "quit"
                break
              else
              end
            rescue Exception => e
              puts "type quit to back"
            end
          when 3
            puts "Starting CiLocks"
            system "xdg-open https://github.com/tegal1337/CiLocks"
          when 4
             puts "Exiting application..."
             break
        end
      end  
    when "edit"
      loop do
        puts "\e[92m[!!!]\e[0m exec: edit"
        crate = prompt.ask("\e[92mpap1 edit(\e[0m\e[91mUNDEFINED\e[0m)\e[92m > \e[0m\e[93m")
        if crate == " "
          print "please choose an file"
        else
          print "\e[92mpap1 edit(\e[0m\e[91mfile\e[0m)\e[92m > \e[0m\e[93m"
          file = gets.chomp
          system "vim #{file}"
          break
        end
     end
    when "s"
      puts "\e[92m[!!!]\e[0m exec: s"
      system "ls"
    when "help"
      puts "\e[92m[!!!]\e[0m exec: help"
      puts "\e[92m AVALIABLE COMMANDS\e[0m \n create \n exit777 \n s \n help \n back \n cl \n edit \n hack-devices"
    when "cl"
      puts "\e[92m[!!!]\e[0m exec: cl"
      system "clear"
    when "exit777"
      anima
      system "clear"
      break
    when "create"
      puts "\e[92m[!!!]\e[0m exec: create"
      loop do
        crate = prompt.ask("\e[92mpap1 create(\e[0m\e[91mUNDEFINED\e[0m)\e[92m > \e[0m\e[93m")
        case crate
          when "s"
            puts "\e[92m[!!!]\e[0m exec: s"
            system "ls" 
          when "create -f"
            print "\e[92mpap1 create(\e[0m\e[91mname\e[0m)\e[92m > \e[0m\e[93m"
            nploit = gets.chomp
            puts "name => #{nploit} "
            print "\e[92mpap1 create(\e[0m\e[91mlanguage\e[0m)\e[92m > \e[0m\e[93m"
            eploit = gets.chomp
            puts "language => #{eploit}"
            if /[p]ython/ =~ eploit
              system "echo '#!/usr/bin/python\n #Script Author: z4kc \n while True: \n ' >> #{nploit}"
              print "type \e[91ms\e[0m to show directories and files"
            elsif /[b]ash/ =~ eploit
              system "echo '#!/usr/bin/bash\n #Script Author: z4kc \n while : \n do \n \n done' >> #{nploit}"
              print "type \e[91ms\e[0m to show directories and files"
            else
              break
            end
          when "create"
            puts "\e[91m[!!!]\e[0m exec: create UNAVALIABLE"
            puts "[!!!] You cant use }create{ in create Session, try create -h"
          when "create -h"
            puts "\e[92m[!!!]\e[0m exec: create -h"
            puts "\e[91m create\e[0m usage: \n create [ PARAMETER ]\n -f, -h\n"
          when "back"
            break
          end
      end
    when "exit"
      puts "\e[92m[!!!]\e[0m exec: exit"
      puts "Use exit777 to finish the console"
    else
      puts "\e[91m[!!!]\e[0m exec: #{cmd} COMMAND NOT FOUND"
  
 end
rescue Exception => e
  puts "\e[93m[!!!]\e[0m exec: ^C KeyboardInterrupt"
  puts " "
  puts "use \e[91mexit777\e[0m to finish the console"

end

