Template.comments.helpers 
  checkComments : () ->
    @comments.count() > 0

Template.comments.events
  "submit #add-comment" : (e) ->
    e.preventDefault()
    grid.Comments.insert
      comment: e.target.comment.value
      event: @event.eidID
      user: Meteor.user()._id
      email: Meteor.user().emails[0].address
    e.target.comment.value = ''
    return false