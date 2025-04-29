import Public

private struct InvisibleStruct {
  public var name = "The invisible struct."
}

private class InvisibleClass {
  public var name = "The invisible class."
  public var someNumber = 42
}

private class PImpl: P {
    typealias Element = PImpl2

    private let str = "This is PImpl"
    func getElement() -> Element {
        PImpl2()
    }
    func protocolFunc() -> String {
        "Hello from PImpl"
    }
    static func staticProtocolFunc() -> String{
        "Hello from static PImpl"
    }
}

private class PImpl2: P {
    typealias Element = P2Impl

    func getElement() -> Element {
        return P2Impl()
    }

    func protocolFunc() -> String {
        "Hello from PImpl2"
    }

    static func staticProtocolFunc() -> String{
        "Hello from static PImpl2"
    }
}

private class P2Impl: P2 {
    func protocolFunc2() -> String {
        "Hello from P2Impl"
    }
}

public func privateDoIt()  {
  let structWrapper = StructWrapper(InvisibleStruct())
  structWrapper.foo()


  let classWrapper = ClassWrapper(InvisibleStruct())
  classWrapper.foo()

  let twoGenericParameters = TwoGenericParameters(InvisibleClass(), InvisibleStruct())
  twoGenericParameters.foo()

  let threeGenericParameters = ThreeGenericParameters(InvisibleClass(), InvisibleStruct(), true)
  threeGenericParameters.foo()
  
  let fourGenericParameters = FourGenericParameters(InvisibleStruct(), 
                                                      InvisibleClass(), 
                                                      ["One", "two", "three"], 
                                                      482)
  fourGenericParameters.foo()

  let nonGeneric = NonGeneric()
  nonGeneric.foo()

  let nestedParameters = Nested.Parameters(InvisibleClass(), InvisibleStruct())
  nestedParameters.foo()

  let pHolder = PHolder(t: PImpl())
  pHolder.foo()


}
