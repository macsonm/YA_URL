import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let linkPicture = "https://mota.ru/upload/wallpapers/source/2014/12/03/20/02/42102/005.jpg"
        
        guard let url = URL(string: linkPicture) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            //print("Done")
            
            guard let data = data else { return }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.imageView?.image = image
            }
        }
        
        task.resume()
        
    }

}
