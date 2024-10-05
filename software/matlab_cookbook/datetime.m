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
        
    <p>function [dt] =&nbsp;datetime(seconds)</p>
<p>% Spits out the date and time in yymmdd_HHMM format
%
% [dt] = datetime([seconds])
%
% The advantage of this is that alphabetic order is also
% chronological).
%
% If <span class="caps">SECONDS</span> = true, adds _SS at the end (defaults to&nbsp;false).</p>
<p>% This is part of the Princeton <span class="caps">MVPA</span> toolbox, released under the
% <span class="caps">GPL</span>. See http://www.csbmb.princeton.edu/mvpa for more
%&nbsp;information.</p>
<p>if ~exist(&#8216;seconds&#8217;,&#8217;var&#8217;)
  seconds = false;&nbsp;end</p>
<p>if seconds
  dt = datestr(now,&#8217;yymmdd_HHMM_SS&#8217;);
else
  dt = datestr(now,&#8217;yymmdd_HHMM&#8217;);&nbsp;end</p>
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
