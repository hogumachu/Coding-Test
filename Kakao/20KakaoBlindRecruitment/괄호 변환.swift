// 출처 : 프로그래머스 2020 KAKAO BLIND RECRUITMENT 괄호 변환
// https://programmers.co.kr/learn/courses/30/lessons/60058
// 풀이 : hogumachu

import Foundation

func solution(_ p:String) -> String {
    let arrP = Array(p)
    func isValid(_ arr: [Character]) -> Bool {
        var left = 0
        var right = 0
        for i in 0..<arr.count {
            if left < right {
                return false
            }
            if arr[i] == "(" {
                left += 1
            } else {
                right += 1
            }
        }
        if left == right {
            return true
        } else {
            return false
        }
    }

    func isBalanced(_ arr: [Character]) -> Bool {
        var left = 0
        var right = 0
        for i in arr {
            if i == "(" {
                left += 1
            } else {
                right += 1
            }
        }
        if left == right {
            return true
        } else {
            return false
        }
    }

    func removeAndReverse(_ arr: [Character]) -> String {
        if arr.count > 2 {
            var newArr = arr
            newArr.removeFirst()
            newArr.removeLast()
            var str = ""
            for i in newArr {
                if i == "(" {
                    str += ")"
                } else {
                    str += "("
                }
            }
            return str
        } else {
            return ""
        }
    }

    func div(_ arr: [Character]) -> String {
        if arr.count == 0 {
            return ""
        }
        var left: [Character] = []
        var right: [Character] = []
        for i in 0..<arr.count {
            if isBalanced(Array(arr[0...i])) {
                left = Array(arr[0...i])
                right = Array(arr[i + 1..<arr.count])
                break
            }
        }

        if isValid(left) {
            return String(left) + div(right)
        } else {
            return "(" + div(right) + ")" + removeAndReverse(left)
        }

    }
    return div(arrP)
}
