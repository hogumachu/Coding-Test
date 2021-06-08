// 출처 : 프로그래머스 2018 KAKAO BLIND RECRUITMENT [3차] 파일명 정렬
// https://programmers.co.kr/learn/courses/30/lessons/17686
// 풀이 : hogumachu

func solution(_ files:[String]) -> [String] {
    var newFiles: [(String, String, String)] = []

    for file in files {
        var head = ""
        var number = ""
        var tail = ""
        var nowNumber = false
        var nowTail = false
        for f in file {
            if nowTail {
                tail += "\(f)"
            } else if nowNumber {
                if Int(String(f)) == nil {
                    nowTail = true
                    tail += "\(f)"
                } else {
                    number += "\(f)"
                }
            } else {
                if Int(String(f)) == nil {
                    head += "\(f)"
                } else {
                    nowNumber = true
                    number += "\(f)"
                }
            }
        }
        newFiles.append((head, number, tail))
    }
    func compareHead(_ a: String, _ b: String) -> Bool {
        let alow = a.lowercased()
        let blow = b.lowercased()
        if alow < blow {
            return false
        } else {
            return true
        }
    }
    func compareNumber(_ a: String, _ b: String) -> Bool {
        let intA = Int(a)!
        let intB = Int(b)!

        if intA < intB {
            return false
        } else {
            return true
        }
    }
    newFiles.sort(by: {
        if $0.0.lowercased() < $1.0.lowercased() {
            return true
        } else if $0.0.lowercased() == $1.0.lowercased() {
            if Int($0.1)! < Int($1.1)! {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    })
    var result: [String] = []

    for files in newFiles {
        result.append(files.0 + files.1 + files.2)
    }
    return result
}
