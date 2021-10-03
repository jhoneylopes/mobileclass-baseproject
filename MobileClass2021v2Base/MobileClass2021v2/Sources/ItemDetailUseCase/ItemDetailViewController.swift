import UIKit

protocol ItemDetailViewControllerDelegate: AnyObject {
    func popItemDetailViewController()
}

final class ItemDetailViewController: UIViewController {

    var itemTitle: String?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainTextView: UITextView!
    
    
    weak var delegate: ItemDetailViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        mainTextView.delegate = self
        titleLabel.text = itemTitle
    }

    private func closeItemDetailViewController() {
        delegate?.popItemDetailViewController()
    }
}

extension ItemDetailViewController: UITextViewDelegate {
    private func makeURL(defaultURL: URL) -> URL {
        let to: String = "test@gmail.com"
        let gmailUrl = URL(string: "googlegmail://co?to=\(to)")
        let outlookUrl = URL(string: "ms-outlook://compose?to=\(to)")
        let yahooMail = URL(string: "ymail://mail/compose?to=\(to)")
        let sparkUrl = URL(string: "readdle-spark://compose?recipient=\(to)")
        if let gmailUrl = gmailUrl, UIApplication.shared.canOpenURL(gmailUrl) {
            return gmailUrl
        } else if let outlookUrl = outlookUrl, UIApplication.shared.canOpenURL(outlookUrl) {
            return outlookUrl
        } else if let yahooMail = yahooMail, UIApplication.shared.canOpenURL(yahooMail) {
            return yahooMail
        } else if let sparkUrl = sparkUrl, UIApplication.shared.canOpenURL(sparkUrl) {
            return sparkUrl
        }
        return defaultURL
    }
    func textView(_ textView: UITextView, shouldInteractWith URL: URL,
                  in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        if URL.absoluteString.contains("test@gmail.com") {
            UIApplication.shared.open(makeURL(defaultURL: URL))
        } else {
            self.showAlertCall()
        }
        return false
    }
}

// MARK: - UIAlertController

extension ItemDetailViewController {
    func showAlertCall() {
        let alert = UIAlertController(title: "Ligação!",
                                      message: "Você deseja realizar uma ligação?",
                                      preferredStyle: .alert)

        let saveAction = UIAlertAction(title: "Chamar", style: .default) { action in

            guard let number = URL(string: "tel://" + "32988362574") else { return }
            UIApplication.shared.open(number)
        }

        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel)

        alert.addAction(saveAction)
        alert.addAction(cancelAction)

        present(alert, animated: true)
    }
}
