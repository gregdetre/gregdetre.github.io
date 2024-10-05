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
        
    <p>function [res, int_part, dec_part] = isint (v)
%
%   [res, int_part, dec_part] = isint (v)
%
%Purpose:
%   obvious
% <br />
% <br />
%Input Parameters:
% <br />
% <br />
% <br />
%Output Parameters:
%   res : 0 it&#8217;s not an integer
%       : 1 
% <br />
% <br />
%    <br />
%Key Terms:
% <br />
%More Info :
% <br />
%   [res, int_part, dec_part] = isint (4.07)
%   [res, int_part, dec_part] = isint (4.00)
%   [res, int_part, dec_part] = isint (-4.07)
%   [res, int_part, dec_part] = isint (-4.00)
%
%     Author : Ziad Saad
%     Date : Wed Aug 11 16:42:55 <span class="caps">CDT</span>&nbsp;1999 </p>
<p>%Define the function name for easy referencing
FuncName =&nbsp;&#8216;isint&#8217;;</p>
<p>%Debug Flag
<span class="caps">DBG</span> =&nbsp;1;</p>
<p>%initailize return variables
fv = fix(v);
df = v - fv;
if (~df),
    res = 1;
    dec_part = 0;
    int_part = v;
else
    res = 0;
    dec_part = df.<em>sign(v);
    int_part = fv.</em>sign(v);&nbsp;end</p>
<p>err = 0;&nbsp;return;</p>
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
