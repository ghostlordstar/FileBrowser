//
//  SFile.swift
//  SwiftyFileBrowser
//
//  Created by ghostlordstar on 2021/11/24.
//

import Foundation

// 文件状态
public enum SFileState {
    case notDownloaded                  // 未下载
    case readyToDownload                // 等待下载
    case downloading(progress: Float)   // 下载进度，0.0~1.0
    case pausedDownload(progress: Float)// 暂停中
    case downloaded                     // 下载完成
}

public enum SFileType {
    case folder
    case image(format: String?)
    case music(format: String?)
    case video(format: String?)
    case text(format: String?)
    case zip(format: String?)
    case html
    case pdf
    case unknow
}

public protocol SFile: AnyObject {
    var identifier: String { get set }
    var filePath: String? {get set}
    var fileName: String? { get set }
    var detailText: String? { get set } // 只能显示两行，居中显示
    var fileType: SFileType { get set }
    var state: SFileState { get set }
    var thumbnail: UIImage? { get set } // 缩略图
    var appIcon: UIImage? {get set}     // appIcon
}

public extension SFile {
    func copyFromFile(file: SFile) {
        if self.identifier == file.identifier {
            self.filePath = file.filePath
            self.fileType = file.fileType
            self.fileName = file.fileName
            self.detailText = file.detailText
            self.state = file.state
            self.thumbnail = file.thumbnail
            self.appIcon = file.appIcon
        }
    }
}
