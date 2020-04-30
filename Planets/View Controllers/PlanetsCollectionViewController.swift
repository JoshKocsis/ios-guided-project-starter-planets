//
//  PlanetsCollectionViewController.swift
//  Planets
//
//  Created by Josh Kocsis on 4/29/20.
//  Copyright © 2020 Lambda Inc. All rights reserved.
//

import UIKit


class PlanetsCollectionViewController: UICollectionViewController {

    let planetController = PlanetController()
    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return planetController.planets.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlanetCell", for: indexPath) as? PlanetCollectionViewCell else { return UICollectionViewCell() }
        
        let planet = planetController.planets[indexPath.item]
        cell.planetImageView.image = planet.image
        cell.planetLabel.text = planet.name
        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let planet = planetController.planets[indexPath.item]
        self.title = planet.name
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navController = segue.destination as? UINavigationController,
            let settingsVC = navController.viewControllers.first as? SettingsViewController {
                settingsVC.delegate = self
        }
    }
}


extension PlanetsCollectionViewController: SettingsDelegate {
    func didTogglePluto() {
        self.collectionView.reloadData()
    }
}
