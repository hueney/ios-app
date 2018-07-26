//
//  JSONStructures.swift
//  Listen.Moe
//
//  Created by Kelson Vella on 12/4/17.
//  Copyright © 2017 Disre. All rights reserved.
//

import Foundation

struct Login: Codable {
    var message: String
    var token: String
    var apiKey: String?
    
}

//struct section {
//    var name:String
//    var songList:[song]
//}

//struct favorite: Codable {
//    var success:Bool
//    var songs:[song]?
//    var extra:extra?
//}

struct song: Codable {
    var id:Int
    var artist:String
    var title:String
    var anime:String?
    var enabled:Bool?
    var titleFirstLetter:String{
        if self.title != "" {
            let str = String(self.title[self.title.startIndex]).uppercased().unicodeScalars.first
            let alpha = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
            let digits = CharacterSet.decimalDigits
            if digits.contains(str!) {
                return "1"
            }
            else if alpha.contains(str!) {
                return String(self.title[self.title.startIndex]).uppercased()
            } else {
                return "*"
            }
        } else {
            return ""
        }
    }
    //    var artistFirstLetter:String{
    //        return String(self.artist[self.artist.startIndex]).uppercased()
    //    }
}

struct extra:Codable {
    var requests:Int
}

struct unfavorite: Codable {
    var success:Bool
    var favorite:Bool
}

struct songRequest: Codable {
    var success:Bool
}

//old login

//struct Response: Codable {
//    var message: String?
//    var token: String?
////    var success: Bool
//}

struct favorites: Decodable {
    var message: String
    var favorite: [favorite]
}

struct favorite: Decodable {
    var albums: [album]
    var artists: [artist]
    var duration: Int
    //    var groups: []
    var id: Int
    var lastPlayed: String
    //    var notes: []
    //    var source: []
    //    var tags: []
    var title: String
    var uploader: [uploader]
    var titleFirstLetter:String{
        if self.title != "" {
            let str = String(self.title[self.title.startIndex]).uppercased().unicodeScalars.first
            let alpha = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
            let digits = CharacterSet.decimalDigits
            if digits.contains(str!) {
                return "1"
            }
            else if alpha.contains(str!) {
                return String(self.title[self.title.startIndex]).uppercased()
            } else {
                return "*"
            }
        } else {
            return ""
        }
    }
}

struct album: Decodable {
    var id: Int
    var name: String
    var nameRomaji: String?
    var image: String
    var releaseDate: String
}

struct artist: Decodable {
    var id: Int
    var name: String
    var nameRomaji: String?
    var image: String
}

struct uploader: Decodable {
    var uuid: Int
    var username: String
    var displayName: String
}

struct Base: Decodable {
    let song_id: Int?
    let artist_name: String?
    let song_name: String?
    let anime_name: String?
    let requested_by: String?
    let listeners: Int?
    //not working for some reason
    //let last: [Last]
    //let second_last: [Second]
    //let extended: [Extended]
}

struct Last: Decodable {
    let song_name: String?
    let artist_name: String?
}

struct Second: Decodable {
    let song_name: String?
    let artist_name: String?
}

struct Extended: Decodable {
    let favorite: Bool?
    let queue: [Queue]
}

struct Queue: Decodable {
    let songsInQueue: Int?
    let hasSongInQueue: Bool?
    let inQueueBeforeUserSong: Int?
    let userSongsInQueue: Int?
}

struct user: Decodable {
    let success: Bool
    let id: Int
    let username: String
}
