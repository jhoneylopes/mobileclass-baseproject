import UIKit
import CoreData

class HomeViewController: UIViewController, ItemDetailViewControllerDelegate {
    private let refreshControl = UIRefreshControl()
    private var databaseService: DatabaseServiceType?

    var coreDataObjects: [NSManagedObject] = []

    func popItemDetailViewController() {
        // Handle this delegate func
    }

    @IBOutlet var tableView: UITableView!
    private let homeItemDetailSegue = "HomeItemDetailSegue"

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home List"
        setupTableView()
        databaseService = DependencyManager.resolve(DatabaseServiceType.self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        coreDataObjects = loadFromCoreData()
        reloadHomeList()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == homeItemDetailSegue {
            guard let indexPath = sender as? IndexPath else { return }
            let item = coreDataObjects[indexPath.row]

            let vc = segue.destination as? ItemDetailViewController
            vc?.itemTitle = item.value(forKeyPath: "title") as? String
            vc?.delegate = self
        }
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        tableView.estimatedRowHeight = 55
        tableView.rowHeight = UITableView.automaticDimension

        tableView.refreshControl = refreshControl
        refreshControl.addTarget(
            self, action: #selector(refreshData), for: .valueChanged
        )
    }

    private func sortByFilter() {
        let isFilterAZ: Bool? = databaseService?.load(key: .filterSortAZ)
        if isFilterAZ ?? false {
            coreDataObjects.sort { lhs, rhs in
                guard let lhsObj = lhs.value(forKeyPath: "title") as? String,
                      let rhsObj = rhs.value(forKeyPath: "title") as? String else {
                    return false
                }
                return lhsObj < rhsObj
            }
        }
    }

    private func reloadHomeList() {
        self.tableView.reloadData()
        self.sortByFilter()
    }

    @IBAction func addNewItemListAction(_ sender: Any) {
        addItem()
    }

    @objc func refreshData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) { [weak self] in
            self?.reloadHomeList()
            self?.refreshControl.endRefreshing()
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: homeItemDetailSegue, sender: indexPath)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreDataObjects.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let item = coreDataObjects[indexPath.row]
        cell.textLabel?.text = item.value(forKeyPath: "title") as? String
        cell.accessoryType = .disclosureIndicator

        // Como estamos utilizando a cell padrão, precisamos falar que a Label pode ter várias linhas
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.numberOfLines = 0
        //

        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteFromCoreData(index: indexPath.row)
        }
    }
}

// MARK: - UIAlertController

extension HomeViewController {
    func addItem() {
        let alert = UIAlertController(title: "Novo item",
                                      message: "Adicionar um item novo",
                                      preferredStyle: .alert)

        let saveAction = UIAlertAction(title: "Salvar", style: .default) {
            [weak self] action in

            guard let textField = alert.textFields?.first,
                  let nameToSave = textField.text else {
                return
            }

            self?.save(name: nameToSave)
        }

        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel)

        alert.addTextField()

        alert.addAction(saveAction)
        alert.addAction(cancelAction)

        present(alert, animated: true)
    }
}

// MARK - CoreData

extension HomeViewController {
    func save(name: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }

        let managedContext = appDelegate.persistentContainer.viewContext

        guard let entity = NSEntityDescription.entity(forEntityName: "HomeItem", in: managedContext) else { return }

        let item = NSManagedObject(entity: entity, insertInto: managedContext)

        item.setValue(name, forKeyPath: "title")

        do {
            try managedContext.save()
            self.coreDataObjects.append(item)
            self.reloadHomeList()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }

    fileprivate func loadFromCoreData() -> [NSManagedObject] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return []
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "HomeItem")

        do {
            let objects = try managedContext.fetch(fetchRequest)
            return objects
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return []
        }
    }

    fileprivate func deleteFromCoreData(index: Int) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }

        let managedContext = appDelegate.persistentContainer.viewContext

        let object = loadFromCoreData()[index]
        managedContext.delete(object)

        do {
            try managedContext.save()
            coreDataObjects.remove(at: index)
            self.reloadHomeList()
        } catch let error as NSError {
            print("Could not delete. \(error), \(error.userInfo)")
        }
    }
}
