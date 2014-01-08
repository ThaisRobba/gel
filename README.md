GËL
===

An advanced LÖVE snippet system along with syntax highlighting & custom commands for Gedit.



##What can it do?

The following features are included in it:
- Add brackets around selected code

		isGorgeous 	>> ({"['isGorgeous']"})
        
- Input functions & commands through shorthand and tab

		point + tab	>> love.graphics.point(x, y)
        
- Edit functions by tabbing through them (dollar sign is caret)

		love.graphics.point($x, y) + tab >>  love.graphics.point(x, $y)
        
- Helpful definitions that you can tab through when using snippets

		nquad + tab >> love.graphics.newQuad(x, y, width, height, width_of_the_image, height_of_the_image)
        
- View all of LÖVE's possible commands with:

		Ctrl+Spacebar
        
- Run the game from Gedit with a shortcut

		Ctrl+L 	>>  Your_Game :D
        
- Run the script within Lua from Gedit with a shortcut

		Shift+Ctrl+L 	>>  Lunar Power! :D
        
- Search LÖVE's wiki in a browser from Gedit with a shortcut

		Select code >> Ctrl+Shift+F 	>>  Wiki Search :D
        
- Proper LÖVE syntax highlighting

##Installation
###Dependencies
- Snippets Plugin
- External Tools Plugin
Both are available for Gedit 2 and Gedit 3, so this should work on Windows, OSX and Linux.

###Needed files
Download this repo and extract it. You really only need:

		gel.snippets.xml
		lua.lang
		
###How do I add LÖVE syntax highlighting?
Open a terminal within the folder you extracted the lua.lang into and run the following command:

		cp lua.lang /home/your_username/.local/share/gtksourceview-3.0/language-specs/lua.lang
	
Alternatively, you can just copy it to the latter folder using your file editor.

###How do I install the Snippets?

After enabling the Snippets plugin in Gedit go to Tool >> Manage Snippets & click the "Import Snippets" button. Find the gel.snippets.xml file you downloaded and press Ok. Should be working now.

###How do I run my game from Gedit?
After enabling the External Tools Plugin, go to Tools >> Manage External Tools and add the following command:
	
		#!/bin/sh
		love "$GEDIT_CURRENT_DOCUMENT_DIR"

I recommend Ctrl+R as a shortcut.
		
###How do I run my lua script from Gedit?
After enabling the External Tools Plugin, go to Tools >> Manage External Tools and add the following command:
	
		#!/bin/sh
		lua "$GEDIT_CURRENT_DOCUMENT_DIR/$GEDIT_CURRENT_DOCUMENT_NAME"
		
I recommend Ctrl+Shift+R as a shortcut.
		
###How do I search the LÖVE wiki from Gedit?
After enabling the External Tools Plugin, go to Tools >> Manage External Tools and add the following command:
	
		#!/bin/sh
		if which xdg-open > /dev/null
		then
		xdg-open "http://www.love2d.org/w/index.php?title=Speacial%3ASearch&search="$GEDIT_SELECTED_TEXT"&go=Go"
		elif which gnome-open > /dev/null
		then
		gnome-open "http://www.love2d.org/w/index.php?title=Speacial%3ASearch&search="$GEDIT_SELECTED_TEXT"&go=Go"
		fi

I recommend Ctrl+Shift+F as a shortcut.
Remember to select the string you want to search before hitting the command.

##Using the Snippets

Within Gedit, be sure that you have the proper language selected.
Press Ctrl+Spacebar to see all the available snippets.

You will notice there is one way to write commands and, while it is not the fastest, it is the most logical and closest to default LÖVE bindings.

###Form

This uses the most obvious word from a command. For example:

		point + tab 				>> love.graphics.point(x, y)
		print + tab 				>> love.graphics.print(text, x, y, ...)
		newparticlesystem + tab		>> love.graphics.newParticleSystem(image, buffer)
		_draw	+ tab				>> function love.draw() end
		
As you can see, this makes it a little easier and a little faster to code.
You might be wondering what is the 'n' in the particlesystem command or why is there an ellipsis in the print output. Read on below.


###Why the ellipsis on that function over there?
Some functions accept many different arguments but, usually, only a few are used. Opting for sane defaults, it means that you *can* input more data and it will work fine but the initial outputted function will be that which most people would use.

		Sane default:
		love.graphics.print(text, x, y)
		
		"overkill is underrated.":
		love.graphics.print(text, x, y, r, sx, sy, ox, oy, kx, ky)

###Ok what about the sneaky underscore?
Due to conflicts of love callbacks with love.graphics, the former functions must be done with an underscore before them.
This means:

		_draw 		>> function love.draw() end
		_errhand 	>> function love.errhand(msg) end
		_focus 		>> function love.focus(f) end

And so on, and so forth. Visit http://www.love2d.org/wiki/love for the list of callbacks.

###Any other exceptions?

The more exceptions we add to rules, the worst the situation becomes - there is only so much we can remember and it is best to stick as close to LÖVE as possible.
There are conflicts, however, which prompted the solution used here:

		getdimensions + tab >> love.graphics.getDimensions()

The "graphics" part will be selected. You can either tab and skip editing it or you could type "window", changing to a different module.

Here is a list with all the exceptions, the one on the left being the favored one (ie: the one that displays by default):

		love.graphics.clear X love.event.clear
		love.graphics.getDimensions X love.window.getDimensions
		love.graphics.getHeight X love.window.getHeight 
		love.graphics.getWidth X love.window.getWidth
		love.graphics.push X love.event.push
		love.mouse.getPosition X love.audio.getPosition 
		love.mouse.setPosition X love.audio.setPosition 
		love.mouse.isDown X love.keyboard.isDown
		love.mouse.isVisible X love.window.isVisible


###Encapsulating
Having the code selected, use one of the following shortcuts:

		Ctrl+'	>>	'gorgeous'
		Ctrl+1	>>	"gorgeous"
		Ctrl+2	>>	(gorgeous)
		Ctrl+3	>>	[gorgeous]
		Ctrl+4	>>	{gorgeous}

###Hey I think something something
Well that is great. :)
Feel free to fork the code or offer patches, ideas and whatnot.

##Goals for GËL 1.0
- Installer
- Add the love type callbacks (:getHeight, :getWidth, et al)
???
