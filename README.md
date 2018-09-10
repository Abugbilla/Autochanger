This code simply changes your desktop background image automatically when the absolute path to an image directory is provided within a time period specified by the user.

This is another version of https://github.com/Abugbilla/wallpaperpy, originally written in python and now written in bash script. This is more of an experiment as I've been learning bash scripting for a while now and was just looking for a cool project to practice on. I thought, why not rewrite codes I've already written in other programming languages into bash script. Nevertheless it works like a charm 😁.

Forgive me if it doesn't look *"bashy"* enough. As I mentioned earlier this is my first proper script in bash.

## RUNNING

Before executing please be sure to make the script executable with root privileges just as most bash scripts by running `chmod 777 changer.sh`. This will enable you run the script without having to add *sudo* every time.
Then execute using `./changer.sh < absolute path to images folder> <time of sleep>`.

## TESTING

This script has been tested on Ubuntu 18.04, Ubuntu 16.04 with unity and a couple of Linux systems using the gnome desktop environment.
LXDE, Xfce4 and KDE has not been tested yet. In order not to mess with your system I recommend you have these environments running on a virtual machine or alternate PC you wouldn't miss if anything goes wrong just to ascertain that it works before running it on your main system.

For those of you with anaconda installed the script will choose to run using `/home/c0d3d/.anaconda2/bin/gsettings` instead of `/usr/bin/gsettings` or the actual path of your gsettings path. When that happens you can start an issue on this repository or just edit the code and append the actual directory path.

Feel free to copy and distribute this script as you see fit.

Thank you.
