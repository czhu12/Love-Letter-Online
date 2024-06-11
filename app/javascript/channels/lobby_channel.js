import consumer from "./consumer"

document.addEventListener('DOMContentLoaded', () => {
  const enterButton = document.getElementById('enter-lobby')
  const nameInput = document.getElementById('name-input')
  const lobbyDiv = document.getElementById('lobby')
  const nameFormDiv = document.getElementById('name-form')
  
  enterButton.addEventListener('click', () => {
    const name = nameInput.value
    if (name.trim() === "") {
      alert("Please enter your name")
      return
    }
    
    lobbyDiv.style.display = "block"
    nameFormDiv.style.display = "none"

    const gameCode = document.getElementById('game-code').value

    const subscription = consumer.subscriptions.create({ channel: "LobbyChannel", game_code: gameCode, name: name }, {
      connected() {
        // Called when the subscription is ready for use on the server
        console.log("connected")
      },

      disconnected() {
        // Called when the subscription has been terminated by the server
      },

      received(data) {
        if (data.users) {
          // Update user list
          const userList = document.getElementById('user-list')
          userList.innerHTML = ""
          data.users.forEach(user => {
            const userElement = document.createElement('div')
            userElement.innerText = user
            userList.appendChild(userElement)
          })
        }
      },

    });
  })
});
