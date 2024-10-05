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
        
    <p>function [newvec] =&nbsp;apply_median_filter(vec)</p>
<p>% Apply a median filter to vector <span class="caps">VEC</span>
%
% [<span class="caps">NEWVEC</span>] = APPLY_MEDIAN_FILTER(<span class="caps">VEC</span>)
%
% Replace each item with the median of itself and its two
% neighbors. For the first and last item, simply take the
% median of themselves and their only&nbsp;neighbor.</p>
<p>if ndims(vec)&gt;2
  error(&#8216;Cannot feed in n-dimensional matrices&#8217;)&nbsp;end</p>
<p>if min(size(vec))~=1
  error(&#8216;<span class="caps">VEC</span> must be a vector&#8217;)&nbsp;end</p>
<p>nItems =&nbsp;length(vec);</p>
<p>% we need to create a second variable, since if we try
% and do it all in place on <span class="caps">VEC</span>, you&#8217;ll be taking the
% median of values that themselves may be medians&#8230;
newvec =&nbsp;nan(size(vec));</p>
<p>for v=1:nItems
  % if it&#8217;s the first item, just take the median of the
  % 1st and 2nd
  if v==1
    newvec(v) = median([vec(v) vec(v+1)]);
    continue
  end
  % if it&#8217;s the last item, just take the median of the
  % last and penultimate
  if v==nItems
    newvec(v) = median([vec(v-1) vec(v)]);
    continue&nbsp;end</p>
<p>% otherwise, take the median of the item, its successor
  % and predecessor
  newvec(v) = median([vec(v-1) vec(v)&nbsp;vec(v+1)]);</p>
<p>end %&nbsp;v</p>
<p>% if there are any NaNs remaining in <span class="caps">NEWVEC</span>, then we&#8217;ve
% messed up
if length(find(isnan(newvec)))
  error(&#8216;Logic bug - <span class="caps">NEWVEC</span> hasn&#8221;t been created properly&#8217;)&nbsp;end</p>
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
