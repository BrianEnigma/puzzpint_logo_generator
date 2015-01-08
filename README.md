#Puzzled Pint Logo Generator

Various Processing.js modules for generating Puzzled Pint logos in a browser.

For more information, check out [the related blog post](http://netninja.com/2015/01/05/rendering-a-puzzled-pint-seal-in-processing/).

#"Running" the code


##Browser

This code has mainly been tested in Google Chrome. Apparently the JavaScript canvas font rendering differs across browsers, sometimes with widely varying results. All of this has been developed and tested on Chrome for the Mac. Other browsers should work, but have not been extensively tested against.

##Hosting

Most browsers will only read external images via JavaScript from the same server that served up the JavaScript. This gets a little wiggly when reading local files from the filesystem. Some browsers (for good reason!) refuse to let the JavaScript have access to the local filesystem, even if it's just to read an image in the same folder.

**For best results, you'll want to serve these files up through a web server.** This could be hosted on the internet. This could be on your local machine, serving up via localhost. There is no CGI here (no PHP, no Ruby, no Node), it's entirely static files. The code runs in your browser, not the server, so anything that serves up files will do. On my Mac, that's enabling the built-in Apache server. If you have Python installed, you can open a command line terminal, go into that folder, and run `python -m SimpleHTTPServer` to launch a basic web server on port 8000. If you have Ruby installed, you can do the same thing with the `ruby -run -e httpd -- -p 5000 .` command.

