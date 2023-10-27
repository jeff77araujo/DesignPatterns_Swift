// MARK: - Criação: Singleton

class DeathStarSuperLaser {
    static let sharedsInstance = DeathStarSuperLaser()
    
    private init() {
        // Private initialization to ensure just one instance is created.
    }
}

// MARK: - Usage

let laser = DeathStarSuperLaser.sharedsInstance
