// MARK: - Estrutural: Facade

class Eternal {
    
    class func setObject(value: AnyObject!, forKey defaultName: String!) {
        let defaults: UserDefaults = UserDefaults.standard
        defaults.set(value, forKey: defaultName)
        defaults.synchronize()
    }
    
    class func objectForKey(defaultName: String!) -> AnyObject! {
        let defaults: UserDefaults = UserDefaults.standard
        
        return defaults.object(forKey: defaultName) as AnyObject
    }
}

// MARK: - Usage

Eternal.setObject(value: "Disconnect me. I'd rather be nothing" as AnyObject, forKey: "Bishop")
Eternal.objectForKey(defaultName: "Bishop")
