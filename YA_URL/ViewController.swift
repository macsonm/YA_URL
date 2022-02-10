import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadWsb() { wsbname in
            self.label.text = wsbname[0].ticker
        }
        
        loadPicture()
        
    }
    
    
    //загрузка и возврат данных
    func loadWsb(_ completion: ((Wsb) -> Void)?) {
        let stringUrl = "https://dashboard.nbshare.io/api/v1/apps/reddit"
        guard let url1 = URL(string: stringUrl) else { return }
        
        let taskWsb = URLSession.shared.dataTask(with: url1) { data, response, error in
            if let error = error{
                debugPrint(error)
            }
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let wsb = try decoder.decode(Wsb.self, from: data)
                
                //передаем в комплишн данные
                DispatchQueue.main.async {
                    completion?(wsb)
                    //self.label.text = wsb[0].ticker
                    //print("The \(wsb.ticker.utf8)")
                    
                }
            } catch {
                debugPrint(error)
            }
        }
        taskWsb.resume()
    
    }
    
    //загрузка, возврат данных и проставление значений на экран
    func loadPicture() {
        let linkPicture = "https://mota.ru/upload/wallpapers/source/2014/12/03/20/02/42102/005.jpg"
        
        guard let url = URL(string: linkPicture) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else { return }
            
            if let error = error {
                debugPrint(error.localizedDescription)
                return
            }
            
            if let response = response as? HTTPURLResponse {
                switch response.statusCode {
                case 200..<300: break
                default:
                    debugPrint("\(response.statusCode)")
                }
            }
            
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.imageView?.image = image
                //self.label.text =
            }
        }
        task.resume()
        
    }
}
