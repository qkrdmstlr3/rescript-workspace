// https://rescript-lang.org/docs/manual/latest/pattern-matching-destructuring#destructuring
// Destructuring
let coordinates = (10, 20, 30)
let (x, _, _) = coordinates
Js.log(x) // 10

// Record
type student = {name: string, age: int}
let student1 = {name: "John", age: 10}
let {name} = student1 // "John" assigned to `name`

// Variant
type result = Success(string)
let myResult = Success("You did it!")
let Success(message) = myResult

// pattern matching
type payload =
  | BadResult(int)
  | GoodResult(string)
  | NoResult

let data = GoodResult("Product shipped!")
switch data {
| GoodResult(theMessage) => Js.log("Success! " ++ theMessage)
| BadResult(errorCode) =>
  Js.log("Something's wrong. The error code is: " ++ Js.Int.toString(errorCode))
| NoResult => Js.log("Bah.")
}

// complex example
type status = Vacations(int) | Sabbatical(int) | Sick | Present
type reportCard = {passing: bool, gpa: float}
type person =
  | Teacher({name: string, age: int})
  | Student({name: string, status: status, reportCard: reportCard})

let person1 = Teacher({name: "Jane", age: 35})

let message = switch person1 {
| Teacher({name: "Mary" | "Joe"}) => `Hey, still going to the party on Saturday?`
| Teacher({name}) =>
  // this is matched only if `name` isn't "Mary" or "Joe"
  `Hello ${name}.`
| Student({name, reportCard: {passing: true, gpa}}) =>
  `Congrats ${name}, nice GPA of ${Js.Float.toString(gpa)} you got there!`
| Student({reportCard: {gpa: 0.0}, status: Vacations(daysLeft) | Sabbatical(daysLeft)}) =>
  `Come back in ${Js.Int.toString(daysLeft)} days!`
| Student({status: Sick}) => `How are you feeling?`
| Student({name}) => `Good luck next semester ${name}!`
}
