require 'tty-prompt'
require 'pastel'
require 'time'
time = Time.now
ttime = time.strftime('%d/%m/%Y')
prompt = TTY::Prompt.new
def anima 
  3.times do 
    puts "\e[92mBye \e[0m\e[94mBye\e[0m "
    system "sleep 0.3"
    print "\e[93mBye \e[0m\e[91mBye\e[0m "
  end
end
loop do
  cmd = prompt.ask("\e[94m#{ttime}\e[0m \e[92mpap1 >\e[0m\e[93m")
  case cmd
    when "search"
      puts "\e[92m[!!!]\e[0m exec: search"
      print "filename >>>"
      s = gets.chomp
      puts "\e[93m[!!!]\e[0m Trying Find..."
      system "find #{s}"
      system "sleep 1"
      system "locate #{s}"
    when "history -s"
      puts "\e[92m[!!!]\e[0m exec: history -s"
      puts "\e[91m[°]\e[0m History Record Was Start"
      system "sleep 1"
      system "nohup tail -f usp.rb >> .pap_history &"
      system "clear"
    when "history -k"
      puts "\e[92m[!!!]\e[0m exec: history -k"
      puts "\e[93m[!!!]\e[0m Killing Archives..."
      system "sleep 0.7"
      system "rm .pap_history"
      puts "\e[92m[!!!]\e[0m Success!"
    when "history"
      file = File.open('.pap_history') 
      file.each do |line|
        print line
      end
    when "hack-devices"
      loop do
        choices = [
        {name: 'metasploit-framework', value: 1},
        {name: 'cilocks', value: 3},
        {name: 'setoolkit', value: 4},
        {name: 'exit', value: 0}

        ]
      
        user_input = prompt.select("Select an action?", choices)
        case user_input
          when 1
             puts "Staring Metasploit-Framework"
             system "msfconsole"
          when 3
            puts "Starting CiLocks"
            system "xdg-open https://github.com/tegal1337/CiLocks"
          when 4
            puts "Starting Setoolkit"
            system "setoolkit"
          when 0
             puts ""
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
      puts "\e[92m AVALIABLE COMMANDS\e[0m \n create \n exit777 \n s \n help \n back \n cl \n edit \n hack-devices \n history \n histo -s \n history -k \n search"
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

