let greeting = "hello!"
let score = 10
let newScore = 10 + score

let message = {
  let part1 = "hello"
  let part2 = "world"
  part1 ++ " " ++ part2
}

let displayGreeting = true
if displayGreeting {
  let message = "Enjoying the docs so far?"
  Js.log(message)
}

/* * 재할당을 추천하지 않는다(재할당 처럼 보일지라도 js로 변환되면 다른 변수로 변환된다) */
// let result1 = 0
// let result2 = calculate(result1)
// let result3 = calculateSomeMore(result2)

/* * private */
/* module A: {
  let b: int
} = {
  let a = 3
  let b = 4
} */

module A = {
  %%private(let a = 3)
  let b = 4
}
