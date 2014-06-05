# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

options = {
  valueNames: [ 'name', 'breed', 'age', 'gender', 'size', 'location', 'species' ],
};

pets = new List( 'pets', options );

`$( "input" ).click(function(){
   var selectedButtonValues = {size: filterBySize(), age: filterByAge(), species: filterBySpecies()};
   console.log(selectedButtonValues)
   pets.filter(function(item) {
    remainingPets = (selectedButtonValues["size"] == undefined || item._values.size == selectedButtonValues["size"] || selectedButtonValues["size"].indexOf("ANY") > -1 )
       && (selectedButtonValues["age"] == undefined || item._values.age == selectedButtonValues["age"] || selectedButtonValues["age"].indexOf("Any") > -1 )
       && (selectedButtonValues["species"] == undefined || item._values.species == selectedButtonValues["species"] || selectedButtonValues["species"].indexOf("Any") > -1 );
     return remainingPets;
  })
})`

`function filterBySize() {
  radioButtonValue = $('input[name="size"]:checked').attr('value')
  if (radioButtonValue == undefined) {
    return undefined
  } else {
    return radioButtonValue.toUpperCase()
  }
}`

`function filterByAge() {
  radioButtonValue = $('input[name="age"]:checked').attr('value')
  if (radioButtonValue == undefined) {
    return undefined
  } else {
    return radioButtonValue.charAt(0).toUpperCase() + radioButtonValue.slice(1)
  }
}`

`function filterBySpecies() {
  radioButtonValue = $('input[name="species"]:checked').attr('value')
  if (radioButtonValue == undefined) {
    return undefined
  } else {
    return radioButtonValue.charAt(0).toUpperCase() + radioButtonValue.slice(1)
  }
}`
