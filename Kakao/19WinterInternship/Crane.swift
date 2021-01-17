// 출처 : 프로그래머스 2019 카카오 개발자 겨울 인턴십 크레인 인형뽑기 게임
// https://programmers.co.kr/learn/courses/30/lessons/64061?language=swift
// 풀이 : hogumachu 

import Foundation


func solution(_ board:[[Int]], _ moves:[Int]) -> Int {

    var newBoard: [[Int]] = board
    var arr: [Int] = []
    var comparison: Int = 0
    var result: Int = 0


    for i in 0..<moves.count {
        for j in 0..<newBoard.count {
            if newBoard[j][moves[i] - 1] != 0 {
                arr.append(newBoard[j][moves[i] - 1])
                newBoard[j][moves[i] - 1] = 0
                break
            }
        }
    }

    var i = 0
    while i < arr.count - 1{
        if arr[i] == arr[i+1] {
            result += 2
            arr.remove(at: i+1)
            arr.remove(at: i)
            i = 0
        } else {
            i += 1
        }
    }

    return result
}
