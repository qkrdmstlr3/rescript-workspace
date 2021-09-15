/* variant */
// 앞서 본 것들과는 친숙하지 않은 자료구조이다

// 대부분의 언어에서는 this and that를 지원
// variant는 this or that을 지원
// Capitalized되어야한다(Pascal Case인듯?)

type myResponse =
  | Yes
  | No
  | PrettyMuch

let areYouCrushingIt = Yes

type account =
  | None
  | Instagram(string)
  | Facebook(string, int)
let myAccount = Facebook("shellboy", 24)

// record-like syntax to label
type user =
  | Number(int)
  | Id({name: string, password: string})

let me = Id({name: "Joe", password: "123"})

type s = {score: float}
type adventurer = Warrior(s) | Wizard(string)
let a1 = Warrior({score: 10.5})
let a2 = Wizard("Joe")
