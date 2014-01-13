@Disrupt = @Disrupt || {}

class Disrupt.Blog
  constructor: (doc) ->
    _.extend(@, doc)      

Disrupt.blog = new Disrupt.Blog
  title: 'Disrupt'
  description: 'or be disrupted!'
#  cover: 'http://localhost:3000/content/images/2014/Jan/evento_408_banner_bizdev_workshop-3.png'
#  logo: "http://graph.facebook.com/jbernab/picture"

  topstory: ->
  	Disrupt.posts.findOne()
  	
class Disrupt.Author
  constructor: (doc) ->
    _.extend(@, doc)

class Disrupt.Topic
  constructor: (doc) ->
    _.extend(@, doc)

Disrupt.topic = new Disrupt.Topic
  title: 'Enterprise'
  slug: 'enterprise'
  description: 'ReadWriteEnterprise gives deep insight into the most important business technologies, infrastructure, and trends for technology professionals and executives.'
  posts: ->
    Disrupt.posts.find({}, sort: {created_at: -1})
  
class Disrupt.Post
  constructor: (doc) ->
    _.extend(@, doc)
    
  topic: =>
  	Disrupt.topic
  	
  author: =>
  	new Disrupt.Author
      name: "Juan Bernabó"
      image: "http://graph.facebook.com/jbernab/picture"
      location: "São Paulo"
      bio: "Self made entrepreneur and social change agent helping people and organizations to trive in the transition from industrial era to a knowledge based one by helping them unlearn old non working paradigms and adopt new paradigms that work better in the new context."
  
  date: (param) =>
  	moment(@created_at).fromNow()

  save: =>
    if !@_id
      console.log "Creating post ", URLify2(@title)
      Disrupt.posts.insert
        title: @title
        slug: URLify2(@title)
        excerpt: @excerpt
        feature_media: @feature_media
        content: @content
        created_at: @created_at
      Router.go 'home'
    else
      throw new Error("Update: Not Implemented")
    	
Disrupt.posts = new Meteor.Collection "posts",
  transform: (doc) ->
    new Disrupt.Post(doc)

if Meteor.isServer
  Disrupt.posts.deny
    insert: ->
      false
  Disrupt.posts.allow
    insert: ->
      true

