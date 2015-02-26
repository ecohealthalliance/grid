Template.comments.getComments = (eventID) ->
  grid.Comments.find({"event": eventID})

Template.comments.events
  "submit #add-comment" : (e) ->
    e.preventDefault()
    grid.Comments.insert
      comment: e.target.comment.value
      event: @event.eidID
      user: Meteor.user().emails[0].address
      timeStamp: new Date()
