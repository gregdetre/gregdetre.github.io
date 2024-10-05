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
        
    <p>function [errs warns] =&nbsp;unit_grow_struct()</p>
<p>% Unit test for GROW_STRUCT.M.
%
% [<span class="caps">ERRS</span> <span class="caps">WARNS</span>] =&nbsp;UNIT_GROW_STRUCT()</p>
<p>errs = {};
warns =&nbsp;{};</p>
<p>% positive tests
[errs warns] = basic_case(errs,warns);
[errs warns] = empty_into(errs,warns);
% we also need a case for cell arrays (which do&nbsp;work)</p>
<p>% all these should raise exceptions
[errs warns] = extra_into_field(errs,warns);
[errs warns] = extra_from_field(errs,warns);
[errs warns] = diff_fnames(errs,warns);
[errs warns] = diff_into_lengths(errs,warns);
[errs warns] = diff_from_lengths(errs,warns);
[errs warns] = empty_from(errs,warns);
[errs warns] = empty_into(errs,warns);
% need a case for non-vector&nbsp;inputs</p>
<p>% alert the user if there are any problems
[errs warns] =&nbsp;alert_unit_errors(errs,warns);</p>
<p>%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [errs warns] =&nbsp;basic_case(errs,warns)</p>
<p>% the standard example. <span class="caps">INTO</span> has some data, <span class="caps">FROM</span> has some
% data. concatenate, all should be well.
into.f1 = [1   2   3];
into.f2 = [10  20  30];
into.f3 = [100 200 300];
from.f1 = [4   5];
from.f2 = [40  50];
from.f3 = [400 500];
actual = grow_struct(into, from);
desired.f1 = [1   2   3   4   5];
desired.f2 = [10  20  30  40  50];
desired.f3 = [100 200 300 400 500];
if ~compare_struct(actual,desired)
  errs{end+1} = &#8216;Basic test didn&#8221;t work right&#8217;;&nbsp;end</p>
<p>%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [errs warns] =&nbsp;empty_into(errs,warns)</p>
<p>% the first time we call it, the <span class="caps">INTO</span> will be empty
into = [];
from.f1 = [4   5];
from.f2 = [40  50];
from.f3 = [400 500];
actual = grow_struct(into, from);
desired.f1 = [4   5];
desired.f2 = [40  50];
desired.f3 = [400 500];
if ~compare_struct(actual,desired)
  errs{end+1} = &#8216;Empty <span class="caps">INTO</span> test didn&#8221;t work right&#8217;;&nbsp;end</p>
<p>%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [errs warns] =&nbsp;extra_into_field(errs,warns)</p>
<p>into.f1 = [1   2   3];
into.f2 = [10  20  30];
into.f3 = [100 200 300];
from.f1 = [4   5];
from.f2 = [40  50];
try
  actual = grow_struct(into, from);
  errs{end+1} = &#8216;Should fail with extra <span class="caps">INTO</span> field&#8217;;&nbsp;end</p>
<p>%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [errs warns] =&nbsp;extra_from_field(errs,warns)</p>
<p>into.f1 = [1   2   3];
into.f2 = [10  20  30];
from.f1 = [4   5];
from.f2 = [40  50];
from.f3 = [400 500];
try
  actual = grow_struct(into, from);
  errs{end+1} = &#8216;Should fail with extra <span class="caps">FROM</span> field&#8217;;&nbsp;end</p>
<p>%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [errs warns] =&nbsp;diff_fnames(errs,warns)</p>
<p>into.f1 = [1   2   3];
into.f2 = [10  20  30];
from.f1 = [4   5];
from.f4 = [400 500];
try
  actual = grow_struct(into, from);
  errs{end+1} = &#8216;Should fail with different field names&#8217;;&nbsp;end</p>
<p>%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [errs warns] =&nbsp;diff_into_lengths(errs,warns)</p>
<p>into.f1 = [1   2   3   3];
into.f2 = [10  20  30];
into.f3 = [100 200 300];
from.f1 = [4   5];
from.f2 = [40  50];
from.f3 = [400 500];
try
  actual = grow_struct(into, from);
  errs{end+1} = &#8216;Should fail if <span class="caps">INTO</span> fields are different lengths&#8217;;&nbsp;end</p>
<p>%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [errs warns] =&nbsp;diff_from_lengths(errs,warns)</p>
<p>into.f1 = [1   2   3];
into.f2 = [10  20  30];
into.f3 = [100 200 300];
from.f1 = [4   5   5];
from.f2 = [40  50];
from.f3 = [400 500];
try
  actual = grow_struct(into, from);
  errs{end+1} = &#8216;Should fail if <span class="caps">FROM</span> fields are different lengths&#8217;;&nbsp;end</p>
<p>%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [errs warns] =&nbsp;empty_from(errs,warns)</p>
<p>% unlike &#8216;empty into&#8217;, this is&nbsp;aberrant</p>
<p>into.f1 = [1   2   3];
into.f2 = [10  20  30];
into.f3 = [100 200 300];
from = [];
try
  actual = grow_struct(into, from);
  errs{end+1} = &#8216;Should fail with empty <span class="caps">FROM</span>&#8217;;&nbsp;end</p>
<p>into.f1 = [1   2   3];
into.f2 = [10  20  30];
into.f3 = [100 200 300];
from = [];
try
  actual = grow_struct(into, from);
  errs{end+1} = &#8216;Should fail if <span class="caps">FROM</span> fields are empty&#8217;;&nbsp;end</p>
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
