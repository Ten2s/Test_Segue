//
//  GetPhoto.swift
//  filename
//
//  Created by linc on 2020/01/09.
//  Copyright © 2020 linc. All rights reserved.
//

import Foundation
import Photos
import PhotosUI


class GetPhoto
{
    private var albumName: String = ""
    var images: [UIImage] = []
    private var photo: UIImage!
    
    init()
    {
        allPhotos()
    }
    func addImgToArray(uploadImage: UIImage)
    {
        images.append(uploadImage)
    }
    
    
    func pushalbumName(name: String)
    {
        albumName = name
    }
    
    
    func fetchAlbumPhotos(albumName: String)
    {
        var assetCollection = PHAssetCollection()
        var albumFound = Bool()
        var photoAssets = PHFetchResult<AnyObject>()
        let fetchOptions = PHFetchOptions()
        
        images.removeAll()
        pushalbumName(name: albumName)

        fetchOptions.predicate = NSPredicate(format: "title = %@", self.albumName)
        let collection:PHFetchResult = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: fetchOptions)

        if let firstObject = collection.firstObject{
            //found the album
            assetCollection = firstObject
            albumFound = true
        }
        else { albumFound = false }
        _ = collection.count
        photoAssets = PHAsset.fetchAssets(in: assetCollection, options: nil) as! PHFetchResult<AnyObject>
        let imageManager = PHCachingImageManager()
        photoAssets.enumerateObjects{(object: AnyObject!,
            count: Int,
            stop: UnsafeMutablePointer<ObjCBool>) in

            if object is PHAsset{
                let asset = object as! PHAsset

                let imageSize = CGSize(width: asset.pixelWidth,
                                       height: asset.pixelHeight)

                /* For faster performance, and maybe degraded image */
                let options = PHImageRequestOptions()
                options.deliveryMode = .fastFormat
                options.isSynchronous = true

                imageManager.requestImage(for: asset,
                                                  targetSize: imageSize,
                                                  contentMode: .aspectFill,
                                                  options: options,
                                                  resultHandler: {
                                                    (image, info) -> Void in
                                                    self.photo = image!
                                                    
                                                    self.addImgToArray(uploadImage: self.photo)
                })

            }
        }
        
        print(images.count)
    }
    
    
    func allPhotos()
    {
        var allPhotos: PHFetchResult<PHAsset>!
        var allphotosOption = PHFetchOptions()
        
        images.removeAll()
        
        allphotosOption.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        allPhotos = PHAsset.fetchAssets(with: allphotosOption)
        let imageManager = PHCachingImageManager()
        allPhotos.enumerateObjects{(object: AnyObject!,
            count: Int,
            stop: UnsafeMutablePointer<ObjCBool>) in

            if object is PHAsset{
                let asset = object as! PHAsset

                let imageSize = CGSize(width: asset.pixelWidth,
                                       height: asset.pixelHeight)

                /* For faster performance, and maybe degraded image */
                let options = PHImageRequestOptions()
                options.deliveryMode = .fastFormat
                options.isSynchronous = true

                imageManager.requestImage(for: asset,
                                                  targetSize: imageSize,
                                                  contentMode: .aspectFill,
                                                  options: options,
                                                  resultHandler: {
                                                    (image, info) -> Void in
                                                    self.photo = image!
                                                    
                                                    self.addImgToArray(uploadImage: self.photo)

                })

            }
        }
        
        print(images.count)
    }
}


