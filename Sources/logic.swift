class M {
    var i: Int = 0

    init(i: Int) {
        self.i = i
    }

    func call() {
        if i == 20 {
            print("yeah its 20")
        } else {
            for j in 0...self.i {
                print("value is \(j)")
            }
        }
    }
}