//
//  MovieVC.swift
//  MVVMPattern
//
//  Created by Abhijit Kotangale on 09/02/20.
//  Copyright © 2020 Abhijit Kotangale. All rights reserved.
//

import UIKit

class MovieVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblView: UITableView!
    var getMovieDataArr = [MovieViewModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getMoviewData()
    }
    
    func getMoviewData() {
        
        MovieServiceManager.shareInstanceOfMovieData.getAllMovieDataFromServer { (movies, error) in
            
            if error == nil {
                
                self.getMovieDataArr = movies?.map({return MovieViewModel(movie: $0)}) ?? []
                DispatchQueue.main.async {
                    self.tblView.reloadData()
                }
            }
            else{
                print("error is = \(error?.localizedDescription)")
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getMovieDataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let finalMovieData = getMovieDataArr[indexPath.row]
        
        cell.textLabel?.text = finalMovieData.artistName
        cell.detailTextLabel?.text = finalMovieData.trackName
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
