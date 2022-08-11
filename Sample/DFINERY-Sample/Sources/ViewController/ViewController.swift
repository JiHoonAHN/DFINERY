import UIKit
import DFINERY_SDK

final class ViewController: BaseVC {
    
    private let igasdk = IGASDK.shared
    
    //MARK: - Properties
    private let nameTextField : UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Write your name."
        return textfield
    }()
    
    private let jobTextField : UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Write your job."
        return textfield
    }()
    
    private let introduceLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "간단한 소개를 입력해주세요!"
        return label
    }()
    
    private let introduceMessage : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .systemCyan
        return textView
    }()
    
    private let joinButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor  = .systemBlue
        button.setTitle("Join", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        addView()
        setLayout()
    }
    
    //MARK: - Method
    override func configureUI() {
        self.title = "Join"
    }
    
    override func addView() {
        view.addSubviews(
            nameTextField,
            jobTextField,
            introduceLabel,
            introduceMessage,
            joinButton
        )
    }
    
    override func setLayout() {
        nameTextField.addConstraintLayout([
            equal(view, \.safeAreaLayoutGuide.topAnchor,constant: 20),
            equal(view, \.leadingAnchor, constant: 20),
            equal(view, \.trailingAnchor, constant: -20)
        ])
    }
}


