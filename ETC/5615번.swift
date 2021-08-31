// 출처 : 백준 아파트 임대
// https://www.acmicpc.net/problem/5615
// 풀이 : hogumachu
// 참조: https://ko.wikipedia.org/wiki/%EB%B0%80%EB%9F%AC-%EB%9D%BC%EB%B9%88_%EC%86%8C%EC%88%98%ED%8C%90%EB%B3%84%EB%B2%95
// 참조: https://casterian.net/archives/396
// 참조: https://rebro.kr/46
// UInt32.max = 4_294_967_295
// 면적 = 2^31 - 1, 2 * 면적 + 1 = 2^32 - 1 = 4_294_967_295
// -> UInt32 로 딱 떨어져서 가능할 줄 알았는데 런타임 에러가 났음
// -> UInt64 해야할 듯

// a 가 2^32 보다 작은 합성수이면 2, 7, 61만 넣어봐도 판별 가능
let aArray: [UInt64] = [2, 7, 61]

// 결과를 저장할 result
var result = 0

// 초기 input 은 반복 횟수임
for _ in 0..<Int(readLine()!)! {
    let input = UInt64(readLine()!)!

    // n 을 input * 2 + 1 로 함으로 (2x + 1) * (2y + 1) 로 표현하도록 함
    // 이렇게 되면 두 값의 곱으로 표현되기 때문에 소수이면 안됌 (x, y 는 양의 정수)
    // 따라서 (2x + 1) * (2y + 1) >= 6 이라는 최솟값이 나옴
    let n = 2 * input + 1

    //  aArray 에 저장된 값은 이미 소수이므로 제외하고, n의 최솟값인 6이상 부터 확인
    if n != 2 && n != 7 && n != 61 && n >= 6{
        for a in aArray {
            // 만약 millerRabin 으로 소수가 아님을 알게 되면 result 에 - 1을 해줌
            // 이러는 이유는 이 반복문 자체에서 계속 result 를  + 1 하기 때문에 - 1 로 0을 만들어줌
            if !millerRabin(n, a) {
                result -= 1
                break
            }
        }
    }

    result += 1
}

print(result)

func power(_ x: UInt64, _ y: UInt64, _ mod: UInt64) -> UInt64 {
    var res: UInt64 = 1
    var x = x % mod
    var y = y
    while y > 0 {
        if y % 2 == 1 {
            res = (res * x) % mod
        }
        x = (x * x) % mod
        y /= 2
    }
    return res
}


// 2^s * d 형태로 만듦 -> d
func millerRabin(_ n: UInt64, _ a: UInt64) -> Bool {
    var d = n - 1

    while d % 2 == 0 {
        // a^d = -1 (mod n)
        if power(a, d, n) == n - 1 {
            return true
        }
        d /= 2
    }
    let temp = power(a, d, n)

    return temp == n - 1 || temp == 1
}
