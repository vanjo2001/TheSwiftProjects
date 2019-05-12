//
//  ViewController.swift
//  CollectionView
//
//  Created by Vanjo on 25/12/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var array: [Menu] = {
        var blankMenu = Menu()
        blankMenu.imageName = "CocaCola"
        blankMenu.name = "CocaCola"
        
        var blankMenu2 = Menu()
        blankMenu2.imageName = "coffee"
        blankMenu2.name = "Coffee"
        
        return [blankMenu, blankMenu2]
    }()

    @IBOutlet weak var myCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showVC" {
            if let vc = segue.destination as? DetailViewController {
                let menu = sender as? Menu
                vc.menu = menu
            }
        }
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as? MyCollectionViewCell {
            cell.menu = array[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let menu = array[indexPath.row]
        performSegue(withIdentifier: "showVC", sender: menu)
    }
    
    
}

