//
//  MasterViewController.swift
//  Favourites-Swift
//
//  Created by Cenny Davidsson on 2015-08-24.
//  Copyright (c) 2015 Linköpings University. All rights reserved.
//

/*
    Denna vykontroller styr en tabell som visar länkar.
    När en användare trycker på en länk pushas DetailViewController in på iPhone,
    medan på iPad så uppdateras bara DetailViewController med en ny länk.
    Observera även att prepareForSegue körs för att skicka länken till den pushade
    vykontrollern på iPhone.

    Det du behöver göra i denna vykontroller är tre saker:

    1: Användaren ska kunna ta bort länkar med swipe-to-delete och genom att gå in
    i editing mode.

    2: Cellerna inte bara visa URLen på länken men även en titel. För att göra det
    behöver ni ändra stil på tabellvycellen som visas. Ni får göra en egen cell,
    men ni kan även använda någon av de andra inbyggda cellstilarna. Se även till att
    uppdatera modellen (Link) så att den har en property för en titel.

    3: Användaren ska kunna lägga in nya länkar med en modal vykontroller. Vy-kontrollern
    ska innehålla ett formulär för att skriva in en URL och en titel på länken. Ni kan
    skriva ett eget delegatprotokoll eller använda en unwind segue för att skicka data tillbaka till denna
    vykontroller när användaren fyllt i formuläret. På iPad är det lämpligt att använda sig
    av stilen UIModalPresentationFormSheet för att presentera vykontrollern.
*/

import UIKit

class MasterViewController: UITableViewController {
    
    var detailViewController: DetailViewController? = nil
    var links = [Link]()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            self.clearsSelectionOnViewWillAppear = false
            self.preferredContentSize = CGSize(width: 320.0, height: 600.0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Avkommentera följande för att enkelt få en edit-knapp
        //self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        let controllers = self.splitViewController!.viewControllers
        detailViewController = controllers[controllers.count-1].topViewController as? DetailViewController
    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let indexPath = self.tableView.indexPathForSelectedRow() where segue.identifier == "showDetail" {
            
            // Hämta länken från våran array.
            let link = links[indexPath.row]
            
            // Skicka länken till detaljvyn.
            let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
            controller.link = link
            
            // Splitview configuration
            controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
            controller.navigationItem.leftItemsSupplementBackButton = true
            
        }
    }
    
    // MARK: - Table View
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return links.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Hämta cell.
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        // Hämta data.
        let link = links[indexPath.row]
        
        // Konfigurera cellen
        cell.textLabel!.text = link.url.description
        return cell
    }
}

