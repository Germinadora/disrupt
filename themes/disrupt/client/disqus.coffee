Template.disqus.rendered = ->
  ###
  # We don't want to load Disqus until the first time the template is
  # rendered, since it requires the #disqus_thread div
  # Triggers Deps.autorun (below)
  ###
  
  # Load the Disqus embed.js the first time the `disqus` template is rendered
  # but never more than once
  if !window.DISQUS
    # Below is the Disqus Universal Code
    disqus_shortname = 'disruptbrasil'; 
    (->
     dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
     dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
     (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
     )()
  else
    ###
    # Whenever the template is rendered, trigger a Disqus reset.
    # This will find the correct thread for the current page URL.
    # See http://help.disqus.com/customer/portal/articles/472107-using-disqus-on-ajax-sites
    ###
    DISQUS?.reset(
      reload: true
      config: ->
      )



