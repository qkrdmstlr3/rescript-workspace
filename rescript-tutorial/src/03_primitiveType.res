/* string */
let greeting01 = "Hello world!"
let multilineGreeting = "Hello world!"
let greetings = "Hello " ++ "world!"

/* interpolation */
let name = "Joe"
let greeting02 = `
Hello
World
${name}
`

// j를 쓰면 괄호 없이 $다음에 오는 것을 변수로 대체 가능
let age = 10
let message = j`Today I am $age years old`

/* char : 한 글자에 대한 타입을 가진다 */
let firstLetterOfAlphabet = 'a'

/* 정규식 */
let r = %re("/b/g")

/* boolean */
// == : 깊은 비교, 값을 비교 (1, 2) == (1, 2) true
// === : 얕은 비교, 주소 비교 (1, 2) === (1, 2) false

/* float */
// 연산 시에 .을 붙인다 +. -. *. /.

/* unit */
// single value를 가진다
// undefined로 컴파일된다
