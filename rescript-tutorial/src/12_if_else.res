// if else
let isMorning = true
let message1 = if isMorning {
  "Good morning!"
} else {
  "Hello!"
}
let message2 = isMorning ? "Good morning!" : "Hello!"

// for
for x in 1 to 3 {
  Js.log(x)
}
for x in 3 downto 1 {
  Js.log(x)
}

// while
let break = ref(false)

while !break.contents {
  if Js.Math.random() > 0.3 {
    break := true
  } else {
    Js.log("Still running")
  }
}
