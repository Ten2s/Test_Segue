//
//  GetAlbumnames.swift
//  filename
//
//  Created by linc on 2020/01/09.
//  Copyright © 2020 linc. All rights reserved.
//

import Foundation
import Photos

class Getalbumnames
{
    var albumNames: [String] = []
    
    func getNames(){
         // 앨범 정보
        let options:PHFetchOptions = PHFetchOptions()
        let getAlbums : PHFetchResult = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: options)
        print(getAlbums)
        for i in 0 ..< getAlbums.count{
            let collection = getAlbums[i]
           // . localizedTitle = 앨범 타이틀
            let title : String = collection.localizedTitle!
            albumNames.append(title)
            if(collection.estimatedAssetCount != nil){
               // . estimatedAssetCount = 앨범 내 사진 수
               let count : Int = collection.estimatedAssetCount
             }
            else{
             }
        }
    }
}
