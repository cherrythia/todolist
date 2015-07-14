//
//  ItemViewController.swift
//  todolist
//
//  Created by Quix Creations Singapore iOS 1 on 13/7/15.
//  Copyright (c) 2015 Terry Chia. All rights reserved.
//

import UIKit
import CoreData

class ItemViewController: UIViewController {

    @IBOutlet var textFieldItem: UITextField!
    @IBOutlet var textFieldQuantity: UITextField!
    @IBOutlet var textFieldInfo: UITextField!
    
    var item : String = ""
    var quantity : String = ""
    var info : String = ""
    
    var existingItem : NSManagedObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if (existingItem != nil) {
            textFieldItem.text = item
            textFieldQuantity.text = quantity
            textFieldInfo.text = info
        }
    }
    
    @IBAction func saveTapped(sender: AnyObject) {
        
        //Reference to our app delegate
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        //Reference moc
        let contxt: NSManagedObjectContext = appDel.managedObjectContext!
        let en = NSEntityDescription.entityForName("List", inManagedObjectContext: contxt)
        
        
        if (existingItem != nil){
            existingItem.setValue(textFieldItem.text, forKey: "item")
            existingItem.setValue(textFieldQuantity.text, forKey: "quantity")
            existingItem.setValue(textFieldInfo.text, forKey: "info")
        }
        
        else{   //new item created.
            
            //Create Instance of our data model and initialize
            var newItem = Model(entity:en!,insertIntoManagedObjectContext: contxt)
            
            //Map our properties
            newItem.item = textFieldItem.text
            newItem.quantity = textFieldQuantity.text
            newItem.info = textFieldInfo.text
            
            println(newItem)
        }
        
        //Save our context
        contxt.save(nil)
        
        //Back to root controller
        self.navigationController!.popToRootViewControllerAnimated(true)
    }

    @IBAction func cancelTapped(sender: AnyObject) {
        self.navigationController!.popToRootViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
