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
        
    <p>function [y] =&nbsp;ste(x,varargin)</p>
<p>% function [y] = ste(x,varargin)
%
% matlab doesn&#8217;t have a standard error function, but it&#8217;s easy
% enough to calculate. ste(x) = std(x)/sqrt(n) where n is the
% number of samples
%
% this is just a wrapper function that calls std, and then divides
% by sqrt(size(x,1))
%
% the only functionality i&#8217;ve added is that you can stipulate to
% calculate the std on the 2nd dimension (i.e. the columns), just
% as you can with mean(x,2) or size(x,2). however, you can&#8217;t tell
% the std to normalise differently - i&#8217;ve left it at the default
% behaviour. let me know if this seems wrong to you - cheers,&nbsp;Greg</p>
<p>if nargin==2
  if varargin{1}==2
    x = x&#8217;;
  end&nbsp;end</p>
<p>n = size(x,1);
y = std(x) /&nbsp;sqrt(n);</p>
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
