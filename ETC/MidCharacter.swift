// 출처 : 프로그래머스 연습문제 가운데 글자 가져오기
// https://programmers.co.kr/learn/courses/30/lessons/12903
// 풀이 : hogumachu 

import Foundation

func solution(_ s:String) -> String {
    if s.count % 2 == 0 {
        return String(s[s.index(s.startIndex, offsetBy: s.count / 2 - 1)]) + String(s[s.index(s.startIndex, offsetBy: s.count / 2)])
    }else {
       return String(s[s.index(s.startIndex, offsetBy: s.count / 2)])
    }

}
