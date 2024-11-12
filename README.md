### Steps to Run the App

1. Install CocoaPods if not already installed
2. Run `pod install` in the root directory
3. Open the `Recipe.xcworkspace` file to launch the app in Xcode
4. Run the app in the simulator

### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?

1. **Architecture & Dependency Injection**

   - Implemented a clean MVVM architecture with clear separation of concerns
   - Used Swinject for dependency injection to ensure loose coupling and testability
   - Created modular components with Assembly pattern for better scalability

2. **Testing**

   - Added unit tests for view models and core functionality
   - Implemented mock repositories for testing data layer
   - Focused on testing image caching mechanism

3. **Performance**

   - Built an efficient image caching system
   - Implemented lazy loading for images
   - Used SwiftUI's native view lifecycle management

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?

Total time: ~5 hours

Breakdown:

- Initial setup and architecture planning: 1 hour
- Core functionality implementation: 1.5 hours
- UI/UX development: 1 hour
- Testing and refinement: 1 hour
- Documentation: 0.5 hours

### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?

1. **SwiftUI vs UIKit**

   - Chose SwiftUI for rapid development and modern UI patterns
   - Trade-off: Less control over fine-grained UI customization

2. **Dependency Injection**

   - Used Swinject for robust DI framework
   - Trade-off: Added complexity and learning curve for simpler use cases

3. **Image Caching**

   - Implemented custom image caching instead of using a third-party library
   - Trade-off: More control but potentially missing optimizations from established libraries

### Weakest Part of the Project: What do you think is the weakest part of your project?

1. **Error Handling**

   - Could benefit from more comprehensive error handling
   - Network error scenarios could be handled more gracefully

2. **UI Polish**

   - Basic UI implementation focused on functionality
   - Could use more refined animations and transitions

3. **Testing Coverage**

   - While core functionality is tested, testing could be more comprehensive
   - More tests could be added

### External Code and Dependencies: Did you use any external code, libraries, or dependencies?

1. **Swinject**

   - Used for dependency injection
   - Version specified in Podfile
   - Helps manage object creation and dependency management

2. **CocoaPods**

   - Package manager for handling dependencies
   - Used to integrate Swinject

### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.
