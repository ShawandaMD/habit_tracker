$(document).ready (function() {
  //console.log("Hello World")
  $('#habits-data').on('click', function (event) {
    //debugger
    event.preventDefault()
		getHabits(event.target.dataset.userId)
	})
  $('form').submit(function( event ) {
  //alert( "Handler for .submit() called." );
  event.preventDefault();
  habitsForm(event.target)
  });
})

function habitsForm(form) {
  //debugger
  fetch(`${form.action}`, {
    method: 'POST', // or 'PUT'
    body: JSON.stringify($(form).serializeArray()), // data can be `string` or {object}!
  }).then(res => res.json())
  .then(habitObject => console.log(habitObject))
  .catch(error => console.error('Error:', error));
}

function getHabits(id) {
  fetch(`/users/${id}/habits.json`)
  .then((response) => response.json())
  .then((habitsArray) => {
    listOfHabits(habitsArray)
  })
}

function listOfHabits(habitsArray) {
  //debugger
  const habits = habitsArray.map(habit => { //create a variable to store the  habits array
    const obj = new Habit(habit) //create a variable to turn the JSON in to an object
    const html =  obj.habitsHTML()
    $('div#habits-list').append(html)
  })
};


class Habit {
	constructor(obj) {
		this.id = obj.id
		this.name = obj.name
		this.category = obj.category
		this.goal = obj.goal
	}

  habitsHTML() {//es6 syntax instance function(use this keyword to get access)
    return (`<li>
      <a href="http://localhost:3000/habits/${this.id}">${this.name}</a>
    </li>`)

  }};
