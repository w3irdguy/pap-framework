read -p "Do you want install (y/n) > " resp
if [ "$resp" == "y" ]
then
	sudo apt install ruby
	sudo gem install tty-prompt
	sudo gem install pastel
	sudo chmod +x papinput
	sudo mv papinput /bin/
	mv usp.rb $HOME
	
	echo -e "type\033[0;49;91m papinput\033[m to start the console"
	
elif [ "$resp" == "n" ]
then
	echo -e "\033[0;49;91m bye bye\033[m"
	
else
	echo "..."
fi
