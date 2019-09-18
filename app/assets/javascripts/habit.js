$(document).on('turbolinks:load', function() {
  console.log('Hello World')
  $('#habits-data').one('click', function(event) {
    event.preventDefault()
    debugger
    event.target.dataset.userId //user specific habits
  })
})
