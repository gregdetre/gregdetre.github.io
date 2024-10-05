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
        
    <p>function [regs] =&nbsp;ind2vec_robust(ind)</p>
<p>% Replacement for ind2vec, can deal with zeros better
%
% [<span class="caps">REGS</span>] = IND2VEC_ROBUST(<span class="caps">IND</span>)
%
% This script is used to convert vector regressors that list a
% condition for each timepoint into a regressor matrix which
% consists of conditions x timepoints.  It is useful for taking in
% regressors that have been shifted using shift_regressors and that
% therefore begin with a 0 since ind2vec can not input a vector
% that begins with&nbsp;0.</p>
<p>% This command checks to make sure that all of the input values are
% integers and outputs an error if any inputs are not integers.
if isint(ind)==0
  error(&#8216;Your regressors have to be integers&#8217;);&nbsp;end</p>
<p>% This command computes the number of conditions present in the
% regressors by finding the highest value listed in the input
% vector. It also figures out the number of timepoints based on the
% length of the input vector.
nConds = max(ind);
nTimepoints =&nbsp;length(ind);</p>
<p>% This command makes a matrix called regs that has nConds rows and
% nTimepoints columns, which is filled with 0s.
regs =&nbsp;zeros(nConds,nTimepoints);</p>
<p>% This command fills in 1s in a condition&#8217;s row for every timepoint
% at which that condition is present.
for c=1:nConds
  regs(c,find(ind==c)) = 1;&nbsp;end</p>
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
