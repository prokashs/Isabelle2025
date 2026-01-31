#!/bin/bash
# Fix for unreadable/tiny jEdit view on Linux
export GDK_SCALE=2
java -Dsun.java2d.uiScale=2.0 -jar /home/prokash/Isabelle2025/contrib/jedit-20250215/jedit5.7.0-patched/jedit.jar "$@"

## endof the .sh file.

#Now from command line, issue the following to launch - jedit Ide

$ /home/prokash/Isabelle2025/bin/isabelle jedit -Dsun.java2d.uiScale=1.2 -Dsun.java2d.opengl=false -Dsun.java2d.xrender=false -Dawk.rendering=true

# Note that you will have to play with different settings using UI of the editor to get a
# Good view of .thy files.

Enjoy!

