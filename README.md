# News

News is a project that hopes to demonstrate a good architecture when writing MVVM apps.

## Architecture

### Assembly:

Assemblies are responsible for assembling application features, that is, creating object graphs.

The rule to follow in order to correctly use these assemblies is to never inject assemblies directly to other objects in the application. Objects can not be directly related to assemblies. In the case of navigators we might be tempted to inject an assembly to instantiate the new scene to navigate. As we said before, the objects can not have direct relation to the assemblies, so a solution to this problem would be to create a provider that provide us with the instance of a scene. In the News app, the provider of the detail scene is the assembly.

So you may be wondering, what are the advantages between this dependency container and Swinject? 
The differences with Swinject are minimal. We have all the advantages of a dependency container like Swinject except thread safety. In addition we have total control of the assemblies, and we do not have dependencies in third-party libraries.

### Navigator:
Navigators are responsible for navigating to a scene. They need the providers in order to provide the instances of the scenes. If the providers did not exist and, considering that we can't inject assemblies directly to the objects of the application, we would be attaching the navigator with the dependencies of the scenes. Keep in mind that the navigator could be used in more than one scene.

## Credits

The project architecture is inspired by the MVP architecture seen in the Architecture Course given by [Guillermo](https://github.com/gonzalezreal).
