import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        DependencyInjector.load()

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(
            name: "Default Configuration",
            sessionRole: connectingSceneSession.role
        )
    }

    // MARK: CoreData

    func applicationWillTerminate(_ application: UIApplication) {
        self.saveContext()
    }

    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         O "container" de persistência para a aplicação. Essa implementação cria e retorna um contêiner, tendo carregado nele o armazenamento do aplicativo. Essa propriedade é opcional, pois existem condições de erro legítimas que podem causar falha na criação do armazenamento.
        */
        let container = NSPersistentContainer(name: "MobileClass2021v2")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
            // Substitua esta implementação por um código para tratar o erro de maneira apropriada.
            // fatalError () faz com que o aplicativo gere um log de travamento e seja encerrado. Você não deve usar esta função em um aplicativo de remessa, embora possa ser útil durante o desenvolvimento.
             /*
             Os motivos típicos para um erro aqui incluem:
             * O diretório pai não existe, não pode ser criado ou não permite a gravação.
             * O armazenamento persistente não está acessível devido a permissões ou proteção de dados quando o dispositivo está bloqueado.
             * O dispositivo está sem espaço.
             * O armazenamento não pôde ser migrada para a versão do modelo atual.

             Verifique a mensagem de erro para determinar qual era o problema real.
             */
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }})
        return container
    }()

    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Substitua esta implementação por um código para tratar o erro de maneira apropriada.
                // fatalError() faz com que o aplicativo gere um log de travamento e seja encerrado. Você não deve usar esta função em um aplicativo de remessa, embora possa ser útil durante o desenvolvimento.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
