import UIKit
import DFINERY_SDK

final class ViewController: UIViewController {
    
    //MARK: - Properties
    private let igasdk = IGASDK.shared
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        addView()
        setLayout()
    }
    
    //MARK: - Method
    private func configureUI(){
        self.title = "Login"
        self.view.backgroundColor = .white
    }
    
    private func addView(){
        
    }
    
    private func setLayout(){
        
    }
}


