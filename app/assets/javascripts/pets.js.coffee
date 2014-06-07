# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

options = {
  valueNames: [ 'name', 'breed', 'age', 'gender', 'size', 'location', 'species' ],
};

pets = new List( 'pets', options );

options2 = {
    valueNames: [ 'name', 'breed', 'age', 'gender', 'size', 'location', 'species' ],
    page: 12,
    plugins: [
      ListPagination({})
    ]
  };

petsPag = new List('pets', options2);

filterBySize = ->
  radioButtonValue = $("input[name=\"size\"]:checked").attr("value")
  if radioButtonValue is `undefined`
    `undefined`
  else
    radioButtonValue.toUpperCase()

filterByAge = ->
  radioButtonValue = $("input[name=\"age\"]:checked").attr("value")
  if radioButtonValue is `undefined`
    `undefined`
  else
    radioButtonValue.charAt(0).toUpperCase() + radioButtonValue.slice(1)

filterBySpecies = ->
  radioButtonValue = $("input[name=\"species\"]:checked").attr("value")
  if radioButtonValue is `undefined`
    `undefined`
  else
    radioButtonValue.charAt(0).toUpperCase() + radioButtonValue.slice(1)

$("input").click ->
  selectedButtonValues =
    size: filterBySize()
    age: filterByAge()
    species: filterBySpecies()

  console.log selectedButtonValues


  pets.filter (item) ->
    remainingPets = ((selectedButtonValues["size"] is `undefined` or item._values.size is selectedButtonValues["size"] or selectedButtonValues["size"].indexOf("ANY") > -1)) and ((selectedButtonValues["age"] is `undefined` or item._values.age is selectedButtonValues["age"] or selectedButtonValues["age"].indexOf("Any") > -1)) and ((selectedButtonValues["species"] is `undefined` or item._values.species is selectedButtonValues["species"] or selectedButtonValues["species"].indexOf("Any") > -1))
    console.log item
    remainingPets

  totalRemainingPets = $(".pet-box").length
  $("#total-pets-found").html "Total " + totalRemainingPets + " Pets Found"
  return

