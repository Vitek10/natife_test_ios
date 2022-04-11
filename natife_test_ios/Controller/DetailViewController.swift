//
//  HomeViewController.swift
//  natife_test_ios
//
//  Created by Разработчик on 29.03.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var previewTextLabel: UILabel!
    @IBOutlet weak var detailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 0, repeats: true){timer in
            self.titleTextLabel.text = titleTextPost
            self.previewTextLabel.text = previewTextPost
        }
        DispatchQueue.main.async {
            self.detailTableView.reloadData()
        }
        detailTableView.dataSource = self
    }
    
}
extension UIImageView
{
    func downloadImage(from url:URL){
        contentMode = .scaleToFill
        let dataTask = URLSession.shared.dataTask(with: url, completionHandler: {
            (data, response, error) in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
            let data = data, error == nil,
            let image = UIImage(data: data)
            else{
                return
            }
            DispatchQueue.main.async {
                self.image = image
            }
                  
        })
        dataTask.resume()
    }
}

extension DetailViewController:UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagesPost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailcell", for: indexPath) as! DetailTableViewCell
        cell.detailImageCell.downloadImage(from: URL(string: imagesPost[indexPath.row])!)
        cell.detailImageCell.layer.cornerRadius = 1
        return cell
  }
    
}
