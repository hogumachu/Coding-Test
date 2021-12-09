// 출처 : HackerRank Picking Numbers
// https://www.hackerrank.com/challenges/picking-numbers/problem
// 풀이 : hogumachu

func pickingNumbers(a: [Int]) -> Int {
    var values: [Int] = Array(repeating: 0, count: a.max()! + 1)
    var result = 0
    for a in a {
        values[a] += 1
    }

    for i in 1..<values.count {
        result = max(result, values[i - 1] + values[i])
    }

    return result
}
