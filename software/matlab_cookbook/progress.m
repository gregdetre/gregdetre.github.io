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
        
    <p>function [made_progress] =&nbsp;progress(cur,total,nWaypoints)</p>
<p>% Display a text-based progress counter
%
% [MADE_PROGRESS] = <span class="caps">PROGRESS</span>(<span class="caps">CUR</span>,<span class="caps">TOTAL</span>,[<span class="caps">NWAYPOINTS</span>])
%
% Displays a progress counter that spits out an &#8216;x%&#8217; marker
% every 100/nWaypoints of the way through a big loop. By default
% then, it will print out every 10%.
%
% nWaypoints (optional, default = 10). The number of increments
% towards completion to read out. Note: this is not a
% <span class="caps">PROPVAL</span> optional argument.
%
% See <span class="caps">WAITBAR</span> for a flashy progress bar that uses figures
% - less good if you&#8217;re running over <span class="caps">SSH</span>.
%
% MADE_PROGRESS = boolean, true when we just made it past a
% waypoint.
%
% e.g.
%
%   for v=1:nVox
%     progress(v,nVox);
%     % do something
%   end %&nbsp;v</p>
<p>made_progress =&nbsp;false;</p>
<p>if cur==1
  % let the user know that a long process is starting
  fprintf(&#8216;\t&#8230;&#8217;)
  return&nbsp;end</p>
<p>if ~exist(&#8216;nWaypoints&#8217;,&#8217;var&#8217;)
  nWaypoints = 10;&nbsp;end</p>
<p>if cur==total
  fprintf(&#8216;  %.f%%&#8217;, 100); % prints 100%
  dispf(&#8216;  done\n&#8217;)
  made_progress = true;
  return&nbsp;end</p>
<p>if mod(cur, floor(total/10)) == 0
  fprintf(&#8216;  %.f%%&#8217;, (cur/total)*100); % prints e.g. 10%
  made_progress = true;&nbsp;end</p>
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
