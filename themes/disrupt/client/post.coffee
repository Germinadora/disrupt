Template['new-post'].events
  'click #save': ->
    console.log "Save"
    @title = $('#title').text()
    @excerpt = $('#excerpt').text()
    @save()
