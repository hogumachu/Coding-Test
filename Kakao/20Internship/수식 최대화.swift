// 출처 : 프로그래머스 2020 카카오 인턴십 수식 최대화
// https://programmers.co.kr/learn/courses/30/lessons/67257
// 풀이 : hogumachu

import Foundation

func solution(_ expression:String) -> Int64 {
    let operand = expression.components(separatedBy: ["+", "-", "*"]).map{Int($0)!}
    var order: [String] = []
    var results: [Int64] = []
    for index in expression.indices {
        if String(expression[index]) == "*" || String(expression[index]) == "+" || String(expression[index]) == "-" {
            order.append(String(expression[index]))
        }
    }
    func getOrder(_ num: Int) -> [String] {
        if num == 0 {
            return ["+", "-", "*"]
        } else if num == 1 {
            return ["+", "*", "-"]
        } else if num == 2 {
            return ["-", "+", "*"]
        } else if num == 3 {
            return ["-", "*", "+"]
        } else if num == 4 {
            return ["*", "+", "-"]
        } else if num == 5 {
            return ["*", "-", "+"]
        } else {
            return []
        }
    }
    func culcurate(_ a: Int, _ b: Int, _ o: String) -> Int {
        if o == "+" {
            return a + b
        } else if o == "-" {
            return a - b
        } else {
            return a * b
        }
    }

    func getNum(_ oper: [Int], _ ord: [String], _ num: Int) -> Int {
        var newOper = oper
        var newOrd = ord
        let prime: [String] = getOrder(num)
        for i in prime {
            var select = 0
            while newOrd.contains(String(i)) {
                if newOrd[select] == String(i) {
                    newOper[select] = culcurate(newOper[select], newOper[select + 1], String(i))
                    newOper.remove(at: select + 1)
                    newOrd.remove(at: select)
                } else {
                    select += 1
                }
            }
        }
        return newOper[0]
    }
    for i in 0...5 {
        results.append(Int64(abs(getNum(operand, order, i))))
    }
    return results.max()!
}
