//
//  Model.swift
//  todolist
//
//  Created by Quix Creations Singapore iOS 1 on 13/7/15.
//  Copyright (c) 2015 Terry Chia. All rights reserved.
//

import UIKit
import CoreData

@objc(Model)    //Add for objective C

class Model: NSManagedObject {

    //properties feeding the atributes in our entity
    //must match the entity atributes
    
    @NSManaged var item:String
    @NSManaged var quantity: String
    @NSManaged var info: String
    
}
