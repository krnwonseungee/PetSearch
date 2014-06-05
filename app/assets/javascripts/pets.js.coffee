# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

options = {
  valueNames: [ 'name', 'breed', 'age', 'gender', 'size', 'location', 'species' ]
};

pets = new List( 'pets', options );

`$( "input" ).click(function(){
   var selectedButtonValues = {};
   selectedButtonValues["size"] = filterBySize();
   selectedButtonValues["age"] = filterByAge();
   selectedButtonValues["species"] = filterBySpecies();
   console.log(selectedButtonValues)
   pets.filter(function(item) {
     var size = item._values.size;
     var age = item._values.age;
     var species = item._values.species;
     return size == selectedButtonValues["size"] && age == selectedButtonValues["age"]
       && species == selectedButtonValues["species"];
  })
})`

`function filterBySize() {
  radioButtonValue = $('input[name="size"]:checked').attr('value')
  return radioButtonValue.toUpperCase()
}`

`function filterByAge() {
  radioButtonValue = $('input[name="age"]:checked').attr('value')
  return radioButtonValue.charAt(0).toUpperCase() + radioButtonValue.slice(1)
}`

`function filterBySpecies() {
  radioButtonValue = $('input[name="species"]:checked').attr('value')
  return radioButtonValue.charAt(0).toUpperCase() + radioButtonValue.slice(1)
}`
