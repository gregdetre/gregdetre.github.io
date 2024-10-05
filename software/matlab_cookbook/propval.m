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
        
    <p>function [merged unused] = propval(propvals, defaults,&nbsp;varargin)</p>
<p>% Create a structure combining property-value pairs with default values.
%
% [<span class="caps">MERGED</span> <span class="caps">UNUSED</span>] = <span class="caps">PROPVAL</span>(<span class="caps">PROPVALS</span>, <span class="caps">DEFAULTS</span>, &#8230;)
%
% Given a cell array or structure of property-value pairs
% (i.e. from <span class="caps">VARARGIN</span> or a structure of parameters), <span class="caps">PROPVAL</span> will
% merge the user specified values with those specified in the
% <span class="caps">DEFAULTS</span> structure and return the result in the structure
% <span class="caps">MERGED</span>.  Any user specified values that were not listed in
% <span class="caps">DEFAULTS</span> are output as property-value arguments in the cell array
% <span class="caps">UNUSED</span>.  <span class="caps">STRICT</span> is disabled in this mode.
%
% <span class="caps">ALTERNATIVE</span> <span class="caps">USAGE</span>:
% 
% [ <span class="caps">ARGS</span> ] = <span class="caps">PROPVAL</span>(<span class="caps">PROPVALS</span>, <span class="caps">DEFAULTS</span>, &#8230;)
%
% In this case, propval will assume that no user specified
% properties are meant to be &#8220;picked up&#8221; and <span class="caps">STRICT</span> mode will be enforced.
% 
% <span class="caps">ARGUMENTS</span>:
%
% <span class="caps">PROPVALS</span> - Either a cell array of property-value pairs
%   (i.e. {&#8216;Property&#8217;, Value, &#8230;}) or a structure of equivalent form
%   (i.e. struct.Property = Value), to be merged with the values in
%   <span class="caps">DEFAULTS</span>.
%
% <span class="caps">DEFAULTS</span> - A structure where field names correspond to the
%   default value for any properties in <span class="caps">PROPVALS</span>.
%
% <span class="caps">OPTIONAL</span> <span class="caps">ARGUMENTS</span>:
% 
% <span class="caps">STRICT</span> (default = true) - Use strict guidelines when processing
%   the property value pairs.  This will warn the user if an empty
%   <span class="caps">DEFAULTS</span> structure is passed in or if there are properties in
%   <span class="caps">PROPVALS</span> for which no default was provided.
%
% <span class="caps">EXAMPLES</span>:
%
% Simple function with two optional numerical parameters:
% 
% function [result] = myfunc(data, varargin)
% 
%   defaults.X = 5;
%   defaults.Y = 10;
%
%   args = propvals(varargin, defaults)
%
%   data = data * Y / X;
% 
% &gt;&gt; myfunc(data)
%    This will run myfunc with X=5, Y=10 on the variable &#8216;data&#8217;.
%
% &gt;&gt; myfunc(data, &#8216;X&#8217;, 0)
%    This will run myfunc with X=0, Y=10 (thus giving a
%    divide-by-zero error)
%
% &gt;&gt; myfunc(data, &#8216;foo&#8217;, &#8216;bar&#8217;) will run myfunc with X=5, Y=10, and
%    <span class="caps">PROPVAL</span> will give a warning that &#8216;foo&#8217; has no default value,
%    since <span class="caps">STRICT</span> is true by default.&nbsp;%</p>
<p>% ======================================================================
%
% This is part of the Princeton <span class="caps">MVPA</span> toolbox, released under the
% <span class="caps">GPL</span>. See http://www.csbmb.princeton.edu/mvpa for more
% information.
% 
% The Princeton <span class="caps">MVPA</span> toolbox is available free and
% unsupported to those who might find it useful. We do not
% take any responsibility whatsoever for any problems that
% you have related to the use of the <span class="caps">MVPA</span> toolbox.
%
%&nbsp;======================================================================</p>
<p>% Backwards compatibility
pvdef.ignore_missing_default = false;
pvdef.ignore_empty_defaults =&nbsp;false;</p>
<p>% check for the number of outputs
if nargout == 2
  pvdef.strict = false;
else
  pvdef.strict = true;&nbsp;end</p>
<p>pvargs =&nbsp;pvdef;</p>
<p>% Recursively process the propval optional arguments (possible
% because we only recurse if optional parameters are given)
if ~isempty(varargin) 
  pvargs = propval(varargin, pvdef);&nbsp;end</p>
<p>% <span class="caps">NOTE</span>: Backwards compatibility with previous version of propval
if pvargs.ignore_missing_default | pvargs.ignore_empty_defaults
  pvargs.strict = false;&nbsp;end</p>
<p>% check for a single cell argument; assume propvals is that argument
if iscell(propvals) &amp;&amp; numel(propvals) == 1 
  propvals = propvals{1};&nbsp;end</p>
<p>% check for valid inputs
if ~iscell(propvals) <span class="amp">&amp;</span> ~isstruct(propvals)
  error(&#8216;Property-value pairs must be a cell array or a structure.&#8217;);&nbsp;end</p>
<p>if ~isstruct(defaults) <span class="amp">&amp;</span> ~isempty(defaults)
  error(&#8216;Defaults struct must be a structure.&#8217;);&nbsp;end</p>
<p>% check for empty defaults structure
if isempty(defaults)
  if pvargs.strict <span class="amp">&amp;</span> ~pvargs.ignore_missing_default
   error(&#8216;Empty defaults structure passed to propval.&#8217;);
  end
  defaults = struct();&nbsp;end</p>
<p>defaultnames = fieldnames(defaults);
defaultvalues =&nbsp;struct2cell(defaults);</p>
<p>% prepare the defaults structure, but also prepare casechecking
% structure with all case stripped
defaults = struct();
casecheck =&nbsp;struct();</p>
<p>for i = 1:numel(defaultnames)
  defaults.(defaultnames{i}) = defaultvalues{i};
  casecheck.(lower(defaultnames{i})) = defaultvalues{i};&nbsp;end</p>
<p>% merged starts with the default values
merged = defaults;
unused = {};
used =&nbsp;struct();</p>
<p>properties = [];
values =&nbsp;[];</p>
<p>% To extract property value pairs, we use different methods
% depending on how they were passed in
if isstruct(propvals) <br />
  properties = fieldnames(propvals);
  values = struct2cell(propvals);
else
  properties = { propvals{1:2:end} };
  values = { propvals{2:2:end} };&nbsp;end</p>
<p>if numel(properties) ~= numel(values)
  error(sprintf(&#8216;Found %g properties but only %g values.&#8217;, numel(properties), &#8230;
                numel(values)));&nbsp;end</p>
<p>% merge new properties with defaults
for i =&nbsp;1:numel(properties)</p>
<p>if ~ischar(properties{i})
    error(sprintf(&#8216;Property %g is not a string.&#8217;, i));&nbsp;end</p>
<p>% convert property names to lower case
  properties{i} =&nbsp;properties{i};</p>
<p>% check for multiple usage
  if isfield(used, properties{i})
    error(sprintf(&#8216;Property %s is defined more than once.\n&#8217;, &#8230;
                  properties{i}));&nbsp;end</p>
<p>% Check for case errors
  if isfield(casecheck, lower(properties{i})) <span class="amp">&amp;</span> &#8230;
    ~isfield(merged, properties{i}) 
    error([&#8216;Property &#8221;%s&#8221; is equal to a default property except &#8216; &#8230;
           &#8216;for case.&#8217;], properties{i});&nbsp;end  </p>
<p>% Merge with defaults<br />
  if isfield(merged, properties{i})
    merged.(properties{i}) = values{i};
  else
    % add to unused property value pairs
    unused{end+1} = properties{i};
    unused{end+1} =&nbsp;values{i};    </p>
<pre><code>% add to defaults, just in case, if the user isn't picking up "unused"
if (nargout == 1 <span class="amp">&amp;</span> ~pvargs.strict)
  merged.(properties{i}) = values{i};
end

if pvargs.strict
  warning(sprintf('Property ''%s'' has no default value.', properties{i}));
end
</code></pre>
<p>end</p>
<p>% mark as used
  used.(properties{i}) = true;&nbsp;end</p>
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
