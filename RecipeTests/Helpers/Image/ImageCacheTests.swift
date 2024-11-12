import XCTest
@testable import Recipe

final class ImageCacheTests: XCTestCase {
    var imageCache: ImageCache!
    var testImageURL: URL!
    var testImage: UIImage!
    
    override func setUp() async throws {
        try await super.setUp()
        imageCache = ImageCache()
        testImageURL = URL(string: "https://example.com/test.jpg")!
        testImage = UIImage(systemName: "star.fill")!
    }
    
    override func tearDown() async throws {
        await imageCache.clearCache()
        imageCache = nil
        testImageURL = nil
        testImage = nil
        try await super.tearDown()
    }
    
    func testInsertAndGetImage() async throws {
        // Given
        let initialImage = await imageCache.get(testImageURL)
        XCTAssertNil(initialImage)
        
        // When
        await imageCache.insert(testImage, for: testImageURL)
        
        // Then
        let cachedImage = await imageCache.get(testImageURL)
        XCTAssertNotNil(cachedImage)
    }
    
    func testRemoveCache() async throws {
        // Given
        await imageCache.insert(testImage, for: testImageURL)
        let initialImage = await imageCache.get(testImageURL)
        XCTAssertNotNil(initialImage)
        
        // When
        await imageCache.removeCache(for: testImageURL)
        
        // Then
        let removedImage = await imageCache.get(testImageURL)
        XCTAssertNil(removedImage)
    }
    
    func testClearCache() async throws {
        // Given
        let secondURL = URL(string: "https://example.com/test2.jpg")!
        await imageCache.insert(testImage, for: testImageURL)
        await imageCache.insert(testImage, for: secondURL)
        
        // When
        await imageCache.clearCache()
        
        // Then
        let test1 = await imageCache.get(testImageURL)
        let test2 = await imageCache.get(secondURL)
        
        XCTAssertNil(test1)
        XCTAssertNil(test2)
    }
} 
