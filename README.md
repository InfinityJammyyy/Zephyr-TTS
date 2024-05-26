# Zephyr-TTS
A simple TTS for stablelm-zephyr, perfect for low powered devices like the raspberry pi, using Ollama and Coqui TTS you can have an AI you can type to and an AI that can speak to you!

# Installation:

For this you need an internet connection and
First start by git cloning the github project you can do that with this command:

git clone placeholder

Then "cd" into the directory and "ls" to show the files, you should see three files labeled:

"bash.sh" "ReadMe.md" aka the thing you are reading right now, and "ZTS.py"

For an automated install simply execute the bash.sh file by cd-ing into the directory it is in and run:

"chmod +x bash.sh"

"./bash.sh"

This installs all the gadgets and gizmos that the script needs to function and makes it executable!

# Usage:

To start the script cd into the git-cloned folder and run python ZTS.py enter your password (It needs this to save the .wav file to a folder in your home directory) and type in your question then press enter to submit that query to Zephyr where it will be processed.

If you want to enter more then one sentence you can use multi-mode to do that type "multi" when the script prompts you to chat to Zephyr then type "stop" once you are done either copy-pasting an atricle or talking to it to submit it to Zephyr.

And, thats all, remember though that this runs on you CPU not your GPU, I did this as I could not test my program with the GPU as it does not support CUDA, but your CPU will work just fine if slower.

Thank you
    -EXOpool
