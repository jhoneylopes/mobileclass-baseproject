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
        cell.textLabel?.text = "🍎 Item \(indexPath.row)"
        cell.detailTextLabel?.text = "Description Label"
        cell.imageView?.image = UIImage(systemName: "star")
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        }
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
