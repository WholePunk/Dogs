import Foundation
import UIKit

class Screen : CodelessVC {

    @IBOutlet weak var image : UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.tabBar.tintColor = UIColor(red : 0.201924204826355, green : 0.520088374614716, blue : 1.0, alpha : 1.0)
        
    }

    // MARK: Lifecycle Methods
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.navigationBar.barTintColor = UIColor(red : 1.0, green : 0.98383754491806, blue : 0.995959401130676, alpha : 1.0)
        self.navigationController?.navigationBar.isTranslucent = false
        
        DispatchQueue.global(qos: .background).async {
            let json : Dictionary<String, Any> = Network.getJsonDictionary(url: "http://dog.ceo/api/breeds/image/random", headers: [:])
            let dogURL = (json["message"] as? String != nil ? json["message"] as! String : "")
            let image : UIImage = Network.getImage(url: dogURL, headers: [:])
            DispatchQueue.main.sync {
                
                self.image.image = image
                
            }
            
        }
        
    }

    // MARK: IBActions
}