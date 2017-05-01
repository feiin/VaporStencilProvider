import Vapor

public final class VaporStencilProvider: Vapor.Provider {
    
    public init(config: Config) throws {
        
    }
    
    
    public func boot(_ drop: Droplet) {
        
        let renderer = StencilRenderer(viewsDir: drop.workDir + "Resources/Views")
        drop.view = renderer
    }
    
    /**
     Called after the Droplet has completed
     initialization and all provided items
     have been accepted.
     */
    public func afterInit(_ drop: Droplet) {
        
    }
    
    /**
     Called before the Droplet begins serving
     which is @noreturn.
     */
    public func beforeRun(_ drop: Droplet) {
        
    }
}
