import UIKit

class ColorsTableVC: UIViewController {
    
    var color: [UIColor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomColors()
    }
    func addRandomColors(){
        for _ in 0..<50{
            color.append(createRandomColor())
        }
    }
    func createRandomColor() -> UIColor {
        let randomColor = UIColor(red: CGFloat.random(in:0...1),
                                  green: CGFloat.random(in:0...1),
                                  blue: CGFloat.random(in: 0...1),
                                  alpha: 1)
        return randomColor
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let destVC = segue.destination as! ColorDetailVC
        destVC.color = sender as? UIColor
    }
    
}
extension ColorsTableVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return color.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell") else {
            return UITableViewCell()
        }
        cell.backgroundColor = color[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = color[indexPath.row]
        performSegue(withIdentifier: "ToColorsDetailVC", sender: color)
    }
}
