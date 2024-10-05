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
        
    <p>function [z] =&nbsp;zscore_mvpa(x,dim)</p>
<p>% This is a simple replacement for the Matlab Stats toolbox zscore
% function. It differs ever so slightly, because it takes in an
% optional <span class="caps">DIM</span> argument that determines which dimension it should
% operate along (like <span class="caps">MAX</span>, <span class="caps">MIN</span>, <span class="caps">SUM</span>, <span class="caps">MEAN</span> etc.).
%
% Note: if you&#8217;re looking for an <span class="caps">MVPA</span> function to zscore your
% patterns as part of the subj structure, see ZSCORE_RUNS.M - this
% is just a simple auxiliary function to stand in for <span class="caps">ZSCORE</span>.M
%
% <span class="caps">DIM</span> (optional, default = 1 for matrices or column vectors, 2 for row
% vectors). These defaults are ever so slightly different than
% those of the Stats toolbox <span class="caps">ZSCORE</span>.M - here, the default dim is 1
% for matrices (2D max), whereas the Stats toolbox can deal with <span class="caps">ND</span>
% matrices and will use the lowest dimension with more than 1 value
% in it
%
% Note: this has been tested, but perhaps not as carefully as it
% should&nbsp;be</p>
<p>% This is part of the Princeton <span class="caps">MVPA</span> toolbox, released under the
% <span class="caps">GPL</span>. See http://www.csbmb.princeton.edu/mvpa for more
%&nbsp;information.</p>
<p>if ~isnumeric(x)
  error(&#8216;Can&#8221;t zscore non-numeric data&#8217;);&nbsp;end</p>
<p>if isempty(x)
  z = [];
  return&nbsp;end</p>
<p>% If you don&#8217;t get fed a dim:
%   if it&#8217;s a row vector, dim = 2. if it&#8217;s a column vector, dim = 1
%   else, it must be a matrix, so default to 1
if ~exist(&#8216;dim&#8217;,&#8217;var&#8217;)
  dim = 1;
  if isrow(x)==1
    dim = 2;
  end&nbsp;end</p>
<p>switch(dim)
 case 1
  z = do_z(x);
 case 2
  z = do_z(x&#8217;)&#8217;;
 otherwise
  error(&#8216;Can only manage up to 2D matrices&#8217;);&nbsp;end</p>
<p>%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [z] =&nbsp;do_z(x)</p>
<p>nVals = size(x,1);
warn = warning(&#8216;off&#8217;,&#8217;<span class="caps">MATLAB</span>:divideByZero&#8217;);
xbar = repmat(mean(x),[nVals 1]);
sd = repmat(std(x),[nVals 1]);
warning(warn)
sd(sd==0) = 1;
z = (x - xbar) ./&nbsp;sd;</p>
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
