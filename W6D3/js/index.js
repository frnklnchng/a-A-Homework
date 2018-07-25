console.log("Hello from the JavaScript console!");

let report = $.ajax({
  type: 'GET',
  url: "http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=bcb83c4b54aee8418983c2aff3073b3b",
  success(data) {
    console.log("Weather: ");
    console.log(data);
  },
  error() {
    console.error("An error has occured.");
  }
});

console.log("The AJAX was sent.");

// Your AJAX request here

// Add another console log here, outside your AJAX request
