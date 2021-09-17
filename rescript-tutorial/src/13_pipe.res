// 기존 방식 : validateAge(getAge(parseData(person)))
// rescript 방식 :
// person
//   ->parseData
//   ->getAge
//   ->validateAge

// one->a(two, three)

// JS
// const result = [1, 2, 3].map(a => a + 1).filter(a => a % 2 === 0);

// asyncRequest()
//   .setWaitDuration(4000)
//   .send();

// Rescript
// let result = [1, 2, 3]->map(a => a + 1)->filter(a => mod(a, 2) == 0)
// asyncRequest()->setWaitDuration(4000)->send

