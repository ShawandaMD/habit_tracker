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
  .then((response) => response.json())
  .then((habitsArray) => console.log(habitsArray));
}

class Habit {
	constructor(obj) {
		this.id = obj.id
		this.name = obj.name
		this.category = obj.category
		this.goal = obj.goal
	}
