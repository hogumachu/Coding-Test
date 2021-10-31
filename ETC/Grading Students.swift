// 출처 : HackerRank Grading Students
// https://www.hackerrank.com/challenges/grading/problem
// 풀이 : hogumachu

import Foundation

let n = Int(readLine()!)!
var result: [Int] = []

func round(_ number: Int) -> Int {
    return (number + 5) - (number % 5)
}

for _ in 0..<n {
    let grade = Int(readLine()!)!
    let roundNum = round(grade)

    if roundNum >= 40 && roundNum - grade < 3 {
        result.append(roundNum)
    } else {
        result.append(grade)
    }
}

for result in result {
    print(result)
}
