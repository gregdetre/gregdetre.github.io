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
        
    <p>function [into] =&nbsp;grow_struct(into,from)</p>
<p>% Adds the entries from struct <span class="caps">FROM</span> into struct <span class="caps">INTO</span>.
%
% [<span class="caps">INTO</span>] = GROW_STRUCT(<span class="caps">INTO</span>,<span class="caps">FROM</span>)
%
% This function is designed for aggregating the behavioral
% data from multiple subjects into one big struct. Each
% subject&#8217;s data must be stored in an identically-arranged
% struct. The fields in my data are all vectors, and within
% a struct, they should all be of the same length. If that&#8217;s
% not the case, this will error.
%
% <span class="caps">INTO</span> (in) - this is the struct into which all the values
% from <span class="caps">FROM</span> will be copied. It should have all the same
% number of fields as <span class="caps">FROM</span>. The only exception to this is if
% this is the first time you&#8217;ve called this function - in
% that case, <span class="caps">INTO</span> can be [], and it will automatically
% create empty fields for it, based on <span class="caps">FROM</span>&#8217;s fieldnames.
%
% <span class="caps">INTO</span> (returned) contains the enlarged <span class="caps">INTO</span> struct, each of
% whose fields should now have <span class="caps">FROM</span>&#8217;s contents
% concatenated.
%
% <span class="caps">UPDATE</span>: this appears to work nicely, even for cell arrays,
% though I hadn&#8217;t expected it to. I think this is because
% <span class="caps">ISVECTOR</span> actually includes 1D cell arrays as vectors
% too. Bonus. The unit test is reasonably&nbsp;complete.</p>
<p>if ~isstruct(from)
  error(&#8216;<span class="caps">FROM</span> must be a struct&#8217;)
end
fnames = sort(fieldnames(from));
nFieldnames =&nbsp;length(fnames);</p>
<p>% if <span class="caps">INTO</span> is [], populate it with empty fields
if isempty(into)
  for f=1:nFieldnames
    cur_fname = fnames{f};
    into.(cur_fname) = [];
  end % f
end %&nbsp;isempty</p>
<p>if ~isstruct(into)
  error(&#8216;<span class="caps">INTO</span> must be a struct&#8217;)
end
into_f =&nbsp;sort(fieldnames(into));</p>
<p>% check that all the fields are the same - this also
% requires that none are missing from one or the other
if ~isequal(into_f,fnames)
  error(&#8216;Both structs must contain the same fields&#8217;)&nbsp;end</p>
<p>if ( &#8230;
  ~check_all_fields_have_same_length(into) | &#8230;
  ~check_all_fields_have_same_length(from) &#8230;
  )
  error(&#8216;All the fields in the struct must have the same length&#8217;)&nbsp;end</p>
<p>for&nbsp;f=1:nFieldnames</p>
<p>cur_fname =&nbsp;fnames{f};</p>
<p>% overwrite the current field in <span class="caps">INTO</span> with the
  % concatenation of itself and the <span class="caps">FROM</span> field
  into.(cur_fname) = [into.(cur_fname)&nbsp;from.(cur_fname)];</p>
<p>end %&nbsp;f</p>
<p>%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [success] =&nbsp;check_all_fields_have_same_length(s)</p>
<p>% S is a <span class="caps">STRUCT</span>. This just goes through all the fields in S,
% and compares their length to one another. If they&#8217;re all
% the same length, <span class="caps">SUCCESS</span> is true.
%
% Also, checks that all the fields are&nbsp;vectors.</p>
<p>success =&nbsp;true;</p>
<p>fnames = fieldnames(s);
nFields =&nbsp;length(fnames);</p>
<p>% if there&#8217;s only one field, then there&#8217;s no way it can be
% of different length to itself
if nFields&lt;2
  return&nbsp;end</p>
<p>% get the length of the first field
fname_1 =&nbsp;fnames{1};</p>
<p>% check that the first field is a vector. allow it to be []
% though
if ~isvector(s.(fname_1)) <span class="amp">&amp;</span> ~isempty(s.(fname_1))
  success = false;&nbsp;end</p>
<p>% store the length of the first field, so that we can
% compare all the other fields to it
len_f1 =&nbsp;length(s.(fname_1));</p>
<p>% loop over the remaining fields
for&nbsp;f=2:nFields</p>
<p>cur_fname =&nbsp;fnames{f};</p>
<p>% check that the current field is a vector, or []
  if ~isvector(s.(cur_fname)) <span class="amp">&amp;</span> ~isempty(s.(fname_1))
    success = false;&nbsp;end</p>
<p>% check the length of the current field against the first
  % one
  if length(s.(cur_fname)) ~= len_f1
    success = false;
    return
  end % comparing with&nbsp;len_f1</p>
<p>end %&nbsp;nFields</p>
<p>if ~success
  keyboard&nbsp;end</p>
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
