$(document).on('turbolinks:load', function() {
  console.log('Hello World')
  $('#habits-data').one('click', function(event) {
    event.preventDefault()
    //debugger
    getHabits(event.target.dataset.userId) //user specific habits
  })
})

function getHabits(id) {
  fetch(`/users/${id}/habits.json`)
  .then((response) => response.json())
  .then((habitsArray) => {
    listOfHabits(habitsArray)
  })

}
