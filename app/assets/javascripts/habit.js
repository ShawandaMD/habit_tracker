$(document).on('turbolinks:load', function() {
  console.log('Hello World')
  $('#habits-data').one('click', function(event) {
    event.preventDefault()
    //debugger
    getHabits(event.target.dataset.userId) //user specific habits
  })
  $('form').submit(function (event) {
  //alert( "Handler for .submit() called." );
  event.preventDefault();
  habitsForm(event.target)
  });
})

function getHabits(id) {
  fetch(`/users/${id}/habits.json`)
  .then((response) => response.json())
  .then((habitsArray) => {
    listOfHabits(habitsArray)
  })

}

function listOfHabits(habitsArray) {
  const habits = habitsArray.map(habit => {
   const obj = new Habit(habit)
   const html = obj.habitsHTML()
   //debugger
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
  habitsHTML() {
    return (`<li>
      <a href="http://localhost:3000/habits/${this.id}">${this.name}</a>
    </li>`)
  }

}
