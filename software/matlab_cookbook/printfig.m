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
        
    <p>function [] =&nbsp;printfig(filename,varargin)</p>
<p>% Print current figure to a .png file
%
% [] = <span class="caps">PRINTFIG</span>(<span class="caps">FILENAME</span>, &#8230;)
%
% See <span class="caps">PRINT</span>.M help for more information.
%
% <span class="caps">FILENAME</span> (without extension) to save to.
%
% <span class="caps">PAPERSIZE</span> (optional, default = [6 6]). Changes width and
% height
%
% <span class="caps">PAPERMARGINS</span> (optional, defaults = [0.25 2.5].
%
% <span class="caps">FILETYPE</span> defaults to &#8216;-dpng&#8217; - optionally set&nbsp;alternatives</p>
<p>if nargin&lt;1
  error(&#8216;Need to feed in a filename&#8217;);
end
if isempty(filename)
  error(&#8216;Filename can&#8221;t be empty&#8217;);&nbsp;end</p>
<p>defaults.papersize = [6 6];
defaults.papermargins = [0.25 2.5];
defaults.filetype = &#8216;-dpng&#8217;;
args =&nbsp;propval(varargin,defaults);</p>
<p>set(gcf,&#8217;PaperPosition&#8217;,[args.papermargins&nbsp;args.papersize]);</p>
<p>if ~isempty(strfind(filename,&#8217;.&#8217;))
  error(&#8216;Can&#8221;t print a figure to a filename with dots in it&#8217;);&nbsp;end</p>
<p>dispf(&#8216;Printing figure %i to %s&#8217;,gcf,filename);&nbsp;print(args.filetype,filename);</p>
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
