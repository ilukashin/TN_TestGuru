document.addEventListener('turbolinks:load', function() {
  var confirmation = document.getElementById('user_password_confirmation')
  
  if (confirmation) { confirmation.addEventListener('input', checkIdentity) }
})

function checkIdentity() {
  var password = document.getElementById('user_password')

  console.log('call checking')
  if (this.value === "") {
    this.style = ""
  } else if (this.value === password.value) {
    this.style = "border-color: green; border-width: 3px;"
  } else {
    this.style = "border-color: red; border-width: 3px;"
  }
}


