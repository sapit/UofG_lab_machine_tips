# University of Glasgow lab machine tips, tricks and hacks

The lab machines at University of Glasgow are convenient and always available, however, they could be annoying at times. This document's purpose is to share knowledge among students who've been able to tame the environment and tune it better for their needs.


## Desktop crash - `Oh no! Something went wrong`
When the desktop crashes, you get the aforemention error and you cannot log in, usually it is because you have reached the limit of your disk space quota. Worry not, you can still log in without using a desktop and clean up space.
`Ctrl+Alt+F2 (or another Function key)` will start another session only with a terminal. You can log in and clear some space. Also, check the disk quota exceeded section in this document


## Disc quota exceeded
One of the most common problems with the lab machines even with non-demanding use is running into the problem of exceeding the disc quota. The available space is usually 1.5GB on the network storage, which is really easy to fill up. 

#### Check how much space you have left:
```
quota
```
or
```
quota -s   #shows in MB
```

#### Disk usage in the current folder
This magical command will check the disk usage in your current folder, but will include hidden files, as well:
```
du -sch .[!.]* * |sort -h
```

#### Clear the cache
Often the cache(especially web browser) is the main culprit for taking up a lot of space, but is safe to be cleared:
```
rm -rf ~/.cache/*
```

#### Advanced:
How to never have problems with `.cache`: place `.profile` in the home directory. During trials it did not cause any issues, but is relatively shady.


## Python development environment set up

#### Pip
Packages can be installed with pip, but it has to be in the user directory, using the `--user` flag, since you don't have permissions outside of your directory
```
pip install --user django
```
#### Virtual environments
Virtual environments are used to isolate the packages you use within different projects and is the recomended way of developing code in python locally. [Here's why you need virtual environments](https://pythontips.com/2013/07/30/what-is-virtualenv/)

Usually virtualenv is installed on the machines already. 

Python2:
```
virtualenv venv
```

Python3 - same but:
```
virtualenv -p python3 venv
```

To start your virtual environment
```
source venv/bin/activate
```

To stop your virtual environment
```
deactivate
```

#### Note: 
You will have to add this folder to your path every time you log in on the machine, so python can see it
```
PATH=$PATH:~/.local/bin
```
#### Note 2
It might be easiest to just open up the .bashrc file in you home directory and write that line there, as it will execute it on startup

Similar example with conda in `setup_project.sh`

## Remote access

#### Sibu
The `sibu` server provides you with a remote access to you files. It is a publically available server to which you can connect. It *is not* a lab machine environment. Various pieces of software run different versions from the software on the lab machines.

To access the sibu server from Linux/Mac over ssh:
```
ssh 2144328i@sibu.dcs.gla.ac.uk
```

#### Lab machine
From sibu you can ssh into a lab machine and get access to the lab machine environment
```
ssh bo720-4-03u
```
What the convention means is the following:
```
lab 720
row 4
computer 03     (01-06 in 720)
u stands for unix
```
Some other labs don't have rows, example:
```
ssh bo620-18u
```
