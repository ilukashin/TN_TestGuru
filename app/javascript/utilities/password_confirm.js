document.addEventListener('turbolinks:load', function() {
  var confirmation = document.getElementById('user_password_confirmation')
  
  if (confirmation) { confirmation.addEventListener('input', checkIdentity) }
})

function checkIdentity() {
  var password = document.getElementById('user_password')

  if (this.value === "") {
    this.classList.remove('wrong-input')
    this.classList.remove('correct-input')
  } else if (this.value === password.value) {
    this.classList.remove('wrong-input')
    this.classList.add('correct-input')
  } else {
    this.classList.remove('correct-input')
    this.classList.add('wrong-input')
  }
}


