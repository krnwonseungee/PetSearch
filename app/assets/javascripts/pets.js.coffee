# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Makes filter div sticky once DOM is loaded
$(document).ready ->
  $(".filter-div").sticky topSpacing: 0
  return

# ListJS: Creates new instance of List
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

# ListJS: filtering functions (by size, age, species)
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

# Function to update number of results printed at the top of the page (total-pets-found div)
updateNumberResults = (numResults) ->
  $("#total-pets-found").html "Total " + numResults + " Pets Found"
  return

# Event handler for clicking radio buttons. Doesn't filter if a radio button isn't yet selected
$("input").click ->
  selectedButtonValues =
    size: filterBySize()
    age: filterByAge()
    species: filterBySpecies()

  pets.filter (item) ->
    remainingPets = (selectedButtonValues["size"] is `undefined` or item._values.size is selectedButtonValues["size"] or selectedButtonValues["size"].indexOf("ANY") > -1) and (selectedButtonValues["age"] is `undefined` or item._values.age is selectedButtonValues["age"] or selectedButtonValues["age"].indexOf("Any") > -1) and (selectedButtonValues["species"] is `undefined` or item._values.species is selectedButtonValues["species"] or selectedButtonValues["species"].indexOf("Any") > -1)
    remainingPets

  totalRemainingPets = $(".pet-box").length
  updateNumberResults totalRemainingPets
  return

  # Pet Profile: Show Social Media links/icons when User hovers over "share" link
$("#social-media").hover (->
  $("#soc-media-links").css "display", "inline"
  return
), ->
  $("#soc-media-links").css "display", "none"
  return




