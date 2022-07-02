// https://github.com/atacan/
// 28.05.22
    

protocol HaveInit {
    init?(_ : String)
}


extension Int: HaveInit {}
extension Double: HaveInit {}
extension Bool: HaveInit {}
