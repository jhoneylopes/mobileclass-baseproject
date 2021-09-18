import UIKit

class HomeViewController: UIViewController, ItemDetailViewControllerDelegate {
    func popItemDetailViewController() {
        // Handle this
    }

    @IBOutlet var tableView: UITableView!
    private let homeItemDetailSegue = "HomeItemDetailSegue"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 55
        tableView.rowHeight = UITableView.automaticDimension
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == homeItemDetailSegue {
            let vc = segue.destination as? ItemDetailViewController
            vc?.delegate = self
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: homeItemDetailSegue, sender: nil)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "🍎 Item \(indexPath.row) \n\n In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design."
        cell.detailTextLabel?.text = "Description Label"
        cell.imageView?.image = UIImage(systemName: "star")
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.blue.withAlphaComponent(0.3)
        }
        cell.accessoryType = .disclosureIndicator

        // Como estamos utilizando a cell padrão, precisamos falar que a Label pode ter várias linhas
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.numberOfLines = 0
        //

        return cell
    }
}
