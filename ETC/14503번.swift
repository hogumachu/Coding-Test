// 출처 : 백준 로봇 청소기
// https://www.acmicpc.net/problem/14503
// 풀이 : hogumachu

let size = readLine()!.split(separator: " ").map{Int(String($0))!}
let input = readLine()!.split(separator: " ").map{Int(String($0))!}

var state = [(-1,0), (0, 1), (1, 0), (0, -1)]
var table: [[Int]] = Array(repeating: [], count: size[0])
var direction = input[2]
var robot: [Int] = [input[0], input[1]]
var result = 0
for i in 0..<size[0] {
    table[i] = readLine()!.split(separator: " ").map{Int(String($0))!}
}
while true {
    if table[robot[0]][robot[1]] == 0 {
        table[robot[0]][robot[1]] = 2
        result += 1
    }
    if noDust(table, robot) {
        let back = back(direction)
        if robot[0] + state[back].0 >= 0 && robot[0] + state[back].0 < size[0] && robot[1] + state[back].1 >= 0 && robot[1] + state[back].1 < size[1] && table[robot[0] + state[back].0][robot[1] + state[back].1] != 1 {
            robot[0] += state[back].0
            robot[1] += state[back].1
        } else {
            break
        }
    } else {
        let left = turn(direction)
        if robot[0] + state[left].0 >= 0 && robot[0] + state[left].0 < size[0] && robot[1] + state[left].1 >= 0 && robot[1] + state[left].1 < size[1] && table[robot[0] + state[left].0][robot[1] + state[left].1] == 0 {
            direction = left
            robot[0] += state[left].0
            robot[1] += state[left].1
        } else {
            direction = left
        }
    }

}

func turn(_ n: Int) -> Int {
    if n == 0 {
        return 3
    } else {
        return n - 1
    }
}

func back(_ n: Int) -> Int {
    if n == 0 {
        return 2
    } else if n == 1 {
        return 3
    } else if n == 2 {
        return 0
    } else if n == 3 {
        return 1
    } else {
        print("Error")
        return -1
    }
}
func noDust(_ arr: [[Int]], _ now: [Int]) -> Bool {
    let x = arr.count, y = arr[0].count
    if now[0] + 1 < x && arr[now[0] + 1][now[1]] == 0{
        return false
    }
    if now[1] + 1 < y && arr[now[0]][now[1] + 1] == 0 {
        return false
    }
    if now[0] - 1 >= 0 && arr[now[0] - 1][now[1]] == 0 {
        return false
    }
    if now[1] - 1 >= 0 && arr[now[0]][now[1] - 1] == 0 {
        return false
    }
    return true
}

print(result)
