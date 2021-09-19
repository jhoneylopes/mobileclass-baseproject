import UIKit

final class FilterViewController: UIViewController {
    private var databaseService: DatabaseServiceType?

    @IBOutlet weak var switchComponent: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        databaseService = DependencyManager.resolve(DatabaseServiceType.self)

        let isFilterAZ: Bool? = databaseService?.load(key: .filterSortAZ)
        switchComponent.isOn = isFilterAZ ?? false        
    }

    @IBAction func sortOptionAction(_ sender: UISwitch) {
        databaseService?.save(object: sender.isOn, forKey: DatabaseServiceKey.filterSortAZ)
    }
}
