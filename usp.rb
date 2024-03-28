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
    when "nval"
      loop do
        puts "\e[92m[!!!]\e[0m exec: number validator"
        choi = [
          {name: 'brazil', value: 1},
          {name: 'eua', value: 2},
          {name: 'india', value: 3},
          {name: 'exit', value: 4}
          ]
        asq = prompt.select("Select a Country!", choi)
        case asq
          when 1
            print "Type the number: "
            n1 = gets.chomp
            if /[+55][11-99]/ =~ n1
              puts "\e[93m This number is valid\e[0m"
            else
              puts "\e[91m Invalid Number\e[0m"
            end
            print " "
          when 2
            print "Type the number: "
            n2 = gets.chomp
            if /[+1][900-989]/ =~ n2
              puts "\e[93m This number is valid\e[0m"
            else
              puts "\e[91m This number is not valid\e[0m"
            end
            print " "
          when 3
            print "Type the number: "
            n3 = gets.chomp
            if /[+91]/ =~ n3
              puts "\e[93m This number is valid\e[0m"
            else
              puts "\e[91m This number is not valid\e[0m"
            end
            print " "
          when 4
            break
          end
      end
    when "mval"
      puts "\e[92m[!!!]\e[0m exec: mail validator"
      print "Type the email:"
      mailk = gets.chomp
        if /[@][gmail][com]/ =~ mailk
        puts "\e[92m The email \e[0m\e[94m#{mailk}\e[0m\e[92m can be real.\e[0m"
      else
        puts "\e[92m This email can be fake/temporary\e[0m"
      end
    when "tr"
      puts "\e[92m[!!!]\e[0m exec: translate"
      choice = [
      {name: 'portuguese', value: 'portuguese'},
      {name: 'english', value: 'english'},
      {name: 'spanish', value: 'spanish'},
      {name: 'russian', value: 'russian'}
          
      ]
      cm = prompt.select("Translate from: ", choice)
      cmp = prompt.select("Translate to: ", choice)
      system "xdg-open https://www.google.com/search?q=translate+#{cm}+to+#{cmp}&client=firefox-b-e&sca_esv=607135a9cfeed7f2&sxsrf=ACQVn09Ypg3l_RS5unCVZnXgEbshUDGAvw%3A1711664514276&ei=gu0FZsPBEMPC5OUP2YmkqA8&ved=0ahUKEwjDiuSa_5eFAxVDIbkGHdkECfUQ4dUDCBA&uact=5&oq=translate+#{cm}+to+#{cmp}&gs_lp=Egxnd3Mtd2l6LXNlcnAiEnRyYW5zbGF0ZSBydSB0byBlbkiHQlDsEFjaPHABeAGQAQCYAaECoAHUDqoBBTAuMy42uAEDyAEA-AEBmAIIoAKnDMICChAAGEcY1gQYsAPCAgQQIxgnwgILEAAYgAQYigUYkQLCAgUQABiABMICCxAAGIAEGIoFGIYDwgIGEAAYFhgemAMAiAYBkAYIkgcFMS4yLjWgB8cv&sclient=gws-wiz-serp"
    when "c"
      puts "\e[92m[!!!]\e[0m exec: c"
      print "NAME: "
      name = gets.chomp
      print "IP: "
      ip = gets.chomp
      system "ssh #{name}@#{ip} -p 8022"
    when "search"
      puts "\e[92m[!!!]\e[0m exec: search"
      print "filename >>>"
      s = gets.chomp
      puts "\e[93m[!!!]\e[0m Trying Find..."
      system "find #{cmd}"
      system "sleep 1"
      system "locate #{cmd}"
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
    when "hack"
      loop do
        choices = [
        {name: 'metasploit-framework', value: 1},
        {name: 'cilocks', value: 3},
        {name: 'setoolkit', value: 4},
        {name: 'exit', value: 0}

        ]
      
        user_input = prompt.select("Select an action", choices)
        case user_input
          when 1
             puts "Starting Metasploit-Framework"
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
      puts "\e[92m AVALIABLE COMMANDS\e[0m \n create \n exit777 \n s \n help \n back \n cl \n edit \n hack \n history \n history -s \n history -k \n search \n brc \n c \n tr \n mval \n nval \n"
    when "cl"
      puts "\e[92m[!!!]\e[0m exec: cl"
      system "clear"
    when "brc"
      puts "\e[92m[!!!]\e[0m exec: brute connect"
      print "\e[91mType the ip\e[0m > \e[93m"
      ipp = gets.chomp
      puts "\e[91m[!!!]\e[0m Starting Attack..."
      system "sleep 1"
      system "for i in $(seq 1000 1 9999) 
             do
             nc #{ipp} $i
             done
             "
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

