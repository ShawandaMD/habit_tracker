$(document).ready (function() {
  //console.log("Hello World")
  $('#habits-data').on('click', function (event) {
    //debugger
    event.preventDefault()
		getHabits(event.target.dataset.userId)
	})
})

function getHabits(id) {
  fetch(`/users/${id}/habits.json`)
  .then((response) => response.json()
  )
  .then((habitsArray) => {
    debugger
    console.log(habitsArray);
  });
}
