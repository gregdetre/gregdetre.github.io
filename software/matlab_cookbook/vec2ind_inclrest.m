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
        
    <p>function [ind] =&nbsp;vec2ind_inclrest(vec)</p>
<p>% Like vec2ind, but deals differently with 0s
%
% [<span class="caps">IND</span>] = VEC2IND_INCLREST(<span class="caps">VEC</span>)
%
% See the builtin <span class="caps">VEC2IND</span> function for more information. This takes
% in a matrix, and tells you where the 1 is for every column.
%
% Useful for figuring out which condition is active in your binary&nbsp;regressors</p>
<p>[isbool isrest isoveractive] =&nbsp;check_1ofn_regressors(vec);</p>
<p>if ~isbool
  error(&#8216;Vec needs to be boolean&#8217;);&nbsp;end</p>
<p>if isoveractive
  error(&#8216;Can&#8221;t have more than one active item in each column&#8217;);&nbsp;end</p>
<p>[nrows ncols] =&nbsp;size(vec);</p>
<p>ind = zeros(1,ncols);
for i = 1:nrows
  ind(find(vec(i,:))) = i;&nbsp;end</p>
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
