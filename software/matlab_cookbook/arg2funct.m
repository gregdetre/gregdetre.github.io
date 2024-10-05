<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd">
<html ="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Greg Detre</title>
    <meta name="description" content="greg detre gregdetre memrise princeton mvpa" />
    
          <link rel="stylesheet" type="text/css" charset="utf-8" href="/media/main.css" />
        
        
    
      <link rel="icon" 
            type="image/png" 
            href="/img/favicon.png">

      <script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-20347856-5']);
  _gaq.push(['_setDomainName', 'gregdetre.co.uk']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>  </head>
  
    <body class="">
        
    <p>function [fhand fname] =&nbsp;arg2funct(n_or_h)</p>
<p>% Returns both function handle and name from an ambiguous arg
%
% [<span class="caps">FHAND</span> <span class="caps">FNAME</span>] = <span class="caps">ARG2FUNCT</span>(N_OR_H)
%
% N_OR_H could be either a function name string <span class="caps">OR</span> a
% function handle - whichever it is, this will return
% both, for you to process as necessary.
%
% This way, you can leave it up to your
% user to feed in whichever&#8217;s easiest for them, and this
% will give you back both from the ambiguous&nbsp;argument.</p>
<p>if isempty(n_or_h)
  error(&#8216;You fed in an empty function name/handle&#8217;)&nbsp;end</p>
<p>switch(class(n_or_h))
 case &#8216;function_handle&#8217;
  fhand = n_or_h;
  fname = func2str(n_or_h);
 case &#8216;char&#8217;
  % check for common user boobs
  if strmatch(n_or_h,get_typeslist(&#8216;single&#8217;),&#8217;exact&#8217;)
    error(&#8216;It looks like you&#8221;ve fed in an <span class="caps">OBJTYPE</span> instead of <span class="caps">FUNCTION</span> handle/name&#8217;);&nbsp;end</p>
<p>% check to see whether a function (well, anything, really)
  % called n_or_h exists
  if ~exist(n_or_h)
    error(&#8216;No function called %s exists&#8217;,n_or_h);
  end
  % this will run without an error, even if there&#8217;s no such function
  fhand = str2func(n_or_h);
  fname =&nbsp;n_or_h;</p>
<p>otherwise
  error(&#8216;You have fed in a function argument that is neither a function handle nor the string name of a function&#8217;);&nbsp;end</p>
          <br>
<hr>

<h6>
  <p align="center">
    <a href="http://blog.gregdetre.co.uk/">Home</a> - 
    <a href="http://blog.gregdetre.co.uk/posts/">Blog</a> - 
    <a href="http://blog.gregdetre.co.uk/startups/">Startups</a> - 
    <a href="http://blog.gregdetre.co.uk/software/">Software</a> - 
    <a href="http://blog.gregdetre.co.uk/research/">Research</a> - 
    <a href="http://blog.gregdetre.co.uk/writing/">Writing</a>
  </p>

  <p align="center">
    <a href="mailto:greg@gregdetre.co.uk">Email me</a> - updated 31 Dec 2012
  </p>

</h6>
    
              
    
             

  </body>
</html>
