document.addEventListener('turbolinks:load', function() {
  var timer = document.getElementById('timer')
  var seconds = timer.textContent

  timer.innerText = timeFormatter(seconds)

  function decreaseSeconds() {
    seconds -= 1

    if (seconds <= 0) {
      window.location.reload(false)
    }

    timer.innerText = timeFormatter(seconds)
  }

  var cancel = setInterval(decreaseSeconds, 1000)
})

// converts plain seconds to HH:MM:SS
function timeFormatter(seconds) {
  return new Date(seconds * 1000).toISOString().substr(11, 8)
}
