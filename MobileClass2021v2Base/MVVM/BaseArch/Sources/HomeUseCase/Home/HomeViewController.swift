//  Copyright © 2017 Jhoney Lopes. All rights reserved.

import UIKit

class HomeViewController: UIViewController {

    // MARK: ViewModel

    var viewModel: HomeViewModelProtocol! {
        didSet {
            self.viewModel.didTapCell = { [unowned self] identifier in
                self.performSegue(withIdentifier: identifier, sender: self)
            }
        }
    }

    // MARK: Properties

    @IBOutlet var tableView: UITableView!

    // MARK: Init

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"

        viewModel = HomeViewModel()

        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: Coordinator

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == viewModel.homeDetailsIdentifier {
            // Aqui vamos adicionar o item que será parte do detalhes
        }
    }
}

// Mark: UITableViewDelegate
extension HomeViewController: UITableViewDelegate {

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        viewModel.goToHomeDetails()
    }
}

// Mark: UITableViewDataSource
extension HomeViewController: UITableViewDataSource {

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {

        return 1
    }


    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        let cell = UITableViewCell()
        cell.backgroundColor = .orange

        return cell
    }
}
