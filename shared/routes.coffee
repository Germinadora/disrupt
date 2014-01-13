
if Meteor.isServer
  Meteor.publish 'posts', ->
    Disrupt.posts.find()

Router.configure
  layoutTemplate: 'layout'

Router.map ->
  @route 'home',
    path: '/'
    data: ->
      blog: Disrupt.blog
      posts: _.reject Disrupt.posts.find({}, sort: {created_at: -1}).fetch(), (post) -> Disrupt.blog.topstory()._id == post._id
    waitOn: ->
      Meteor.subscribe 'posts'

  @route 'topic',
    path: '/topics/:slug'
    data: ->
      blog: Disrupt.blog
      topic: Disrupt.topic #s.findOne(slug: @params.slug)
    waitOn: ->
      Meteor.subscribe 'posts'
    
  @route 'new-post',
    path: '/posts/new'
    data: ->
      blog: Disrupt.blog
      post: new Disrupt.Post
        title: 'Write here your article title'
        slug: "new"
        feature_media:
          type: 'image'
          url: '/content/images/2014/Jan/Banner_Bootcamp_Fev_2014-4.png'
        excerpt: 'Write here your excerpt for this new article'
        content: """
Cu bonorum epicurei sed, et per elitr oratio mentitum. Ad laudem oporteat invenire vis, facer mentitum definiebas nec eu, dictas oportere evertitur an duo. No audire patrioque interesset sed, in oblique detraxit efficiantur eam, te tollit gloriatur constituto mei. Saperet deserunt sed ne.
Sed at mandamus conceptam, sed dicat audiam no. Ex legendos sadipscing scribentur eos. Lorem possim sententiae ex ius, ei ius periculis intellegebat conclusionemque. Novum eripuit reprehendunt ad mea, sit reque errem reprehendunt ex. Dicta nostrud alienum sea ne, eum modo aeque at, convenire dissentiunt in mel. Ex affert vocibus vulputate nec, sed ei movet albucius.
Mei fugit theophrastus id, vel illud commune te. Est in velit erant, persecuti comprehensam usu ei. An qui quot consul, habemus persequeris ne cum, graeco appellantur ei cum. Te has homero omnesque, ius alienum accumsan singulis et, cu mea nihil maiestatis. At ullum nonumy accumsan vix. In tamquam molestiae consequuntur sit.
Ea has mutat eleifend, in vix alii dicit. Lucilius consectetuer in has, mei dicat viderer salutandi ut. At quo atqui placerat. Qui dicam graeco invidunt no, ut eam adhuc nulla. Ut nec laboramus adversarium. Ad cum viderer splendide, pro et summo regione, noluisse detraxit mandamus mea at. At labore virtute vim, duo diceret adipiscing dissentiet eu.
Eos fuisset nominavi ne. Summo alienum eum no, id his voluptua elaboraret. Eu eam tale petentium repudiare, reque aliquando pri et, vel legimus oporteat cotidieque ea. An vis convenire appellantur disputationi.
"""
        created_at: new Date()
    
  @route 'post',
    path: '/posts/:slug'
    data: ->
      blog: Disrupt.blog
      post: Disrupt.posts.findOne(slug: @params.slug)
    waitOn: ->
      Meteor.subscribe 'posts'


