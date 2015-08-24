//
//  Link.swift
//  Favourites-Swift
//
//  Created by Cenny Davidsson on 2015-08-24.
//  Copyright (c) 2015 Linköpings University. All rights reserved.
//

import Foundation

/*
    Detta är ett ytterst enkelt modellobjekt som innehåller en property: en URL.
    Ni ska utöka modellen så att den även kan lagra en titel för varje länk.
*/

struct Link {
    let url: NSURL
}

/*
    För att kunna jämnföra en Link struct med en annan så
    anpassar man protokollet equatable.
*/

// MARK: Equatable

extension Link: Equatable {}

// Om de har samma url så ansses de vara likvärdiga
func == (lhs: Link, rhs: Link) ->Bool {
    return lhs.url.description == rhs.url.description
}

// MARK: Static functions

extension Link {
    
    // Retunerar en lista av fördefinerade länkar
    static func delaultLinks() -> [Link] {
        let links = [
            Link(url:NSURL(string: "http://lisam.liu.se")!),
            Link(url:NSURL(string: "http://www.ida.liu.se/~725G60/index.sv.shtml")!),
            Link(url:NSURL(string: "http://developer.apple.com")!),
            Link(url:NSURL(string: "http://www.youtube.com/watch?v=UF8uR6Z6KLc")!)
        ]
        
        return links
    }
}