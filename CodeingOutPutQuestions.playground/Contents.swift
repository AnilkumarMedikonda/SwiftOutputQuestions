import Foundation
import UIKit


/*
// Question 1


class Person {
    
    var name: String
    var closure:(() -> Void)?
    
    init(name: String) {
        self.name = name
        print("\(name) inilized")
    }
    
    deinit {
        print("\(name) deinitialized")
    }
    
}


var person: Person? = Person(name: "John")

person?.closure = { [weak person] in
    print(person?.name ?? "nil")
}

person?.closure?()

person = nil


// Question 2


struct Counter {
    
    var count: Int
    
    mutating func increment() {
        count += 1
    }
}

var counter = Counter(count: 0)

let closure = {
    print(counter.count)
}

counter.increment()
counter.count = 10

closure()

// Question 3


protocol Greetable {
    func sayHi()
}

extension Greetable {
    
    func sayHi() {
        print("Defult Hi")
    }
    
    func sayBye() {
        print("Defult Bye")
    }
}


struct User: Greetable {
    
    func sayHi() {
        print("User Hi")
    }
    
    func sayBye() {
        print("User Bye")
    }
}

let user: Greetable = User()
user.sayHi()
user.sayBye()


// Question 4


func perform(_ value: inout Int, _ closure: @escaping @MainActor () -> Void) {
    value += 1
    Task { @MainActor in
        closure()
    }
    value += 1
}


var number = 10


perform(&number) {
  print(number)
}

print(number)

*/


// Question 5

/*
actor AnotherCounter {
    
    var value = 0
    
    func increment() async {
        
        value += 1
        try? await Task.sleep(nanoseconds: 1_00_000)
        value += 1
    }
    
}


let anothercounter = AnotherCounter()

Task {
    await anothercounter.increment()
}

Task {
    await anothercounter.increment()
}


Task {
    try? await Task.sleep(nanoseconds: 2_000_000)
    print(await anothercounter.value)
}

*/

/*

| Type       | Behavior                                  |
| ---------- | ----------------------------------------- |
| **class**  | Shared state → race condition (3 or 4)    |
| **actor**  | Shared + safe → always 4                  |
| **struct** | Value type → ❌ cannot mutate concurrently |

*/


// Question 6


/*

struct Transcation {
    
    let id: String
    let amount: Double
    let date: Date
    let merchant: String
    
}

let trasaction1 = Transcation(id: "t1", amount: 2000, date: Date(), merchant: "Starbucks")
let trasaction2 = Transcation(id: "t2", amount: 3000, date: Date(), merchant: "WhileBucks")
let trasaction3  = Transcation(id: "t3", amount: 4000, date: Date(), merchant: "ChileBucks")

var transcations = [trasaction1, trasaction2]

if transcations.contains(where: trasaction3) {
    print("item is in the array")
} else {
    print("item is not  the array")

}

 Ans : it will complier error , if applic equalte protocl , we can che operators
 





// Question 7


var x = 5


let closure1 = {
    print(x)
}


let closure2 = { [x] in
    print(x)
}

//Capture list [x]
// 👉 Captures a copy of value at creation time

/*
 
Key Concept
🔹 Without capture list
Captures variable
Reflects latest value
🔹 With capture list [x]
Captures value copy
Freezes at creation time
 
 */

x = 10

closure1()
closure2()



// Question 8

func test() -> Int {
    
    var x = 10
    
    defer {
        x += 1
        print("Inside --- \(x)")
    }
    
    return x
}

print("Returned ---", test())


// Question 8

protocol P {
    
    func method1()
}

extension P {
    
    func method1() {
        print("protocol method1")
    }
    
    func method2() {
        print("protocol method2")
    }
}


class A: P {
    func method1() {
        print("class  A method1")
    }
    
    func method2() {
        print("class A method2")
    }
    
}


let obj = A()
obj.method1()
obj.method2()


let p: P = A()
p.method1()
p.method2()



// Question 9

func upadte(_ x: inout Int, _ y: inout Int) {
    x += 1
    y += 1
    
}

var a = 10
var b = 10

upadte(&a, &a)

print("a ---", a)




// Question 10

class Parent {
    
    class func greet() {
        print("Parent Parent")
    }
    
    static func welcome() {
        print("Parent Parent")
    }
}


class Child: Parent {
    
    override class func greet() {
        print("Parent Parent")
    }
    
    // cannont static ovverride method
//    static override func welcome() {
//        print(<#T##items: Any...##Any#>)
//    }
    
}

let parentType: Parent.Type = Child.self
parentType.greet()
parentType.welcome()




// Question 11


class Test {
    
    var value: Int = 0  {
        didSet {
            print("didSet:", value)
        }
    }
    
    init() {
        self.value = 10
    }
}

let obj = Test()
obj.value = 20

// Question 12

class Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
}

let p1 = Person(id: 1)
let p2 = Person(id: 1)
let p3 = p1

print(p1 == p2)
print(p1 === p2)
print(p1 === p3)

/*

| Operator | Meaning            | Used For               |
| -------- | ------------------ | ---------------------- |
| `==`     | Value equality     | Structs + custom logic |
| `===`    | Reference identity | Classes only           |

*/


// Question 13

func test() -> Int {
    var x = 1
    
    defer {
        x  += 1
        print("First defer: \(x)")
    }
    
    defer {
        x  += 1
        print("Second defer: \(x)")
    }
    return x
}

print("Returned : \(test())")


// Question 14
@MainActor
struct Counter {
    static var count = 0

    init() {
        Counter.count += 1
    }

    mutating func increment() {
        Counter.count += 1
    }
}

var c1 = Counter()  // count = 1
var c2 = Counter()  // count = 2


// Quetion 15

@MainActor
struct Test {
    static var value: Int = {
        print("Initlising  Value")
        return   10
    }()
    
    static var computed: Int = {
        print("Accessing computed")
        return  value + 5
    }()
}
print(Test.computed)
print(Test.computed)



// Quetion 16

@MainActor
struct CounterTwo {
    var value = 0
}

@MainActor
func test() async {
    let counter = CounterTwo()
    
    Task {
        counter.value  = 10
    }
    
    print(counter.value)
}
*/

/*
@MainActor
struct TestAsync {
    var amount = 0
    
    func updateAmount() {
        let newAmount = amount
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.amount = newAmount + 1
        }
    }
}

var testAsync = TestAsync()
testAsync.updateAmount()
testAsync.updateAmount()

print(testAsync.amount)


final class Logger {
    var message: String = ""
}


struct AppState {
    var count: Int
    var logger: Logger
}


func test(state: AppState) async  {
    Task.detached {
        print(state.count)
    }
}

*/



// Quetion 18


struct Container {
    var items: NSMutableArray
}
let array = NSMutableArray(array: [1,2,3])
var c1 = Container(items: array)
var c2 = c1
c2.items.add(4)

print(c1.items)
print(c2.items)



// Quetion 19

protocol Incrementable {
    mutating func increatement()
}

struct Counter: Incrementable {
    var value = 0
    mutating func increatement() {
        value += 1
    }
}

func increment(_ value: inout Incrementable) {
    value.increatement()
}

var counter  = Counter()
increment(&counter)

print(counter.value)
