// 출처 : HackerRank Left Rotation
// https://www.hackerrank.com/challenges/array-left-rotation/problem
// 풀이 : hogumachu
// 조건이 커서 removeFirst로 하면 시간 초과
// removeLast 로 값을 뽑아 마지막에 reversed 해줌.

func rotateLeft(d: Int, arr: [Int]) -> [Int] {
    // Write your code here
    var left: [Int] = []
    var right = arr
    let order = arr.count - d % arr.count
    for _ in 0..<order {
        left.append(right.removeLast())
    }
    return left.reversed() + right
}
