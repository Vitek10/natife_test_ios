//
//  ViewController.swift
//  natife_test_ios
//
//  Created by Разработчик on 25.03.2022.
//

import UIKit

var titleTextPost: String = ""
var previewTextPost: String = ""
var imagesPost = [String]()

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let parser = Parser()
    var posts = [Post]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        parser.parse {
            data in
            self.posts = data.posts.sorted{$0.likes_count > $1.likes_count && $0.timeshamp < $1.timeshamp }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        tableView.dataSource = self
        
    }
}
    extension ViewController:UITableViewDataSource{
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return posts.count
       }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let post: Post
        post = posts[indexPath.row]
        let timeShampText = TimeInterval(post.timeshamp)/1000
        let timeAgo = Date(timeIntervalSinceNow: -timeShampText)
        cell.titleCell.text = post.title
        cell.previewTextCell.text = post.preview_text
        cell.likesCountCell.text = String(post.likes_count)
        cell.timeShampCell.text = timeAgo.timeAgoDisplay(timeAgo: timeAgo)
        cell.showInFullButton.tag = indexPath.row
        cell.showInFullButton.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        return cell
       }
        
   @objc func clickButton(sender:UIButton){
        let indexPath1 = IndexPath(row:sender.tag,section: 0)
        let api = URL(string: "https://raw.githubusercontent.com/aShaforostov/jsons/master/api/posts/\(posts[indexPath1.row].postId).json")
       URLSession.shared.dataTask(with: api!) {
           data, response, error in
           if error != nil {
               print("Error")
               return
           }
           do {
               let result = try JSONDecoder().decode(SpecificPost.self, from: data!)
               print(result)
               titleTextPost = result.post.title
               previewTextPost = result.post.text
               imagesPost = result.post.images
           } catch {
               print("Error")
           }
       }.resume()
        let home = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! DetailViewController
        self.navigationController?.pushViewController(home, animated: true)
        }
}
