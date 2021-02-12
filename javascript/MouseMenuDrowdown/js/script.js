el = (e) => document.querySelector(e)

const app = el('#app')
const menu = el('#menu')

let menuActive = false
// menu.style.display = 'none'
menu.classList.add('hide')

const showMenu = () => {
  menu.classList.remove('hide')
  menu.classList.add('show')
}

const hideMenu = () => {
  menu.classList.add('hide')
  menu.classList.remove('show')
}

const moveMenu = (event) => {
  event.preventDefault()

  menuActive = true
  showMenu()

  // menu.style.display = 'grid'
  let wHeight = window.innerHeight

  let scrPosX = event.clientX + window.scrollX
  let scrPosY = event.clientY + window.scrollY

  let Y_window_offset = event.clientY + menu.clientHeight - wHeight

  if (Y_window_offset > 0) {
    scrPosY -= Y_window_offset + (wHeight - event.clientY)
  }

  menu.style.left = `${scrPosX}px`
  menu.style.top = `${scrPosY}px`

  return false
}

app.addEventListener('contextmenu', moveMenu, false)
app.addEventListener('click', (event) => {
  if (menuActive) {
    hideMenu()
    menuActive = false
  }
})
