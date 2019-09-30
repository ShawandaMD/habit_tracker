$(document).on('turbolinks:load', function() {
  console.log('Hello World')
  $('#habits-data').one('click', function(event) {
    event.preventDefault()
    getHabits(event.target.dataset.userId) //user specific habits
  })
  $('div#habit_form').submit(function (event) {
  //alert( "Handler for .submit() called." );
  event.preventDefault();
  habitsForm(event.target)
  });

  $('a#each-habit-data').one('click', function(event) {
    event.preventDefault()
    getShowPage(event.target.dataset.habitId)
  })

  $('#activities-data').one('click', function(event) {
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
  fetch(`/habits/${id}/activities.json`)
  .then((response) => response.json())
  .then((dataArray) => {
    listOfEvents(dataArray)
    //console.log(dataArray)
  })
}

function listOfEvents(dataArray) {
  const events = dataArray.map(event => {
   const eventObj = new Event(event)
   const eventHtml = eventObj.eventsHTML()
   $('div#list-activities').append(eventHtml)
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
       $(`#habit-data-${this.id}`).append(`Category: ${this.category}
      ----  Goal: ${this.goal}`)
   }
}

class Event {
  constructor(obj) {
    this.id = obj.id
    this.action = obj.action
    this.occurance = obj.event.occurance
    this.comment = obj.event.comment
    this.habitId = obj.habit.id
  }
  eventsHTML() {
    return (`<li>
      Date: ${this.occurance} --- ${this.action}<br>
      Comment: ${this.comment}
    </li><br>`)
  }
}
