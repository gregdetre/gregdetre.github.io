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
        
    <p>function [cmap] =&nbsp;greenblack(varargin)</p>
<p>% function [cmap] = greenblack()
% function [cmap] = greenblack(n)
%
% bioinformatics people often use a colormap that ranges from green
% (high) to black (low). this creates just such a colormap (just
% like jet or bone, that you can set for plotting, e.g.
%   colormap(greenblack);
%
% if specified, N determines how many rows to create in the
% colourmap. defaults to 64 (like the other colormaps)
%
% modified so that the brightest green is brighter (by incrementing
% redblueness a little bit&nbsp;too)</p>
<p>redratio = 0.5;
blueratio =&nbsp;0.2;</p>
<p>nRows = 64;
if nargin==1
  nRows = varargin{1};
  if nRows &lt; 2
    error(&#8216;nRows too small&#8217;);
  end&nbsp;end</p>
<p>cmap =&nbsp;zeros(nRows,3);</p>
<p>greenness = 0;
redness = 0;
blueness = 0;
stepsize = 1/(nRows-1);
for i=2:nRows
  greenness = greenness + stepsize;
  cmap(i,2) =&nbsp;greenness;</p>
<p>redness = redness + stepsize*redratio;
  cmap(i,[1]) =&nbsp;redness;</p>
<p>blueness = blueness + stepsize*blueratio;
  cmap(i,[3]) = blueness;
end % i&nbsp;nRows</p>
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
