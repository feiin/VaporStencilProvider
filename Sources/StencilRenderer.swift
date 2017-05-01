//
//  StencilRenderer.swift
//  VaporStencilProvider
//
// 
//
//

import Vapor
import Stencil
import PathKit

extension String {
    var utf8Array: [UInt8] {
        return Array(utf8)
    }
}


public final class StencilRenderer: ViewRenderer {
    
    public init(viewsDir: String) {
        self.templateDirectory = viewsDir
        self.`extension` = Extension()
    }
    
    public var fileExtension: String { return "stencil" }
    private let `extension`: Extension
    public let templateDirectory:String
    
    public func make(_ path: String, _ context: Node) throws -> View {
        
        let loader = FileSystemLoader(paths: [Path(templateDirectory)])
        let environment = Environment(loader: loader, extensions: [`extension`])
        var dictContext = [String:Any]()
        
        switch(context) {
        case Node.object(_):
            dictContext = context.rawValue as! [String:Any]
        default:
            dictContext.updateValue(context.rawValue, forKey: "Model")
        }
        
        dictContext["loader"] = loader
        let content =  try environment.renderTemplate(name: path,  context: dictContext)
        
        return View(data:content.utf8Array)
        
    }
    
    
    public init(viewsDir: String, extension: Extension = Extension()) {
        self.templateDirectory = viewsDir
        self.`extension` = `extension`
        
    }
}
