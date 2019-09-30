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

  $('a#each-habit-data').on('click', function(event) {
    //debugger
    event.preventDefault()
    getShowPage(event.target.dataset.habitId) //user specific habits
  })

  $('#activities-data').on('click', function(event) {
    event.preventDefault()
    getActivitiesPage(event.target.dataset.habitId)
  })
})

function habitsForm(form) {
  const formData = $(form).serialize()//pulls data and takes the array of data from form
  const id = form.action.split('/')[4]

  jQuery.post(`/users/${id}/habits.json`, formData, function(response) {
  console.log(response), "JSON";
})
      //debugger
//  fetch(`/users/${id}/habits.json`, {
  //  method: 'POST', // or 'PUT'
    //body: formData // data can be `string` or {object}!
//  }).then(res => res.json())
  //.then(habitObject => console.log(habitObject))//Why isnt this posting to the console???
  //.catch(error => console.error('Error:', error));
}

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

function getShowPage(id) {
  fetch(`/habits/${id}.json`)
  .then((response) => response.json())
  .then((data) => {
    obj = new Habit(data)
    obj.habitsData()
  })
}

function getActivitiesPage(id) {
  //debugger
  fetch(`/habits/${id}/activities.json`)
  .then((response) => response.json())
  .then((dataArray) => {
//debugger
    listOfEvents(dataArray)
    //console.log(dataArray)
  })
}

function listOfEvents(dataArray) {
  const events = dataArray.map(event => {
    debugger
   const obj = new Event(event)
   const html = obj.eventsHTML()
   //debugger
   $('div#habits-list').append(html)
  })
}


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
   habitsData() {
     //debugger
       $(`#habit-data-${this.id}`).append(`Category: ${this.category}
      ----  Goal: ${this.goal}`)
   }

}

class Event{
  constructor(obj) {
    this.id = obj.id
    debugger
    this.occurance = obj.event.occurance
    this.comment = obj.event.comment
    this

  }
}
